package yanolja.com.automationScript;

import static org.testng.Assert.assertEquals;

import java.io.IOException;

import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import yanolja.com.pageObject.GNB;
import yanolja.com.pageObject.GlobalPlace;
import yanolja.com.pageObject.Home;
import yanolja.com.pageObject.Login;
import yanolja.com.pageObject.Purchase;
import yanolja.com.pageObject.myYanolja;
import yanolja.com.pageObject.sHomeGlobalPlace;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;


public class YanoljaGlobalPlace {
	String tc_id;
	Long time;

	@Parameters("browser")
	@BeforeMethod
	public void setUp(String browser) {
		
		time = 0L;
		
		Home home = new Home(browser);

		home.get();
	}

	@Parameters("browser")
	@Test
	public void Log_0082 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryGlobalPlace();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("GHome", "web", "글로벌 서브홈 페이지 뷰", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void Log_0083 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryGlobalPlace();
			
			sHomeGlobalPlace.sHomeThemedItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("GPlaceDetail", "web", "해외숙소 상세 뷰", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void Log_0080 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryGlobalPlace();
			
			sHomeGlobalPlace.sHomeThemedItem();
			
			GlobalPlace.selectRoom();
			
			GlobalPlace.reservation();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("GlobalOrder", "web", "글로벌 예약하기 화면 진입", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}

	@Parameters("browser")
	@Test
	public void Log_0079_0081 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login("inho.choi@yanolja.com", "a5w2h6m8**");
			
			GNB.home();
			
			Home.quickCategoryGlobalPlace();
			
			sHomeGlobalPlace.sHomeThemedItem();
			
			GlobalPlace.selectRoom();
			
			GlobalPlace.reservation();
			
			Purchase.emailClear();
			
			Purchase.email("inho.choi@yanolja.com");
			
			Purchase.lastName("CHOI");
			
			Purchase.firstName("INHO");
			
			Purchase.globalAgreeAll();
			
			Purchase.globalOrder();
			
			Thread.sleep(12000);
			
			assertEquals(Dilog.assertLogByDesc("GlobalOrder", "web", "결제하기 버튼 클릭", "click", time),true);
			assertEquals(Dilog.assertLogByDesc("GlobalPayment", "web", "글로벌 결제하기 화면 진입", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}

	@Parameters("browser")
	@AfterMethod
	public void takeScreenShot(ITestResult testResult, String browser) throws IOException {
		
		Log.info("테스트 결과 : " + Util.testResult(testResult.getStatus()));
		
		if (testResult.getStatus() == ITestResult.FAILURE) {
			Util.ScreenShot(testResult);
		}
		Browser.close(tc_id);
	}
}
