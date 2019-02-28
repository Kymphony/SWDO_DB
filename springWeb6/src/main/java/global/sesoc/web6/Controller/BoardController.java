package global.sesoc.web6.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.web6.dao.BoardDAO;
import global.sesoc.web6.util.FileService;
import global.sesoc.web6.util.PageNavigator;
import global.sesoc.web6.vo.BoardVO;
import global.sesoc.web6.vo.CustomerVO;
import global.sesoc.web6.vo.ReplyVO;

@Controller
//@RequestMapping("board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//페이지당 글 수
	final int countPerPage = 10;
	
	//페이지 이동 링크 그룹 당 페이지 수
	final int pagePerGroup = 5;
	
	//파일 업로드 경로
	final String uploadPath = "/boardfile";	//첨부된 파일들이 이름이 바뀌어 저장되는 위치
											//위치는 C드라이버
	
	@Autowired
	BoardDAO dao;

	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(@RequestParam(value="page", defaultValue="1") int page
						,@RequestParam(value="search", defaultValue="") String search
						, Model model
						, String op) {
		
	/*글 검색 부분*/
		//글 검색 기능은 검색 결과에 대해서도 페이징을 해줘야 하고
		//검색 한 내용중에서 다시 검색을 할때 기존 검색값이 풀리지 않은 상태에서 재검색이 되어야 한다.
		logger.info("(검색)넘어온 페이지 값:{}, 넘어온 검색내용:{}",page,search,op);
	/*글 검색 부분 끝*/
		
	/*페이징 주기 부분*/
		//게시판의 전체 글 갯수 파악하기
		int total = dao.getTotal(search,op);
		logger.debug("총 글 갯수:{}",total);
		
		//페이지 네비게이터 불러와서 스태틱 값 쓰기
		PageNavigator navi = new PageNavigator(countPerPage,pagePerGroup, page, total);

														//몇번째로부터				//몇개 뛰어넘어라
		ArrayList<BoardVO> boardlist = dao.boardlist(navi.getStartRecord(), navi.getCountPerPage(),search,op);
	/*페이징 주기 부분 끝*/	
		
		//입력날짜 다듬기
		for(BoardVO i:boardlist){i.setInputdate(i.getInputdate().substring(5, 16));}
		
		//board.jsp에 값 전송
		model.addAttribute("board", boardlist);
		model.addAttribute("navi", navi);
		model.addAttribute("search", search);
		
		return "board";
	}
	
	//글 작성 페이지로 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Model model, HttpSession session) {
		
		return "write";
	}
	
	//작성 글 DB에 저장
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writesave(BoardVO vo
							,MultipartFile upload
							,HttpSession session) {
		
		int i = 0;
		String id=(String)session.getAttribute("id");
		
		//      널이 아니고            업로드가 채워져 있으면
		if(upload != null && !upload.isEmpty()){
			
			String savedfile = FileService.saveFile(upload, uploadPath);//파일 이름을 바꿔서 리턴해줌
			vo.setOriginalfile(upload.getOriginalFilename());//BoardVO vo에 원래 파일명을 저장하고
			vo.setSavedfile(savedfile);						 //DB에 저장된 파일명을 저장한다.
			
		}
		
		try{
		
		i = dao.save(vo);	
			
		}catch(Exception e){e.printStackTrace();return "write";}
		
		if(i>0){logger.info("글 저장 성공");return "redirect:/board";}
		else{logger.info("글 저장 실패");return "write";}
	}
	
	
	/**
	 * 파일 다운로드
	 * @param boardnum 파일이 첨부된 글 번호
	 */
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(int boardnum, Model model, HttpServletResponse response) {
		BoardVO board = dao.content(boardnum);		//글 1개에 대한 정보
		
		//원래의 파일명
		String originalfile = new String(board.getOriginalfile());
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + board.getSavedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	
	//글 내용 읽기
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(int boardnum, Model model) {
		
		BoardVO vo = null;
		ArrayList<ReplyVO> re = null;
		try{
			//글 내용 읽어오기
			vo = dao.content(boardnum);
			vo.setInputdate(vo.getInputdate().substring(5, 16));
			
			//댓글 리스트 읽어오기
			re = dao.replyRead(boardnum);
			for(ReplyVO i:re){i.setInputdate(i.getInputdate().substring(5, 16));}
			
			
			//조회수 올리기
			dao.updateHits(boardnum);
			
			//JSP에 전송
			model.addAttribute("content", vo);
			model.addAttribute("reply", re);
			//model.addAttribute("replycount",replycount);
			
		}catch(Exception e){e.printStackTrace();}
	
		return "content";
	}
	
	
	//글 수정 페이지로 이동
	@RequestMapping(value = "/contentUpdate", method = RequestMethod.GET)
	public String rewirte(int boardnum, Model model) {
		
		BoardVO vo = null;
		
		try{
		vo = dao.content(boardnum);
		model.addAttribute("data", vo);
		
		}catch(Exception e){e.printStackTrace();}
		return "contentUpdate";
	}
	
	
	//글 수정 내용 DB에 보내기
	@RequestMapping(value = "/contentUpdate", method = RequestMethod.POST)
	public String rewrite(BoardVO vo,Model model) {
		
		int i = 0;
		
		try{
		
		i = dao.contentUpdate(vo);	
		if(i>0){logger.info("글 수정 성공"); return "redirect:/board";}
		else{logger.info("글 수정 실패");return "content";}
		
		}catch(Exception e){e.printStackTrace();return "content";}
	}
	
	//글 삭제하기
	@RequestMapping(value = "/contentDelete", method = RequestMethod.GET)
	public String delete(int boardnum) {
		
		int i = 0;
		
		try{
			i = dao.delete(boardnum);
			if(i>0){logger.info("글 삭제 성공"); return "redirect:/board";}
			else{logger.info("글 삭제 실패");return "content";}
			
		}catch(Exception e){e.printStackTrace();}
		return "redirect:board";
	}

/*	<내가 처음에 만든 글 검색> 단점: 검색 목록에 대한 페이징이 안됨.
	//글 검색
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(String op,String search,Model model) {
		
		ArrayList<BoardVO> vo = dao.search(op,search);
		logger.info("글 찾으러 가져가는 값 - 검색옵션:{}, 검색내용:{}",op,search);
		for(BoardVO i:vo){i.setInputdate(i.getInputdate().substring(5, 16));}
		model.addAttribute("board", vo);
		model.addAttribute("search_check", "checked");
		
		return "board";
	}
*/	
	//댓글 입력
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String relply(ReplyVO vo, HttpSession session) {
		logger.info("댓글 입력시 들어온 정보:{}",vo);
		int i = 0;
		//세션에서 로그인한 아이디를 읽는다
		String id = (String)session.getAttribute("id");
		
		//아이디를 reply객체에 추가
		vo.setId(id);
		
		//리플 정보를 테이블에 저장한다
		i = dao.replySave(vo);
		if(i==0){return "redirect:content";}
		
		//비회원이 댓글쓰는걸 막기위해 인터셉터에 reply추가
	
		//저장에 성공하면 읽던 글로 돌아간다. (본문 글, 댓글 포함)
	return "redirect:content?boardnum=" + vo.getBoardnum();
	}
}

