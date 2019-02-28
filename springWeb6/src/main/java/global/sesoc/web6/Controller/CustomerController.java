package global.sesoc.web6.Controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web6.dao.CustomerDAO;
import global.sesoc.web6.dao.GaverMapper;
import global.sesoc.web6.vo.CustomerVO;
import global.sesoc.web6.vo.Gaver;

/**
 * 회원 가입, 회원 목록 보기 컨트롤러
 */
@Controller //@Controller 어노테이션  - 미리 객체를 무조건 만들어놓음
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//빈으로 등록된 것을 가져옴
	@Autowired
	CustomerDAO dao; //만들지도 않은 객체를 오토와이어드에 넣을 수 없다
	
	//가입 폼으로 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	//가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(CustomerVO vo,String email2) {
		
		int result = 0;	
		
		vo.setEmail(vo.getEmail()+email2);
		logger.info("{}",vo);
		result = dao.insert(vo);
		
		return "redirect:/";
	}
	
	//중복확인으로 이동
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public String idCheck() {
		
		return "idCheck";
	}
	
	//중복확인으로 이동
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck2(String custid, Model model) {
		
		//ID를 전달하여 검색 결과를 VO객체로 받음
		CustomerVO vo = null;
		
		try{
			vo = dao.idcheck(custid);
			
		}catch(Exception e){e.printStackTrace();}
		
		//검색 결과를 Model에 저장하고 JSP로 다시 이동
		
		model.addAttribute("custid", custid);//입력한 아이디
		model.addAttribute("result", vo);//검색 결과 
		
		model.addAttribute("std", true);//검색하기 전에도 null값이기 때문에 검색 후의 null값과 차이를 주기 위함
		
		return "idCheck";
	}
	
}
