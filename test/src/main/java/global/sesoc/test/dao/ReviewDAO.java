package global.sesoc.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.test.vo.Reply_BookVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<Reply_BookVO> bookRev(Reply_BookVO std){
		
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		ArrayList<Reply_BookVO> rev = null;
		
		try{
			
			rev = mapper.bookRev(std);
			
		}catch(Exception e){e.printStackTrace();}
		
		return rev;
	}
	
	
	public ArrayList<Reply_BookVO> ebookRev(String title){
		
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		ArrayList<Reply_BookVO> rev = null;
		
		try{
			
			rev = mapper.ebookRev(title);
			
		}catch(Exception e){e.printStackTrace();}
		
		return rev;
	}
}
