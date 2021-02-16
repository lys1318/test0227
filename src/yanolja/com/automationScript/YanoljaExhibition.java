package yanolja.com.automationScript;

import static org.testng.Assert.assertEquals;

import java.io.IOException;

import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import yanolja.com.pageObject.Exhibition;
import yanolja.com.pageObject.GNB;
import yanolja.com.pageObject.Home;
import yanolja.com.pageObject.LeisurePDP;
import yanolja.com.pageObject.LeisurePLP;
import yanolja.com.pageObject.Login;
import yanolja.com.pageObject.OrderComplete;
import yanolja.com.pageObject.Purchase;
import yanolja.com.pageObject.Train;
import yanolja.com.pageObject.myYanolja;
import yanolja.com.pageObject.sHomeLeisure;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;


public class YanoljaExhibition {
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
	public void Log_0075_0077 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.exhibitionListRooms();

			Wait.loader();
			
			Exhibition.roomslistItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("Exhibition", "web", "그룹별, 개별 상품별 노출(국내숙소)", "impr", time),true);
			assertEquals(Dilog.assertLogByDesc("Exhibition", "web", "그룹별, 개별 상품 클릭(국내숙소)", "click", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void Log_0076_0078 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.exhibitionListLeisure();

			Wait.loader();
			
			Exhibition.leisurelistItem();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("Exhibition", "web", "그룹별, 개별 상품별 노출(국내레져)", "impr", time),true);
			assertEquals(Dilog.assertLogByDesc("Exhibition", "web", "그룹별, 개별 상품 클릭(국내레져)", "click", time),true);
		
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
