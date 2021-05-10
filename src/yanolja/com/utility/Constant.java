package yanolja.com.utility;

import org.testng.annotations.Parameters;

@Parameters("browser")
public class Constant {
	
	// MAIN URL   
	public static final String URL = "http://qa-m.yanolja.com";
	public static final String TITLE = "야놀자 | 국내도 해외도 초특가 야놀자";
    // project 경로
    public static final String Path_project = System.getProperty("user.dir");
    public static final String DILOGDOMAIN = " https://dilog.di.yanolja.in/api/qa/logs";
    //테스트계정
    public static final String MEMBERNO = "40107112";
    public static final String TESTID = "cih0405@naver.com";
    public static final String TESTPW = "a5w2h6m8**";
    
    public static String pageName;
    public static String eventType;
    public static String desc;
    public static String enviroment = "web";
    
    public static long time() {
        long time = System.currentTimeMillis();
        
        return time;
    }
}
