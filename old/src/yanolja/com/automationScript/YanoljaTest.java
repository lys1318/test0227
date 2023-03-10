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

import yanolja.com.pageObject.Exhibition;
import yanolja.com.pageObject.GNB;
import yanolja.com.pageObject.GlobalPlace;
import yanolja.com.pageObject.Home;
import yanolja.com.pageObject.Login;
import yanolja.com.pageObject.PlaceDetail;
import yanolja.com.pageObject.Purchase;
import yanolja.com.pageObject.myYanolja;
import yanolja.com.pageObject.sHomeGlobalPlace;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.NewSpredSheetUtil;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;


public class YanoljaTest {
	String tc_id;
	Long time;

	@Parameters("browser")
	@BeforeMethod
	public void setUp(String browser) {
		
		time = 0L;
		
		Home home = new Home(browser);

		home.get();
		
		//Util.point();
	}

	@Parameters("browser")
	@Test
	public void test_GlobalPayment_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "GlobalPayment";
		Constant.eventType = "view";
		Constant.desc = "글로벌 결제하기 화면 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryGlobalPlace();
			
			sHomeGlobalPlace.sHomeThemedItem2();
			
			GlobalPlace.selectRoom();
			
			GlobalPlace.reservation();
			
			Purchase.emailClear();
			
			Purchase.email("inho.choi@yanolja.com");
			
			Purchase.lastName("CHOI");
			
			Purchase.firstName("INHO");
			
			Purchase.point();
			
			Purchase.globalAgreeAll();
			
			Purchase.globalOrder();
			
			Thread.sleep(12000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@AfterMethod
	public void tearDown(ITestResult testResult, String browser) throws IOException, GeneralSecurityException {
		
		Log.info("테스트 결과 : " + Util.testResult(testResult.getStatus()));
		
		if (testResult.getStatus() == ITestResult.FAILURE) {
			Util.ScreenShot(testResult);
			//NewSpredSheetUtil.failHistoryAppend(Util.failDateTime(), Constant.pageName, Constant.eventType, Constant.enviroment, Constant.desc);
		}
		Browser.close(tc_id);
	}
}
