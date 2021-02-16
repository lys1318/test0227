package yanolja.com.utility;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.testng.annotations.Parameters;

@Parameters("browser")
public class Constant {
	
	// MAIN URL   
	public static final String URL = "http://qa-m.yanolja.com";
	public static final String TITLE = "야놀자 | 국내도 해외도 초특가 야놀자";
    // project 경로
    public static final String Path_project = System.getProperty("user.dir");
    public static final String DILOGDOMAIN = " https://dilog.di.yanolja.in/api/qa/logs";
    
    public static long time() {
        long time = System.currentTimeMillis();
        
        return time;
    }
}
