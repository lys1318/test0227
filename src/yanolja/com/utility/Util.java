package yanolja.com.utility;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.ITestResult;

import io.qameta.allure.Allure;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.response.ResponseBody;

public class Util {

	public static JSONParser parser = new JSONParser();
	
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

		Allure.addAttachment("addAttachment : error_" + getInstanceName + "_" + todayDateTime() + ".png",
				FileUtils.openInputStream(scrFile));

	}

	// 현재 날짜 및 시간 기준으로 String 생성
	public static String todayDateTime() {
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
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

	// 잔여포인트 확인
	public static JSONArray remainingPoint(String memberNo) {
		
		try {
			Response res = RestAssured
								.given().header("member-no", memberNo)
								.when().get("http://yapay-money-api.qa.yanolja.in/api/v1/asset");
			
			System.out.println(res.body().asString());
		
			return (JSONArray) parser.parse(res.body().asString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	// 포인트(캐시) 충전
	public static void chargePoint(String memberNo) {
		
		Map<String, Object> requestData = new HashMap<>();
		requestData.put("amount", 10000);
		requestData.put("merchantKey", "ADMIN");
		requestData.put("typeDetail", "운영자 지급");
		requestData.put("note", "QA테스트");
		requestData.put("txId", todayDateTime());
		
		RestAssured
			.given()
				.header("member-no", memberNo)
				.contentType("application/json")
				.body(requestData).log().all()
			.when().post("http://yapay-money-api.qa.yanolja.in/api/v1/asset/charge")
			.then()
				.statusCode(200);
	}
	
	// 포인트 조회 및 충전 
	public static void point() {
		JSONArray arr = Util.remainingPoint(Constant.MEMBERNO);

		JSONObject obj = (JSONObject) arr.get(0);
		
		Log.info("remainingPoint : " + obj);
		
		Integer point = 200000;
		
		if (Integer.parseInt(obj.get("usableAmount").toString()) < point) {
			System.out.println("잔여포인트가 200,000 보다 작습니다. 충전이 필요합니다.(잔여포인트 : " + obj.get("usableAmount") + ")");
			Log.info("잔여포인트가 200,000 보다 작습니다. 충전이 필요합니다.(잔여포인트 : " + obj.get("usableAmount") + ")");
			
			Util.chargePoint(Constant.MEMBERNO);
		} else {
			System.out.println("잔여포인트가 200,000 보다 커서 충전하지 않습니다. (잔여포인트 : " + obj.get("usableAmount") + ")");
			Log.info("잔여포인트가 200,000 보다 커서 충전하지 않습니다. (잔여포인트 : " + obj.get("usableAmount") + ")");
		}
	}
}
