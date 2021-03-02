package yanolja.com.automationScript;

import static org.testng.Assert.assertEquals;

import java.io.IOException;

import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import yanolja.com.pageObject.Home;
import yanolja.com.pageObject.sHomeHotel;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;


public class YanoljaHotel {
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
	public void test_HTHome_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryHotel();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("HTHome", "web", "국내호텔 서브홈 화면 진입", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_HTHome_category_click (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			long time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryHotel();
			
			sHomeHotel.sHomeThemedItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("HTHome", "web", "테마형그룹 추천 상품-카테고리별 상품 클릭", "click", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_HTHome_list_click (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			long time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryHotel();
			
			sHomeHotel.sHomeListItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("HTHome", "web", "리스트형 추천상품 - 상품 클릭", "click", time),true);
		
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
