package global.sesoc.ajax.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.ajax.dao.CommentDAO;
import global.sesoc.ajax.vo.CommentVO;

@Controller
public class CommentController {

	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@Autowired
	CommentDAO dao;
	
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public String comment() {
		return "comment/comment";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(CommentVO comment) {
		logger.info("넘어온 값:{}",comment);
		
		dao.saveComment(comment);
	}
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ArrayList<CommentVO> list() {
		logger.info("웹으로 부터 리플 리스트 출력 요청 확인 by 컨트롤러");
		
		ArrayList<CommentVO> list = dao.list();
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete(int num) {
		logger.info("웹으로 부터 삭제 요청 확인, 삭제 번호: "+num+" by 컨트롤러");
		
		dao.delete(num);
	}
	
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public void edit(CommentVO text) {
		logger.info("넘어온 수정 값:{}",text);
		
		dao.edit(text);
	}
}
