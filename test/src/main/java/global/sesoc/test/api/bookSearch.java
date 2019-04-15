package global.sesoc.test.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import global.sesoc.test.controller.SearchController;
import global.sesoc.test.vo.SearchListVO;

public class bookSearch {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	public ArrayList<SearchListVO> booksearch(String bookname,String detail){
		
		String clientId = "teLQPDQlLSeiwwGD4317";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "tw8UyiKd0O";//애플리케이션 클라이언트 시크릿값";
       
       //logger.info("\n\n통합 검색 입력 값:{}, 상세 검색 입력 값:{}\n",bookname,detail);
        
        try {
        	
	        //검색 값 전송
	            String text = URLEncoder.encode(bookname, "UTF-8"); 
            
        
        	
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
		            	//System.out.println(a);
		            }
		            
		            
		            //컨트롤러에 값 전송
		            return list;
		            
	            
        		}// JSON 끝
		        
		        
		 // XML
		      		
		        else{
		        	
		        	//logger.info("XML 진입");
		        	
		        	//API 호출
		        	
		        	URL url = new URL(apiURL);
		        	HttpURLConnection con = (HttpURLConnection)url.openConnection();
		        	con.setRequestMethod("GET");
		        	con.setRequestProperty("X-Naver-Client-Id", clientId);
		        	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		        		
		        	BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            
		            String data="";
		            String msg = null;
		            
		            
		            //응답 받기
		            while((msg = br.readLine())!=null)
		            {
		                //System.out.println(msg);
		                data += msg;
		            }
		            
		            ArrayList<SearchListVO> list = null; //결과데이터 담을 리스트 
		            //System.out.println(data); //응답받은 xml문서 xml문서로부터 내가 원하는 값 탐색하기(xml 파싱)
		            
		             XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		             XmlPullParser parser = factory.newPullParser(); //연결하는거 담고 
		             parser.setInput(new StringReader(data));
		             
		             
		             int eventType= parser.getEventType();
		             SearchListVO b = null;
		             
		             while(eventType != XmlPullParser.END_DOCUMENT)
		             {
		                 switch(eventType)//바깥 스위치
		                 {
		                 	case XmlPullParser.START_DOCUMENT: list = new ArrayList<SearchListVO>();
		                 									   break;
		                 	case XmlPullParser.END_DOCUMENT://문서의 끝 
		                     								   break;
		                 	case XmlPullParser.END_TAG: // 추가한 부분 - 배열에 값 넣기
		                 			{
		                 				String tag = parser.getName();
		                 				if(tag.equals("item")){
		                 					
		                 					list.add(b);
		                 					//logger.info("값 입력 확인2:{}",list);
		                 					
		                 					b = null;
		                 				}
		                 			}
		                 			
		                 	case XmlPullParser.START_TAG://무조건 시작하면 만남 
		                 			{ 
		                 			String tag = parser.getName();
		                 			
		                 			switch(tag){//안쪽 스위치
		                 				case "item": //items가 열렸다는것은 새로운 책이 나온다는것 
		                 					
		                 					b = new SearchListVO();break;
		                 							
		                 				case "title": 	if(b!=null)b.setTitle(parser.nextText());	break;
		                 				case "link"	: 	if(b!=null)b.setLink(parser.nextText());	break;
		                 				case "image": 	if(b!=null)b.setImage(parser.nextText());	break;
		                                case "author": 	if(b!=null)b.setAuthor(parser.nextText());	break;
		                                case "price": 	if(b!=null)b.setPrice(parser.nextText());	break;
		                                case "discount":if(b!=null)b.setDiscount(parser.nextText());break;
		                                case "publisher":if(b!=null)b.setPublisher(parser.nextText());break;
		                                case "pubdate":	if(b!=null)b.setPubdate(parser.nextText());	break;
		                                case "isbn":	if(b!=null)b.setIsbn(parser.nextText());	break;
		                                case "description":if(b!=null)b.setDescription(parser.nextText());break;
		                                
					                 			}//안쪽 스위치 끝
					                 			break;
		                 			}//case 끝*/
		                 }//바깥쪽 스위치 끝
		                 eventType =parser.next();
		             }//while문 끝
		        
		             
		        //컨트롤러에 값 전송     
		        return list;
		        
		        /*for(SearchListVO book:list)
		            System.out.println("☆★☆JSON 출력★☆★: "+book);*/
		        }
		      	

        }catch (Exception e) {System.out.println(e.getMessage());}
		
		return null;
	}
}
