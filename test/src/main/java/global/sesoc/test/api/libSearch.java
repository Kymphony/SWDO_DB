package global.sesoc.test.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import global.sesoc.test.controller.SearchController;
import global.sesoc.test.vo.LibraryVO;
import global.sesoc.test.vo.SearchListVO;

public class libSearch {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	public ArrayList<LibraryVO> libsearch(String isbn){
		
			
			//입력 값 변환 및 확인
			logger.info("libSearch에서 받은 값:{}",isbn);
			
			BufferedReader br = null;
			
            try {
            	String text = URLEncoder.encode(isbn, "UTF-8");
            	
            //요청 url 설정
	            String apiURL = "";    
				apiURL = "https://nl.go.kr/kolisnet/openApi/open.php?"
						+ "page=1"
						+ "&per_page=10"
						+ "&gubun1=ISBN"
						+ "&code1="+ text;
                
		    //API호출
                URL url = new URL(apiURL);
                HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
            	urlconnection.setRequestMethod("GET");
            	br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
            	
                String result = "";
                String line;
                
                while((line = br.readLine()) != null) {
                    result = result + line + "\n";
                }
                
            //받은 값 출력
                System.out.println(result);

            }catch (Exception e) {System.out.println(e.getMessage());}
            
            return null;
	}
	
        	/*
        	//응답 받기
            while((msg = br.readLine())!=null)
            {
                //System.out.println(msg);
                data += msg;
            }
            
            ArrayList<LibraryVO> list = null; //결과데이터 담을 리스트 
            //System.out.println(data); //응답받은 xml문서 xml문서로부터 내가 원하는 값 탐색하기(xml 파싱)
            
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser(); //연결하는거 담고 
            parser.setInput(new StringReader(data));
             
             
            int eventType= parser.getEventType();
            LibraryVO b = null;
             
            while(eventType != XmlPullParser.END_DOCUMENT)
            {
                switch(eventType)//바깥 스위치
                {
                 	case XmlPullParser.START_DOCUMENT: list = new ArrayList<LibraryVO>();
                 									break;
                 	case XmlPullParser.END_DOCUMENT://문서의 끝 
                     								break;
                 	case XmlPullParser.END_TAG: // 추가한 부분 - 배열에 값 넣기
                 			{
                 				String tag = parser.getName();
                 				if(tag.equals("items")){
                 					list.add(b);
                 					
                 					//System.out.println(list);
                 					
                 					b = null;
                 				}
                 			}
                 			
                 	case XmlPullParser.START_TAG://무조건 시작하면 만남 
                 			{ 
                 			String tag = parser.getName();
                 			
                 			switch(tag){//안쪽 스위치
                 				case "items": //items가 열렸다는것은 새로운 책이 나온다는것 
                 					
                 					b = new LibraryVO();break;
                 							
                 				case "LIB_NAME": 	if(b!=null)b.setLIB_NAME(parser.nextText());	break;
                 				case "LIB_CODE"	: 	if(b!=null)b.setLIB_CODE(parser.nextText());	break;
                 				case "REC_KEY": 	if(b!=null)b.setREC_KEY(parser.nextText());		break;
                                
                 			}//안쪽 스위치 끝
                 			break;
                 	}//case 끝
                 }//바깥쪽 스위치 끝
                 eventType =parser.next();
             }//while문 끝
        
        //모델에 저장
        //model.addAttribute("data", list);
        logger.info("libSearch에서 컨트롤러로 보낼 값: {}",list);
        return list;
        
        /*for(SearchListVO book:list)
            System.out.println("☆★☆JSON 출력★☆★: "+book);
        }*/
        
            

}
