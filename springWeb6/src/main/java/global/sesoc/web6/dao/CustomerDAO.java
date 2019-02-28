package global.sesoc.web6.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import global.sesoc.web6.vo.CustomerVO;


@Repository //프로그램 실행괃 동시에 이 클래스가 무조건 생성되게 해주는 어노테이션
public class CustomerDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	public int insert(CustomerVO vo){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result = 0;
		
		try{
			
			result = mapper.insert(vo);
		
		}catch(Exception e){e.printStackTrace();result=0;}
		
		return result;
	}
	
	
	public CustomerVO idcheck(String custid){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		CustomerVO vo = null;
		try{
			
			vo = mapper.idcheck(custid);
		
		}catch(Exception e){e.printStackTrace();}
		
		return vo;
	}
	
	
	public CustomerVO logincheck(String custid){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		CustomerVO vo = null;
		
		try{
			
		vo = mapper.idcheck(custid);
			
		}catch(Exception e){e.printStackTrace();}
		
		
		return vo;
	}
	
	public int updateCustomer(CustomerVO vo){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int result= 0;
		
		try{
			
		result = mapper.updateCustomer(vo);
			
		}catch(Exception e){e.printStackTrace();}
		
		
		return result;
	}
}
