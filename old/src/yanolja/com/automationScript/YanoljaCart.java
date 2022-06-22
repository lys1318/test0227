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

import yanolja.com.pageObject.Cart;
import yanolja.com.pageObject.GNB;
import yanolja.com.pageObject.Home;
import yanolja.com.pageObject.Login;
import yanolja.com.pageObject.PlaceDetail;
import yanolja.com.pageObject.PlaceList;
import yanolja.com.pageObject.Purchase;
import yanolja.com.pageObject.RoomDetail;
import yanolja.com.pageObject.myYanolja;
import yanolja.com.pageObject.sHomeMotel;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.NewSpredSheetUtil;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;


public class YanoljaCart {
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
	public void test_PlaceHandler_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "PlaceHandler";
		Constant.eventType = "view";
		Constant.desc = "[국내숙소] RDP에서 구매핸들러 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.quickCategoryMotel();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion1Depth();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion2Depth();
			
			Wait.loader();
			
			PlaceList.placeListItem();
			
			PlaceDetail.roomItem();
			
			RoomDetail.roomReserveAvailable();
			
			Thread.sleep(10000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_Cart_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "Cart";
		Constant.eventType = "view";
		Constant.desc = "장바구니 화면 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.cart();
			
			Cart.delete();

			Thread.sleep(10000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	

	@Parameters("browser")
	@Test
	public void test_CartOrder_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "CartOrder";
		Constant.eventType = "view";
		Constant.desc = "통합 예약 페이지 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.cart();
			
			Cart.delete();
			
			Home.quickCategoryMotel();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion1Depth();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion2Depth();
			
			Wait.loader();
			
			PlaceList.placeListItem();
			
			PlaceDetail.roomItem();
			
			RoomDetail.roomReserveAvailable();
			
			RoomDetail.cartIn();
			
			Cart.cart();
			
			Cart.reservation();
			
			Thread.sleep(10000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	
	@Parameters("browser")
	@Test
	public void test_CartOrderComplete_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "CartOrderComplete";
		Constant.eventType = "view";
		Constant.desc = "예약 완료 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.cart();
			
			Cart.delete();
			
			Home.quickCategoryMotel();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion1Depth();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion2Depth();
			
			Wait.loader();
			
			PlaceList.placeListItem();
			
			PlaceDetail.roomItem();
			
			RoomDetail.roomReserveAvailable();
			
			RoomDetail.cartIn();
			
			Cart.cart();
			
			Cart.reservation();
			
			Thread.sleep(5000);
			
			Purchase.point();
			
			Purchase.agreeAll();
			
			Thread.sleep(3000);
			
			Purchase.order();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}

	@Parameters("browser")
	@Test
	public void test_CartOrderPayment_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "CartOrderPayment";
		Constant.eventType = "view";
		Constant.desc = "결제 화면 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			GNB.myYanolja();
			
			myYanolja.loginLink();
			
			Login.login(Constant.TESTID, Constant.TESTPW);
			
			GNB.home();
			
			Home.cart();
			
			Cart.delete();
			
			Home.quickCategoryMotel();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion1Depth();
			
			Thread.sleep(2000);
			
			sHomeMotel.sHomeRegion2Depth();
			
			Wait.loader();
			
			PlaceList.placeListItem();
			
			PlaceDetail.roomItem();
			
			RoomDetail.roomReserveAvailable();
			
			RoomDetail.cartIn();
			
			Cart.cart();
			
			Cart.reservation();
			
			Thread.sleep(5000);
			
			Purchase.point();
			
			Purchase.agreeAll();
			
			Thread.sleep(3000);
			
			Purchase.order();
			
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
