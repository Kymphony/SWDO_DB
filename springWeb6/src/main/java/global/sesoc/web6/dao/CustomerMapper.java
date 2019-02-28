package global.sesoc.web6.dao;

import global.sesoc.web6.vo.CustomerVO;

public interface CustomerMapper {

	//회원가입
	public int insert(CustomerVO vo);
	
	//아이디 중복확인 + 로그인 확인
	public CustomerVO idcheck(String custid);

	//개인정보 수정
	public int updateCustomer(CustomerVO vo);
}
