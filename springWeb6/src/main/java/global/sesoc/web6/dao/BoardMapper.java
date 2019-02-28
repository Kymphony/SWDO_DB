package global.sesoc.web6.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.web6.vo.BoardVO;
import global.sesoc.web6.vo.CustomerVO;
import global.sesoc.web6.vo.ReplyVO;

public interface BoardMapper {

	//아이디 중복확인 + 로그인 확인
	public CustomerVO idcheck(String custid);
	
	//글 저장
	public int save(BoardVO vo);
	
	//게시판 목록 출력
	public ArrayList<BoardVO> boardlist(RowBounds rb,HashMap<String, Object> map);
	
	//글 읽기
	public BoardVO content(int boardnum);
	
	//글 수정
	public int contentUpdate(BoardVO vo);
	
	//글 삭제
	public int delete(int boardnum);
	
	//전체 글 갯수 파악
	public int getTotal(HashMap<String, Object> map);
	
	//검색 3가지
	public ArrayList<BoardVO> searchbyTitle(String search);
	public ArrayList<BoardVO> searchbyContent(String search);
	public ArrayList<BoardVO> searchbyId(String search);
	
	//댓글 입력
	public int replySave(ReplyVO vo);
	
	//댓글 읽기
	public ArrayList<ReplyVO> replyRead(int boardnum);
	
	//조회수 증가
	public int updateHits(int boardnum);
	
}
