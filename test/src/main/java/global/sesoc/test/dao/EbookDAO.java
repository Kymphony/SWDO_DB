package global.sesoc.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.test.dao.EbookMapper;
import global.sesoc.test.vo.EBookNumVO;

@Repository
public class EbookDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//통합 검색
	public ArrayList<EBookNumVO> total(String text){
		
		EbookMapper mapper = sqlSession.getMapper(EbookMapper.class);
		ArrayList<EBookNumVO> ebook = null;
		
		try{
			
			ebook = mapper.total(text);
			
		}catch(Exception e){e.printStackTrace();}
		
		return ebook;
	}
	
	//제목 검색
	public ArrayList<EBookNumVO> title(String text){
		
		EbookMapper mapper = sqlSession.getMapper(EbookMapper.class);
		ArrayList<EBookNumVO> ebook = null;
		
		try{
			
			ebook = mapper.title(text);
			
		}catch(Exception e){e.printStackTrace();}
		
		return ebook;
	}
	
	//저자 검색
	public ArrayList<EBookNumVO> author(String text){
		
		EbookMapper mapper = sqlSession.getMapper(EbookMapper.class);
		ArrayList<EBookNumVO> ebook = null;
		
		try{
			
			ebook = mapper.author(text);
			
		}catch(Exception e){e.printStackTrace();}
		
		return ebook;
	}
	
	//출판사 검색
	public ArrayList<EBookNumVO> pub(String text){
		
		EbookMapper mapper = sqlSession.getMapper(EbookMapper.class);
		ArrayList<EBookNumVO> ebook = null;
		
		try{
			
			ebook = mapper.pub(text);
			
		}catch(Exception e){e.printStackTrace();}
		
		return ebook;
	}
	
	//책번호로 책정보 가져오기
	public EBookNumVO num(int bookNum){
		
		EbookMapper mapper = sqlSession.getMapper(EbookMapper.class);
		EBookNumVO ebook = new EBookNumVO();
		
		try{
			
			ebook = mapper.num(bookNum);
			
		}catch(Exception e){e.printStackTrace();}
		
		return ebook;
	}

}
