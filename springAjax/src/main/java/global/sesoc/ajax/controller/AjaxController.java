package global.sesoc.ajax.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.ajax.dao.PersonMapper;
import global.sesoc.ajax.vo.Person;

/**
 * 회원 가입, 회원 목록 보기 컨트롤러
 */
@Controller
public class AjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	//빈으로 등록된 것을 가져옴
	@Autowired
	SqlSession sqlSession;
	

	@RequestMapping(value = "/js1", method = RequestMethod.GET)
	public String js1() {
		return "js1";
	}
	
	@RequestMapping(value = "/js2", method = RequestMethod.GET)
	public String js2() {
		return "js2";
	}
	
	@RequestMapping(value = "/js3", method = RequestMethod.GET)
	public String js3() {
		return "js3";
	}
	
	@RequestMapping(value = "/js4", method = RequestMethod.GET)
	public String js4() {
		return "js4";
	}
	
	@RequestMapping(value = "/pc", method = RequestMethod.GET)
	public String pc() {
		return "pc";
	}

	@RequestMapping(value = "/mobile", method = RequestMethod.GET)
	public String mobile() {
		return "mobile";
	}
	
	@RequestMapping(value = "/ad", method = RequestMethod.GET)
	public String ad() {
		return "ad";
	}
	
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Jquery
	 */
	
	
	@RequestMapping(value = "/jq1", method = RequestMethod.GET)
	public String jq1() {
		return "jq";
	}

	@RequestMapping(value = "/jq2", method = RequestMethod.GET)
	public String jq2() {
		return "jq2";
	}

	@RequestMapping(value = "/jq3", method = RequestMethod.GET)
	public String jq3() {
		return "jq3";
	}
	
	
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Ajax
	 */
	
	@RequestMapping(value = "/aj1", method = RequestMethod.GET)
	public String aj1() {
		return "aj1";
	}
	
	@ResponseBody //서버에서 받아온 값을 직접적으로 리턴 자바딴에서는 JSON으로 받아서 씀.
	@RequestMapping(value = "/ajaxtest1", method = RequestMethod.GET)
	public void ajaxtest1(Model model) {
			//↑ 가지고 갈 값이나 이동할 곳이 없기에 void
		logger.info("call1의 서버 요청 실행됨 from 컨트롤러의 ajaxtest1");
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxtest2", method = RequestMethod.GET,produces="application/json;charset=UTF-8")
	public String ajaxtest2(String str, Model model) {						  //↑ 
																			  //↑ 서버에서 한글 텍스트를 웹으로 리턴할때
		logger.info("전송 받은 값: '" + str + "' from ajaxtest2");				  //↑ 한글이 깨진다면 추가해줘야 할 코드	
		String text = "한글 만쉐";//한글은 ???로 나올때 →	   →		→		→		↑ (일본어도 마찬가지)
		
		return text; //@ResponseBody로 웹으로 전송
	}
	
	@RequestMapping(value = "/aj2", method = RequestMethod.GET)
	public String aj2() {
		return "aj2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert1", method = RequestMethod.POST)
	public void insert1(String name, int age, String phone) {
		
		logger.info("콘솔에 넘어온 값 - 이름: " + name  + ", 나이: " + age + ", 전화번호: " + phone);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert2", method = RequestMethod.POST)
	public void insert2(Person person) {
		logger.info("넘어온 값: " + person);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert3", method = RequestMethod.POST)
	public void insert3(Person person/*첫번째 방법처럼 각각parameter로 받거나 VO객체로 받는다*/) {
		logger.info("넘어온 값: " + person);
	}

	@ResponseBody
	@RequestMapping(value = "/jsontest", method = RequestMethod.GET)
	public Person jsontest() {
		Person person = new Person("홍길동",20,"010-9410-0945");
		
		return person;
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsontest2", method = RequestMethod.GET)
	public Person jsontest2() {
		Person person = new Person("홍길동",20,"010-9410-0945");
		
		return person;
	}	

	@RequestMapping(value = "/aj3", method = RequestMethod.GET)
	public String aj3() {
		return "aj3";
	}
}
