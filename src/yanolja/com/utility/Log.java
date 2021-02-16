package yanolja.com.utility;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class Log {

	static Logger Log0 = Logger.getLogger(Log.class);
	static Logger Log1 = Logger.getLogger("prac");
	static Logger Log2 = Logger.getLogger("prac2");
	
	public static void startTC(String TC) {
		PropertyConfigurator.configure(Constant.Path_project+"//src//log4j.properties");
		Log1.info("######################################## " + TC + " Start ########################################");
	}

	public static void endTC(String TC) {
		PropertyConfigurator.configure(Constant.Path_project+"//src//log4j.properties");
		Log1.info("######################################## " + TC + " Close ########################################");
	}

	public static void info(String message) {
		PropertyConfigurator.configure(Constant.Path_project+"//src//log4j.properties");
		Log1.info(message);
	}

	public static void warn(String message) {
		PropertyConfigurator.configure(Constant.Path_project+"//src//log4j.properties");
		Log2.warn(message);
	}

	public static void error(String browser,String TC, String message) {
		PropertyConfigurator.configure(Constant.Path_project+"//src//log4j.properties");
		Log2.error("에러 위치 : " + TC);
		Log2.error("브라우저 : " + browser);
		Log2.error(message);
	}

	public static void fatal(String message) {
		PropertyConfigurator.configure(Constant.Path_project+"//src//log4j.properties");
		Log2.fatal(message);

	}

	public static void debug(String message) {
		PropertyConfigurator.configure(Constant.Path_project+"//src//log4j.properties");
		Log2.debug(message);

	}

}
