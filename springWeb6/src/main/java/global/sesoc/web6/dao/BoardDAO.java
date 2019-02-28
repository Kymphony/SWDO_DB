package global.sesoc.web6.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web6.Controller.CustomerController;
import global.sesoc.web6.vo.BoardVO;
import global.sesoc.web6.vo.CustomerVO;
import global.sesoc.web6.vo.ReplyVO;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//게시판 목록 출력
	public ArrayList<BoardVO> boardlist(int StartRecord, int CountPerPage, String search, String op){
		
		ArrayList<BoardVO> boardlist = null;
		RowBounds rb = new RowBounds(StartRecord,CountPerPage);
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("search", search);
		map.put("op", op);
		
		try{
			boardlist = mapper.boardlist(rb, map);
		}catch(Exception e){e.printStackTrace();}
		
		return boardlist;
	}
	
	//글 저장
	public int save(BoardVO vo){
		int i = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		try{
		i = mapper.save(vo);
		}catch(Exception e){e.printStackTrace();}
		
		return i;
	}
	
	
	//글 내용 출력
	public BoardVO content(int boardnum){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = null;
		
		try{
			vo = mapper.content(boardnum);
		}catch(Exception e){e.printStackTrace();}
		
		return vo;
	}
	
	//글 내용 수정
	public int contentUpdate(BoardVO vo){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int i = 0;
		
		try{
			i = mapper.contentUpdate(vo);
		}catch(Exception e){e.printStackTrace();}
		
		return i;
	}
	
	//글 내용 삭제
	public int delete(int boardnum){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int i = 0;
		
		try{
			i = mapper.delete(boardnum);
		}catch(Exception e){e.printStackTrace();}
		
		return i;		
	}
	
	//게시판 전체 글 갯수 파악
	public int getTotal(String search, String op){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int i = 0;
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("search", search);
		map.put("op", op);
		
		try{
			i = mapper.getTotal(map);
		}catch(Exception e){e.printStackTrace();}
		
		return i;		
	}
	
/*	//글 검색
	public ArrayList<BoardVO> search(String op, String search){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> vo = null;
		
		try{
		switch(op)
		{
			case "제목": vo = mapper.searchbyTitle(search);break;
			case "내용": vo = mapper.searchbyContent(search);break;
			case "작성자":vo = mapper.searchbyId(search);break;
		}
		}catch(Exception e){e.printStackTrace();logger.info("DAO에서 검색 실패");}
		
		
		return vo;
	}*/
	
	//댓글 저장
	public int replySave(ReplyVO vo){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int i = 0;
		
		try{
			i = mapper.replySave(vo);
		}catch(Exception e){e.printStackTrace();}
		
		return i;		
	}
	
	//댓글 읽기
	public ArrayList<ReplyVO> replyRead(int boardnum){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<ReplyVO> result = null;

		try{
		result = mapper.replyRead(boardnum);
		}catch(Exception e){e.printStackTrace();}
		
		return result;
	}
	
	//조회수 올리기
	public int updateHits(int boardnum){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = 0;
		
		try{
			
			result = mapper.updateHits(boardnum);
		
		}catch(Exception e){e.printStackTrace();logger.info("조회수 업데이트 실패 from DAO");}
		
		return result;
	}
	
}
