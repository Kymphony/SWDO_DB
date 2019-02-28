package global.sesoc.web6.Controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web6.dao.CustomerDAO;
import global.sesoc.web6.vo.CustomerVO;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	CustomerDAO dao;
	
	//로그인 폼으로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	//로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String logincheck(String custid, String password, Model model,HttpSession session) {
		
		CustomerVO vo = null;
		//사용자가 입력한 아이디로 검색
		//비밀번호도 확인
		//세션으로 로그인, 아웃 상태 표시하기
		
		try{
			
			vo = dao.logincheck(custid);
			logger.info("{}",vo);
		}catch(Exception e){e.printStackTrace(); return "login";}
		
		//없는 아이디 작성시
		if(vo.getCustid() == null){
			model.addAttribute("error1","없는 아이디 입니다.");
			logger.info("없는 아이디 입니다.");
			return "login";}

		//틀린 비밀번호 작성시
		if(!vo.getPassword().equals(password)){
			model.addAttribute("error2","비밀번호를 다시 입력해 주세요.");
			logger.info("비밀번호 불일치");
			return "login";}
		
		//로그인 성공시
		if(vo.getCustid().equals(custid) && vo.getPassword().equals(password)){
			//아이디, 비번 세션에 "loginId"로 저장, "loginName"으로 이름 저장
			session.setAttribute("id",custid);
			session.setAttribute("name", vo.getName());
			logger.info("아이디, 비밀번호 일치. 로그인 성공.");
			return "redirect:/";}
		
		return "redirect:/";
	}
	
	//로그아웃 폼으로 이동
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		//세션 초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	
}
