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

import yanolja.com.pageObject.GNB;
import yanolja.com.pageObject.Home;
import yanolja.com.pageObject.LeisurePDP;
import yanolja.com.pageObject.LeisurePLP;
import yanolja.com.pageObject.Login;
import yanolja.com.pageObject.OrderComplete;
import yanolja.com.pageObject.Purchase;
import yanolja.com.pageObject.myYanolja;
import yanolja.com.pageObject.sHomeLeisure;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;
import yanolja.com.utility.spreadSheetUtil;


public class YanoljaLeisureTicket {
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
	public void test_LeisureOrderComplete_mobile_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "LeisureOrderComplete";
		Constant.eventType = "view";
		Constant.desc = "[국내레저] 결제완료 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryLeisure();
			
			sHomeLeisure.categoryMore();
			
			sHomeLeisure.tabBarMobileVoucher();
			
			sHomeLeisure.mobileVoucherCategory();
			
			sHomeLeisure.mobileVoucherCategoryAll();
			
			LeisurePLP.mobileVoucherCategoryListItem();
			
			Thread.sleep(3000);
			
			LeisurePDP.countUp();
			
			LeisurePDP.callToAction();
			
			Purchase.point();
			
			Purchase.agreeAll();
			
			Purchase.order();
			
			Thread.sleep(10000);
			
			OrderComplete.orderComplete();
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_LeisureOrder_mobile_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "LeisureOrder";
		Constant.eventType = "view";
		Constant.desc = "[국내레저] 구매하기 화면 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryLeisure();
			
			sHomeLeisure.categoryMore();
			
			sHomeLeisure.tabBarMobileVoucher();
			
			sHomeLeisure.mobileVoucherCategory();
			
			sHomeLeisure.mobileVoucherCategoryAll();
			
			LeisurePLP.mobileVoucherCategoryListItem();
			
			Thread.sleep(3000);
			
			LeisurePDP.countUp();
			
			LeisurePDP.callToAction();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_LeisureOrderComplete_normal_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "LeisureOrderComplete";
		Constant.eventType = "view";
		Constant.desc = "[국내레저] 결제완료 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryLeisure();
			
			sHomeLeisure.sHomePopularCategoryAll();
			
			LeisurePLP.leisureListItem();
			
			Thread.sleep(3000);
			
			LeisurePDP.countUp();
			
			LeisurePDP.callToAction();
			
			Purchase.point();
			
			Purchase.agreeAll();
			
			Purchase.order();
			
			Thread.sleep(10000);
			
			OrderComplete.orderComplete();
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_LeisureOrder_normal_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "LeisureOrder";
		Constant.eventType = "view";
		Constant.desc = "[국내레저] 구매하기 화면 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryLeisure();
			
			sHomeLeisure.sHomePopularCategoryAll();
			
			LeisurePLP.leisureListItem();
			
			Thread.sleep(3000);
			
			LeisurePDP.countUp();
			
			LeisurePDP.callToAction();
						
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
			spreadSheetUtil.failHistoryAppend(Util.failDateTime(), Constant.pageName, Constant.eventType, Constant.enviroment, Constant.desc);
		}
		Browser.close(tc_id);
	}
}
