package yanolja.com.utility;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.ITestResult;

import io.qameta.allure.Allure;

public class Util {
	
	public static String testResult(Integer result) {
		String Result = null;

		if (result == 1) {
			Result = "Pass";
		} else if (result == 2) {
			Result = "Fail";
		}

		return Result;
	}

	public static void ScreenShot(ITestResult testResult) throws IOException {
		String getInstanceName = testResult.getInstanceName();

		File scrFile = ((TakesScreenshot) Browser.driver()).getScreenshotAs(OutputType.FILE);
		FileUtils.copyFile(scrFile, new File(Constant.Path_project + "//takeScreenShot//" + todayDate() + "//error_"
				+ getInstanceName + "_" + todayDateTime() + ".png"));

		System.out.println(Constant.Path_project + "//takeScreenShot//" + todayDate() + "//error_" + getInstanceName
				+ "_" + todayDateTime() + ".png 스크린샷 캡처가 완료 되었습니다.");
		
		Allure.addAttachment("error_" + getInstanceName + "_" + todayDateTime() + ".png",  FileUtils.openInputStream(scrFile));
	}

	// 현재 날짜 및 시간 기준으로 String 생성
	public static String todayDateTime() {
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
		Date date = new Date();

		String todaydatetime = dateFormat.format(date);

		return todaydatetime;
	}

	// 현재 날짜 기준으로 String 생성
	public static String todayDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();

		String todaydate = dateFormat.format(date);

		return todaydate;
	}
	
	// 현재 날짜 기준으로 getDay
	public static Integer getDay() {

		Calendar cal = Calendar.getInstance();

		return cal.get(Calendar.DAY_OF_MONTH);
	}
	
	// long -> date 변환 
	public static String longTodate(long time) {
		
		String dateFormatStringTime;
		
		Date date = new Date(time);
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormatStringTime = dataFormat.format(date);
		
		return dateFormatStringTime;
	}
}
