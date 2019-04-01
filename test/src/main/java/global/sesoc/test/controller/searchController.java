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

	
	@RequestMapping(value = "/bookSearch", method = RequestMethod.GET)
	public String searchBook1(Model model) {
	
		logger.info("책 검색 페이지 진입");
		
		return "bookSearch";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookSearch", method = RequestMethod.POST)
	public void searchBook2(String bookName, Model model) {
		
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
            
            //for(SearchListVO a:list)logger.info("제목:{}\n저자:{}\n가격:{}\n출판사:{}\n출판날짜:{}\nisbn:{}\n설명:{}"
            //									,a.getTitle(),a.getAuthor(),a.getPrice(),a.getPublisher(),a.getPubdate(),a.getIsbn(),a.getDescription());
            
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
        
	}
}
            
            
/*            //items기준으로 나누기
            String data1[] = response.toString().split("items");	//data[1]에 저장됨
	        //for(int i = 0 ; i < data1.length ; i++) System.out.println(i+ "번째 data 값:" +data1[i]+"\n");
	        
            //중괄호 제거
            String data2 = data1[1].replaceAll("\\{", "");
            String data3 = data2.replaceAll("\\}", "");
            //System.out.println("중괄호 제거 후:"+data3);
            
            //맨 앞 대괄호 제거
            String data4 = data3.replaceFirst("\\[", "");
            //System.out.println("맨 앞 대괄호 제거 후 :"+data4);
            
            //마지막 }]} 지우기
            String data5 = data4.replaceAll("\\}]}", "");
           // System.out.println("마지막 }]} 제거 후 :"+data5);
            
            //맨 앞 :":  지우기
            String data6 = data5.replaceFirst("\": ", "");
            //System.out.println("맨 앞 :\": 제거 후 :"+data6);
	        
            // <b>Naver</b> 지우기
            String data7 = data6.replaceAll("<b>Naver</b>", "");
            System.out.println(data7);
            
            // 따옴표 지우기
            String data8 = data7.replaceAll("\"", "");
            //System.out.println(data8);
            
            //쉼표 기준 나누기
	        String data8[] = data7.split(",");
            for(int i = 0 ; i < data8.length; i++) System.out.println(i+ "번쨰 data 값: " + data8[i]+"\n");*/
            
            //
            
            
            	//title
	        
            		//String title[] = data[1].split("title");
            		//for(int i = 0 ; i < title.length ; i++) System.out.println(i+ "번째 title 값:" +title[i]+"\n");
            	//link
            	//image
            	//author
            	//price
            	//discount
            	//publisher
            	//pubdate
            	//isbn
            	//description
            
            



/*            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            int responseCode = con.getResponseCode();
            BufferedReader br;
            
            if(responseCode==200) { // 정상 호출
            	
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                
                //logger.info("과연 br은?:{}",br.readLine()); - 아무것도 안나옴
                
            } else {  // 에러 발생
            	
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            String inputLine;
            	
            StringBuffer response = new StringBuffer();
            
            while ((inputLine = br.readLine()) != null) {
            	
            	
            	//logger.info("출력할 값?: {}",response.toString()); - 아무것도 출력x
            	//logger.info("인풋라인은 과연?:{}",inputLine); - 값 한줄한줄씩 가지고 있음
                //model.addAttribute("bookInfo",response);
                
            }
            
            //logger.info("while문 밖에 있는 inputLine은?:{}",inputLine); - null
            logger.info("while문 밖에 있는 br.readLine은?:{}",br.readLine()); 
            br.close();
            logger.info("줄 76:{}",response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
        
        
    }
}

*/