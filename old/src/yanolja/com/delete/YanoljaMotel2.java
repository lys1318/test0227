package yanolja.com.delete;

import static org.testng.Assert.assertEquals;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Set;

import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

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
import yanolja.com.utility.spreadSheetUtil;


public class YanoljaMotel2 {
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
	public void test_MTHome_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "MTHome";
		Constant.eventType = "view";
		Constant.desc = "국내모텔 서브홈 화면 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));

			Home.quickCategoryMotel();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	

	/*
	@Parameters("browser")
	@Test
	public void test_Order_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "Order";
		Constant.eventType = "view";
		Constant.desc = "[국내숙소] 예약 첫페이지 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			String parentWindowHandle = Browser.driver().getWindowHandle();
			System.out.println("Parent window handle: " + parentWindowHandle);
			
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
			
			RoomDetail.purchase();
			
			Set<String> windowHandles = Browser.driver().getWindowHandles();
			
			for(String handle : windowHandles) {
				if(!handle.equals(parentWindowHandle)) {
					Browser.driver().switchTo().window(handle);
					System.out.println("Title of the new window: " + Browser.driver().getTitle());
				}
			}
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void test_OrderComplete_view (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		Constant.pageName = "OrderComplete";
		Constant.eventType = "view";
		Constant.desc = "[국내숙소] 예약 완료 페이지 진입";
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			String parentWindowHandle = Browser.driver().getWindowHandle();
			System.out.println("Parent window handle: " + parentWindowHandle);
			
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
			
			RoomDetail.purchase();
			
			Thread.sleep(5000);
			
			Set<String> windowHandles = Browser.driver().getWindowHandles();
			
			System.out.println(windowHandles);
			
			for(String handle : windowHandles) {
				if(!handle.equals(parentWindowHandle)) {
					Browser.driver().switchTo().window(handle);
					System.out.println("Title of the new window: " + Browser.driver().getTitle());
				}
			}
			
			//Purchase.working();
			System.out.println(Browser.driver().getTitle());
			
			Purchase.point();
			
			Purchase.agreeAll();
			
			Purchase.order();
			
			Thread.sleep(10000);
			
			assertEquals(Dilog.assertLogByDesc(Constant.pageName, Constant.enviroment, Constant.desc, Constant.eventType, time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	*/
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
