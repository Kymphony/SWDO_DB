package global.sesoc.test.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import global.sesoc.test.vo.SearchListVO;


@Controller
public class searchController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(groupController.class);

	/* 책 검색 */
	@RequestMapping(value = "/searchList", method = RequestMethod.POST)
	public String searchBook2(String bookName, Model model) {
		
        String clientId = "teLQPDQlLSeiwwGD4317";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "tw8UyiKd0O";//애플리케이션 클라이언트 시크릿값";
       
        logger.info("검색 입력 값:{}",bookName);
        
        try {
        	
        //검색 값 전송
            String text = URLEncoder.encode(bookName, "UTF-8"); 
            String apiURL = "https://openapi.naver.com/v1/search/book?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
        //수신 확인 
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  				// 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
        //데이터 받기
            String inputLine;
            String data;
            
            
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            		
            		response.append(inputLine);
            	}
            
            //데이터 받기 종료 및 받은 데이타 확인
            br.close();
            //System.out.println("--RAW DATA-- : "+response.toString());
            
            //스트링 data에 담기
            data = response.toString();
            
            Gson gson = new Gson();
            JsonParser parser = new JsonParser();
            JsonElement items = parser.parse(data).getAsJsonObject().get("items");
            
            SearchListVO[] searchList = gson.fromJson(items, SearchListVO[].class);
            ArrayList<SearchListVO> list = new ArrayList<SearchListVO>(Arrays.asList(searchList));
            
            
            for(SearchListVO a:list){
            	
            	//책제목에서 <b>NAVER</b>, <b>Naver</b> 지우기
            	a.setTitle(a.getTitle().replaceAll("<b>NAVER</b>", ""));
            	a.setTitle(a.getTitle().replaceAll("<b>Naver</b>", ""));
            	
            	//책 설명 길이 조절하기
            	if(a.getDescription().length()>=50){
            		a.setDescription(a.getDescription().substring(0, 50)+"...");
            	}
            	
            	//list 저장값 확인
            	System.out.println(a);
            }
            
            //모델에 저장
            model.addAttribute("data", list);
            
            
        } catch (Exception e) {
        	System.out.println(e);
        }
     /*--------------------API 끝나는 지점-------------------------*/   
        
    return "searchList";
        
	}//매퍼 끝
	
	
	
	
	/* 도서별 정보 페이지 */
	@RequestMapping(value = "/bookInfo", method = RequestMethod.GET)
	public String bookinfo(String title, Model model) {
		
		logger.info("책 상세 내용 페이지 진입");
		
		String clientId = "teLQPDQlLSeiwwGD4317";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "tw8UyiKd0O";//애플리케이션 클라이언트 시크릿값";
       
        //띄어쓰기 부분에 있는 %20 -> 빈칸으로 바꿔주기
        title.replaceAll("%20", " ");
        
        logger.info("검색 입력 값:{}",title);
        
        try {
        	
        //검색 값 전송
            String text = URLEncoder.encode(title, "UTF-8"); 
            String apiURL = "https://openapi.naver.com/v1/search/book?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
        //수신 확인 
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  				// 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
        //데이터 받기
            String inputLine;
            String data;
            
            
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            		
            		response.append(inputLine);
            	}
            
            //데이터 받기 종료 및 받은 데이타 확인
            br.close();
            //System.out.println("--RAW DATA-- : "+response.toString());
            
            //스트링 data에 담기
            data = response.toString();
            
            Gson gson = new Gson();
            JsonParser parser = new JsonParser();
            JsonElement items = parser.parse(data).getAsJsonObject().get("items");
            
            SearchListVO[] searchList = gson.fromJson(items, SearchListVO[].class);
            ArrayList<SearchListVO> list = new ArrayList<SearchListVO>(Arrays.asList(searchList));
            
            
            for(SearchListVO a:list){
            	
            	//책제목에서 <b>NAVER</b>, <b>Naver</b> 지우기
            	a.setTitle(a.getTitle().replaceAll("<b>NAVER</b>", ""));
            	a.setTitle(a.getTitle().replaceAll("<b>Naver</b>", ""));
            	
            	//list 저장값 확인
            	System.out.println(a);
            }
            
            //모델에 저장
            model.addAttribute("data", list);
            
            
        } catch (Exception e) {
        	System.out.println(e);
        }
     /*--------------------API 끝나는 지점-------------------------*/ 
		
		
		
		return "bookInfo";
	}
}