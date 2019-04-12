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
	
	public ArrayList<LivInfoVO> libLocation(ArrayList<LibraryVO> liblist){
	
		//입력 값 변환 및 확인
		logger.info("libLocation에서 받은 값:{}",liblist);
		
		BufferedReader br = null;
	
		
		
		
	/*	
    try {
    	//String text = URLEncoder.encode(isbn, "UTF-8");
    	
    //요청 url 설정
        String apiURL = "";
        apiURL = "http://nl.go.kr/kolisnet/openApi/open.php?"
        		+ "page=1"
        		+ "&gubun1=ISBN"
        		+ "&code1=" + isbn
        		+ "&per_page=10";
        
        //"http://nl.go.kr/kolisnet/openApi/open.php?page=1&gubun1=ISBN&code1=9788959895526&per_page=10"
        
    //API호출
        URL url = new URL(apiURL);
        HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
    	urlconnection.setRequestMethod("GET");
    	br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
    	
        String data = "";
        String msg;
        
	//응답 받기
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        System.out.println("readLine으로 읽어들인 데이터:"+data);
        
        ArrayList<LibraryVO> list = null; //결과데이터 담을 리스트 
        //System.out.println(data); //응답받은 xml문서 xml문서로부터 내가 원하는 값 탐색하기(xml 파싱)
        
        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        XmlPullParser parser = factory.newPullParser(); //연결하는거 담고 
        parser.setInput(new StringReader(data));
     
    
    //받은 값 객체에 저장
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
             				if(tag.equals("RECORD")){
             					
             					//도서관 정보가 있는 데이터만 배열에 저장하기
             					if(b.getLIB_NAME()!=""){
             					
                 					list.add(b);
                 					b = null;
             					}
             				}
             			}
             			
             	case XmlPullParser.START_TAG://무조건 시작하면 만남 
             			{ 
             			String tag = parser.getName();
             			
             			switch(tag){//안쪽 스위치
             				case "RECORD": //items가 열렸다는것은 새로운 책이 나온다는것 
             					
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

//확인차 출력    
    for(LibraryVO i : list){
    	
    	if(i.getLIB_NAME() != "")logger.info("\nlibSearch에서 컨트롤러로 보낼 값: {}\n",i);
    
    }
    
//컨트롤러로 값 전송
    return list;


    }catch (Exception e) {System.out.println(e.getMessage());}
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	return null;
	}//메서드 끝
}//클래스 끝
