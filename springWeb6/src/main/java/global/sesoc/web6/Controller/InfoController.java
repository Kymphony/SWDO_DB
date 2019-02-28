package global.sesoc.web6.Controller;

import java.util.ArrayList;

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

/**
 * 개인정보 수정 컨트롤러
 */
@Controller
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	CustomerDAO dao;
	//개인정보 수정 폼으로 이동(로그인 이후에 사용가능함)
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.GET)
	public String infoUpdate(Model model,HttpSession session) {
		
		CustomerVO vo = null;
		String[] mail = null;
		
		String custid = null;
		try{
			//세션에서 로그인 아이디 읽기 
			custid = (String)session.getAttribute("id");
			
			//그 아이디로 DB에서 개인정보 검색하여 vo객체로 리턴
			vo = dao.logincheck(custid);
			mail = vo.getEmail().split("@");
			
			//DB의 이메일 주소를 메일 아이디, 메일주소 따로 저장하여 jsp에 전송
			logger.info("DB에서 들어온 아이디:{}",vo.getCustid());
			logger.info("이메일 아이디: {}",mail[0]);
			logger.info("이메일 주소: {}",mail[1]);
			
			//vo객체를 모델에 저장하고 수정폼jsp로 포워딩
			model.addAttribute("data", vo);
			model.addAttribute("email1",mail[0]);
			model.addAttribute("email2","@"+mail[1]);
		}catch(Exception e){e.printStackTrace();}
		
		return "infoUpdate";
	}
	
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public String infoUpdate(CustomerVO vo, String email2, HttpSession session, Model model) {

		int result = 0;
		String[] mail = null;
		//아이디는 수정되지 않게 헀으므로 수정폼에서 들어오는 객체에는 id가 들어있지 않다.
		//따라서 이번에도 세션에서 아이디를 얻어 객체에 집어넣는다.
		try{
			
		vo.setCustid((String)session.getAttribute("id"));
		vo.setEmail(vo.getEmail()+email2);//따로 저장되있는 메일정보 합치기
		mail = vo.getEmail().split("@");
		
		//시용자가 수정입력한 정보를 DB에 udapte
		result = dao.updateCustomer(vo);
		}catch(Exception e){e.printStackTrace(); return "infoUpdate";}
		
		if (result > 0){
			model.addAttribute("updatedData", vo);
			logger.info("회원 구분 값 : {}",vo.getDivision());
			model.addAttribute("updatedMail1",mail[0]);
			model.addAttribute("updatedMail2","@"+mail[1]);
			logger.info("정보 수정 완료후 정보수정 확인 페이지에 model 전송함");
		}
		else if(result == 0){logger.info("업데이트 문제 발생");}
		
		//수정된 결과를 보여주는 페이지로 이동
		return "updatedInfo";
	}
	
}
