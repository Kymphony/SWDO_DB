package global.sesoc.ajax.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ajax.controller.CommentController;
import global.sesoc.ajax.vo.CommentVO;
import global.sesoc.ajax.dao.CommentMapper;

@Repository
public class CommentDAO {
	
	@Autowired
	SqlSession sqlSession;	
	
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	public int saveComment(CommentVO comment){
		
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		int i = 0;
		
		try{
		i = mapper.saveComment(comment);
		}catch(Exception e){e.printStackTrace();}
		
		return i; 
	}
	
	public ArrayList<CommentVO> list(){
		
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		ArrayList<CommentVO> list = null;
		
		try{
		list = mapper.list();
		}catch(Exception e){e.printStackTrace();}
		
		logger.info(" → DB에서 가져오는 리스트 값 DAO거쳐감");
		return list;
	}
	
	public void delete(int num){
		
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		int res = 0;
		
		try{
		res = mapper.delete(num);
		}catch(Exception e){logger.info("댓글 삭제 실패 by DAO");}
	}
	
	public void edit(CommentVO text){
		
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		int res = 0;
		
		try{
		res = mapper.edit(text);
		}catch(Exception e){logger.info("댓글 삭제 실패 by DAO");}
	}
}
