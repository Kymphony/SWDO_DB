package global.sesoc.test.dao;

import java.util.ArrayList;

import global.sesoc.test.vo.Reply_BookVO;

public interface ReviewMapper {

	//일반도서 서평 정보 가져오기
	ArrayList<Reply_BookVO> bookRev(Reply_BookVO std);

	//이북 서평 정보 가져오기
	ArrayList<Reply_BookVO> ebookRev(String title);
	
	
}
