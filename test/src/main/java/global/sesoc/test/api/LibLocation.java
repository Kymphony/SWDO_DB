package global.sesoc.test.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import global.sesoc.test.controller.SearchController;
import global.sesoc.test.vo.LibraryVO;
import global.sesoc.test.vo.LivInfoVO;

public class LibLocation {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	// 여러번 반복해서 실행될 메서드 - VO객체로 리턴해야 한다
	public LivInfoVO libLocation(String code) {

		// 입력 값 변환 및 확인
		//logger.info("libSearch에서 받은 값:{}", code);

		BufferedReader br = null;

		try {

			// 요청 url 설정
			String apiURL = "";
			apiURL = "http://nl.go.kr/kolisnet/openApi/open.php?lib_code=" + code;

			// "http://nl.go.kr/kolisnet/openApi/open.php?page=1&gubun1=ISBN&code1=9788959895526&per_page=10"

			// API호출
			URL url = new URL(apiURL);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));

			//String data = "";
			String msg;

			LivInfoVO tran = new LivInfoVO();
			
			// 응답 받기
			while ((msg = br.readLine()) != null) {
				
				//도서관 이름 건져내기
				if(msg.startsWith("		<LIB_NAME>")){
				   
				   tran.setNAME(msg.substring(msg.indexOf(">")+1, msg.lastIndexOf("<")));
				   
				   //System.out.println("도서관 이름: " + tran.getLIB_NAME());
				}
				
				//도서관 주소 건져내기
				if(msg.startsWith("		<ADDRESS>")){
					   
				   tran.setADDRESS(msg.substring(msg.indexOf(">")+1, msg.lastIndexOf("<")));
					   
				   //System.out.println("도서관 주소: " + tran.getADDRESS());
				}
				
				//도서관 전화번호 건져내기
				if(msg.startsWith("		<TEL>")){
					   
				   tran.setTEL(msg.substring(msg.indexOf(">")+1, msg.lastIndexOf("<")));
					
				   //System.out.println("도서관 전화번호: " + tran.getTEL());
				}
			}
			
			//값 보내기
			return tran;
			
			} catch (Exception e) {
			  System.out.println(e.getMessage());
			}
		
			return null;
	}//메서드 끝
}//클래스 끝
