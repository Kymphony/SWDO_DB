package global.sesoc.test.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import global.sesoc.test.api.bookInfo;
import global.sesoc.test.api.bookSearch;
import global.sesoc.test.api.libSearch;
import global.sesoc.test.vo.LibraryVO;
import global.sesoc.test.vo.SearchListVO;


@Controller
public class SearchController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	
	/* 
	 * 책 검색
	 *  */
	@RequestMapping(value = "/searchList", method = RequestMethod.GET)
	public String searchBook2(String bookName,String detail, Model model) {
		
		//웹에서 고객이 검색한 값 확인
			logger.info("\n\n통합 검색 입력 값:{}, 상세 검색 입력 값:{}\n",bookName,detail);
        
		//API 실행할 클래스 수입, 생성
			bookSearch booksearch = new bookSearch();
			ArrayList<SearchListVO> list = new ArrayList<SearchListVO>();
		
		//API 메서드 실행, 값 받아오기, 값 확인
			list = booksearch.booksearch(bookName, detail);
			logger.info("bookSearch에서 컨트롤러로 보낸 값:{}",list);
		
		//모델에 검색 결과 저장
			model.addAttribute("data",list);
		        		
        return "searchList";
	}//매핑 끝
		   
	
	/* 
	 * 도서별 정보 페이지
	 * */
	@RequestMapping(value = "/bookInfo", method = RequestMethod.GET)
	public String bookinfo(String isbn, Model model) {
		
		//web에서 입력된 isbn값 확인
		logger.info("\n\n 단일 도서 검색 입력 값:{}",isbn);
		
		//ISBN 13 추출
		int fact1 = isbn.indexOf(" ")+1;
		int fact2 = isbn.length();
		isbn = isbn.substring(fact1, fact2);
		
		/*책 정보 출력 API*/	
			//API 클래스 수입, 선언
				bookInfo searchBook = new bookInfo();
				ArrayList<SearchListVO> list = new ArrayList<SearchListVO>();
			
			//API 메서드 실행 후 값 받아오기
				list = searchBook.bookinfo(isbn);
				logger.info("bookInfo클래스에서 컨트롤러로 넘겨준 값:{}",list);
			
			//받아온 값 모델에 저장
				model.addAttribute("data", list);
			
		/*도서관 정보 출력 API*/
			//API 클래스 수입, 선언
				//1차 - 도서관 이름, 도서관 코드, 요청 코드 가져오기
				libSearch libsearch = new libSearch();
				ArrayList<LibraryVO> liblist = new ArrayList<LibraryVO>();
				//2차 - 도서관 주소 가져오기
				
			//API 메서드 실행값 받아오기
				liblist = libsearch.libsearch(isbn);
				logger.info("\nLibSearch 클래스에서 컨트롤러로 넘겨준 값:{}\n",liblist);
			
			//받아온 값 모델에 저장
				model.addAttribute("lib", liblist);
				
		return "bookInfo";
	}//매핑 끝

}//컨트롤러 끝 