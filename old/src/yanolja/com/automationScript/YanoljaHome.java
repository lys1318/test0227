package yanolja.com.automationScript;

import static org.testng.Assert.assertEquals;

import java.io.IOException;
import java.security.GeneralSecurityException;

import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import yanolja.com.pageObject.Home;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.NewSpredSheetUtil;
import yanolja.com.utility.Util;
import yanolja.com.utility.spreadSheetUtil;


public class YanoljaHome {
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
	public void test_Home_Pension_impr (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "Home";
		Constant.eventType = "impr";
		Constant.desc = "국내숙소 추천 위젯 테마(숙소카테고리) 숙소단위 impression";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.recommendType();
			
			Home.themePlaceItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_Home_Pension_click (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "Home";
		Constant.eventType = "click";
		Constant.desc = "국내숙소 추천 위젯 > 호텔/펜션 각 추천 상품 클릭";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.recommendType();
			
			Home.themePlaceItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}

	@Parameters("browser")
	@Test
	public void test_Home_Hotel_impr (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "Home";
		Constant.eventType = "impr";
		Constant.desc = "국내숙소 추천 위젯 테마(숙소카테고리) 숙소단위 impression";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.otherTheme();
			
			Home.recommendType();
			
			Home.themePlaceItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_Home_Hotel_click (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "Home";
		Constant.eventType = "click";
		Constant.desc = "국내숙소 추천 위젯 > 호텔/펜션 각 추천 상품 클릭";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.otherTheme();
			
			Home.recommendType();
			
			Home.themePlaceItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@AfterMethod
	public void takeScreenShot(ITestResult testResult, String browser) throws IOException, GeneralSecurityException {
		
		Log.info("테스트 결과 : " + Util.testResult(testResult.getStatus()));
		
		if (testResult.getStatus() == ITestResult.FAILURE) {
			Util.ScreenShot(testResult);
			NewSpredSheetUtil.failHistoryAppend(Util.failDateTime(), Constant.pageName, Constant.eventType, Constant.enviroment, Constant.desc);
		}
		Browser.close(tc_id);
	}
}
