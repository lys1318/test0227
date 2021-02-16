package yanolja.com.automationScript;

import static org.testng.Assert.assertEquals;

import java.io.IOException;

import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import yanolja.com.pageObject.Flights;
import yanolja.com.pageObject.Home;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Dilog;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;


public class YanoljaFlights {
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
	public void Log_0096 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryFights();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("FlightHome", "web", "항공홈 페이지뷰", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}
	
	@Parameters("browser")
	@Test
	public void Log_0094 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryFights();
			
			Flights.oneWay();
			
			Flights.start();
			
			Flights.searchText("인천");
			
			Flights.searchResult();
			
			Flights.destination();
			
			Flights.searchText("도쿄");
			
			Flights.searchResult();
			
			Flights.calendar();
			
			Flights.selectDate();
			
			Flights.apply();
			
			Flights.ticketSearch();
			
			Wait.loader();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("FlightSearchList", "web", "검색결과 페이지뷰", "view", time),true);
		
		} catch (Exception e) {
			Log.error(browser, tc_id, e.getMessage());
			Assert.fail();
		}
	}

	@Parameters("browser")
	@Test
	public void Log_0095 (String browser) throws InterruptedException {
		tc_id = Thread.currentThread().getStackTrace()[1].getMethodName();
		Log.startTC(tc_id);
		
		try {
			time = Constant.time();
			Log.info("테스트 시작 시간 : " + Util.longTodate(time));
			
			Home.quickCategoryFights();
			
			Flights.oneWay();
			
			Flights.start();
			
			Flights.searchText("인천");
			
			Flights.searchResult();
			
			Flights.destination();
			
			Flights.searchText("도쿄");
			
			Flights.searchResult();
			
			Flights.calendar();
			
			Flights.selectDate();
			
			Flights.apply();
			
			Flights.ticketSearch();
			
			Wait.loader();
			
			Flights.resultSelectTicket();
			
			Flights.selectProvider();
			
			Thread.sleep(5000);
			
			assertEquals(Dilog.assertLogByDesc("FlightSearchList", "web", "가격리스트에서 결제처선택", "click", time),true);
		
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
