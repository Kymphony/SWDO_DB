package global.sesoc.test.dao;

import java.util.ArrayList;

import global.sesoc.test.vo.EBookNumVO;

/*
 * Ebook 검색
 * 
 * */
public interface EbookMapper {
	//통합 검색
		ArrayList<EBookNumVO> total(String text);
	//제목 검색
		ArrayList<EBookNumVO> title(String text);
	//저자 검색
		ArrayList<EBookNumVO> author(String text);
	//출판사 검색
		ArrayList<EBookNumVO> pub(String text);
	//책번호로 책정보 가져오기	
		EBookNumVO num(int bookNum);
}
