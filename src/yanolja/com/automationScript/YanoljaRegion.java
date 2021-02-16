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
import yanolja.com.pageObject.Region;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;


public class YanoljaRegion {
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
	public void Log_0071 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryRegion();
			
			Region.regionhomeMapInfo();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("RegionMap", "web", "Region 지도 페이지뷰", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void Log_0072 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryRegion();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("RegionHome", "web", "지역서브홈 페이지뷰", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void Log_0073_0074 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryRegion();
			
			Region.rankingWidgetItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("RegionHome", "web", "지역 서브홈 내, 랭킹 타입 추천 위젯 카테고리 내, 상품 노출", "impr", time),true);
			assertEquals(Dilog.assertLogByDesc("RegionHome", "web", "지역 서브홈 내, 랭킹 타입 추천 위젯 카테고리 내, 상품 클릭", "click", time),true);
		
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
