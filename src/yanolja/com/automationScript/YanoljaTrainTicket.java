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
import yanolja.com.pageObject.Home;
import yanolja.com.pageObject.Login;
import yanolja.com.pageObject.Purchase;
import yanolja.com.pageObject.Train;
import yanolja.com.pageObject.myYanolja;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;


public class YanoljaTrainTicket {
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
	public void test_TrainPayment_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryTrain();
			
			Train.oneWay();
			
			Train.start();
			
			Train.searchText("서울");
			
			Train.searchResult();
			
			Train.destination();
			
			Train.searchText("대전");
			
			Train.searchResult();
			
			Train.calendar();
			
			Train.selectDate();
			
			Train.apply();
			
			Train.ticketSearch();
			
			Wait.loader();
			
			Train.resultSelectTicket();
			
			Wait.loader();
			
			Train.resultSelectTicketing();
			
			Train.popupOk();
			
			Train.reservation();
			
			Purchase.birthday("19840405");
			
			Purchase.paymentKakao();
			
			Purchase.trainTicketOrderAgreeAll();
			
			Purchase.trainTicketOrder();
			
			Thread.sleep(12000);
			
			assertEquals(Dilog.assertLogByDesc("TrainPayment", "web", "결제 페이지 진입", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_TrainOrderComplete_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryTrain();
			
			Train.oneWay();
			
			Train.start();
			
			Train.searchText("서울");
			
			Train.searchResult();
			
			Train.destination();
			
			Train.searchText("부산");
			
			Train.searchResult();
			
			Train.calendar();
			
			Train.selectDate();
			
			Train.apply();
			
			Train.ticketSearch();
			
			Wait.loader();
			
			Train.resultSelectTicket();
			
			Wait.loader();
			
			Train.resultSelectTicketing();
			
			Train.popupOk();
			
			Train.reservation();
			
			Purchase.birthday("19840405");
			
			Purchase.point();
			
			Purchase.trainTicketOrderAgreeAll();
			
			Purchase.trainTicketOrder();
			
			Thread.sleep(12000);
			
			assertEquals(Dilog.assertLogByDesc("TrainOrderComplete", "web", "주문 완료 페이지 진입", "view", time),true);
		
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
