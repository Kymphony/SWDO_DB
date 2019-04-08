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

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
 
import global.sesoc.test.vo.SearchListVO;


@Controller
public class searchController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(groupController.class);

	/* 책 검색 */
	@RequestMapping(value = "/searchList", method = RequestMethod.POST)
	public String searchBook2(String bookName,String detail, Model model) {
		
        String clientId = "teLQPDQlLSeiwwGD4317";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "tw8UyiKd0O";//애플리케이션 클라이언트 시크릿값";
       
        logger.info("\n\n통합 검색 입력 값:{}, 상세 검색 입력 값:{}\n",bookName,detail);
        
        try {
        	
	        //검색 값 전송
	            String text = URLEncoder.encode(bookName, "UTF-8"); 
            
        
        	
	        //통합 검색, 상세 검색 분기 - detail 이용
	        
	        String apiURL = "";    
            
	        switch(detail)
	        	{
		        	case "total": 		apiURL = "https://openapi.naver.com/v1/search/book?query="+ text; break;
		        	case "title": 		apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?d_titl="+ text; break;
		        	case "author": 		apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?d_auth="+ text; break;
		        	case "publisher": 	apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?d_publ="+ text; break;
		        	default : logger.info("셀렉트-스위치 입력 값 없음");
	        	}
	        
	        
	        /*JSON XML 분기*/
	        
	        // JSON
		      		if(detail.equals("total")){
		        	
		        	URL url = new URL(apiURL);
		        	HttpURLConnection con = (HttpURLConnection)url.openConnection();
		        	con.setRequestMethod("GET");
		        	con.setRequestProperty("X-Naver-Client-Id", clientId);
		        	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		            
			        //수신 확인 
			            int responseCode = con.getResponseCode();
			            BufferedReader br;
			            if(responseCode==200) { // 정상 호출									//수정 부분 - UTF8 추가
			                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			            } else {  				// 에러 발생
			                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
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
			            
			            logger.debug("{}",data);
			            
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
		            
	            
        		}// JSON 끝
		        
		        
		 // XML
		      		
		        else{
		        	
		        	logger.info("XML 진입");//
		        	
		        	BufferedReader br = null;
		        	
		        	//DocumentBuilderFactory 생성
		        	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		        	factory.setNamespaceAware(true);
		        	DocumentBuilder builder;
		        	Document doc = null;
		        	
		        	//API 호출
		        		URL url = new URL(apiURL);
		        		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		        		con.setRequestMethod("GET");
		        		con.setRequestProperty("X-Naver-Client-Id", clientId);
		        		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			        	
		        		
		        		logger.info("XML - API 호출 완료");//
		        		
		        		//응답 읽기
		        		/*
		        		
		        		int responseCode = con.getResponseCode();
		        		if(responseCode==200) { // 정상 호출									//수정 부분 - UTF8 추가
			                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			            } else {  				// 에러 발생
			                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			            }
			            
		        		String inputLine;
		        		String data ="";
		        		
		        		StringBuffer response = new StringBuffer();
			            while ((inputLine = br.readLine()) != null) {
			            		data = data + inputLine.trim();} // data = url로 XML을 읽은 값
		        		*/	
		        		
		        		br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		        		String result = "";
		        		String line;
		        		
		        		while((line = br.readLine()) != null){
		        			result = result + line.trim();
		        		}
		        	
			            System.out.println("XML - API에서 받아온 값" + result);
			            
			            
			            //XML 파싱하기
			            InputSource is = new InputSource(new StringReader(result));
			            builder = factory.newDocumentBuilder();
			            doc = builder.parse(is);
			            XPathFactory xpathFactory = XPathFactory.newInstance();
			            XPath xpath = xpathFactory.newXPath();
			            XPathExpression expr = xpath.compile("/item");
			            //XPathExpression expr = xpath.compile("/response/body/items/item");
			            NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
			            
			            
			            logger.info("☆★☆★☆★☆★☆★:{}",nodeList.item(0));
			            
			            
			            System.out.println("XML - for문 진입 전");//
			            
			            for(int i = 0 ; i < nodeList.getLength(); i++){
			            	NodeList child = nodeList.item(i).getChildNodes();
			            	
			            	for(int j = 0; j < child.getLength(); j++){
			            		Node node = child.item(j);
			            		System.out.println("현재 노드 이름 : " + node.getNodeName());
			                    System.out.println("현재 노드 타입 : " + node.getNodeType());
			                    System.out.println("현재 노드 값 : " + node.getTextContent());
			                    System.out.println("현재 노드 네임스페이스 : " + node.getPrefix());
			                    System.out.println("현재 노드의 다음 노드 : " + node.getNextSibling());
			                    System.out.println();
			            		}//안쪽 포문
			            	}//바깥 포문
		        	}//XML끝
		        	/*
		        	//페이지에 접근해줄 Document 객체 생성
			        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		        	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		        	Document doc = dBuilder.parse(apiURL);
		        	
		        	//파싱항 정보가 있는 tag에 접근
		        	doc.getDocumentElement().normalize();
		        	System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
		        	NodeList nList = doc.getElementsByTagName("baseinfo");
		        	System.out.println("파싱할 리스트 수 : " + nList.getLength());
		        	
		        	//list에 담긴 데이터 출력하기
		        	for(int temp = 0; temp < nList.getLength(); temp++){
		        		
		        		Node nNode = nList.item(temp);
		        			
		        		if(nNode.getNodeType() == Node.ELEMENT_NODE){
		        			
		        			Element eElement = (Element)nNode;
		        			System.out.println("────────────────────────────────");
		        			System.out.println(eElement.getTextContent());
		        		}
		        	*/
		        	
        
        } catch (Exception e) {System.out.println(e.getMessage());}
		      		
        return "searchList";
        
	}//매퍼 끝
	
	
	/*책 상세 검색*/
	@RequestMapping(value = "/dsearchList", method = RequestMethod.POST)
	public String dsearchBook2(String bookName, Model model) {
		
        String clientId = "teLQPDQlLSeiwwGD4317";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "tw8UyiKd0O";//애플리케이션 클라이언트 시크릿값";
       
        logger.info("검색 입력 값:{}",bookName);
        
        try {
        	
        //검색 값 전송
            String text = URLEncoder.encode(bookName, "UTF-8"); 
            
            
            //상세검색 - 책 제목
            String apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?d_titl="+ text;
            //String apiURL = "https://openapi.naver.com/v1/search/book.xml?query="+ text; // xml 결과
            
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
	
	
	
	
	/* 도서별 정보 페이지  */
	@RequestMapping(value = "/bookInfo", method = RequestMethod.GET)
	public String bookinfo(String title, Model model) {
		
		logger.info("책 상세 내용 페이지 진입");
		
		String clientId = "teLQPDQlLSeiwwGD4317";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "tw8UyiKd0O";//애플리케이션 클라이언트 시크릿값";
       
        //띄어쓰기 부분에 있는 %20 -> 빈칸으로 바꿔주기
        title.replaceAll("%20", " ");
        
        //<b>,</b>제거
        title.replaceAll("<b>", "");
        title.replaceAll("</b>", "");
        
        logger.info("검색 입력 값:{}",title);
        
        try {
        	
        //검색 값 전송
            String text = URLEncoder.encode(title, "UTF-8"); 
            String apiURL = "https://openapi.naver.com/v1/search/book?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/book.json"; // json 결과
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