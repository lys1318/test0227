package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.FlightsPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;

public class Flights {
	
	public static String Title() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(FlightsPage.flightsTitle());
		
		String flightsTitle = FlightsPage.flightsTitle().getText();

		Log.info("항공권 > 타이틀을 저장 하였습니다. (타이틀 : " + flightsTitle + ")");
		Allure.step("항공권 > 타이틀을 저장 하였습니다. (타이틀 : " + flightsTitle + ")");

		return flightsTitle;
	}

	public static void Back() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.navBack());
		
		FlightsPage.navBack().click();

		Log.info("상단 네비게이션에서 Back 버튼을 선택 하였습니다.");
		Allure.step("상단 네비게이션에서 Back 버튼을 선택 하였습니다.");
	}
	
	public static void oneWay() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.oneWay());
		
		FlightsPage.oneWay().click();
		
		Log.info("편도 탭을 선택 하였습니다.");
		Allure.step("편도 탭을 선택 하였습니다.");
	}
	
	public static void roundTrip() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.roundTrip());
		
		FlightsPage.roundTrip().click();
		
		Log.info("왕복 탭을 선택 하였습니다.");
		Allure.step("왕복 탭을 선택 하였습니다.");
	}
	
	public static void start() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.start());
		
		FlightsPage.start().click();
		
		Log.info("출발지를 선택 하였습니다.");
		Allure.step("출발지를 선택 하였습니다.");
	}
	
	public static void destination() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.destination());
		
		FlightsPage.destination().click();
		
		Log.info("도착지를 선택 하였습니다.");
		Allure.step("도착지를 선택 하였습니다.");
	}
	
	public static void searchText(String text) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.searchText());
		
		FlightsPage.searchText().sendKeys(text);
		
		Log.info("검색어를 입력 하였습니다.");
		Allure.step("검색어를 입력 하였습니다.");
	}
	
	public static void searchResult() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.searchResult());
		
		FlightsPage.searchResult().click();
		
		Log.info("검색결과 리스트에서 첫번째 결과항목을 선택 하였습니다.");
		Allure.step("검색결과 리스트에서 첫번째 결과항목을 선택 하였습니다.");
	}
	
	public static void calendar() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.calendar());
		
		FlightsPage.calendar().click();
		
		Log.info("가는날을 선택 하였습니다.");
		Allure.step("가는날을 선택 하였습니다.");
	}
	
	public static String calendarTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(FlightsPage.calendarTitle());
		
		String calendarTitle = FlightsPage.calendarTitle().getText();

		Log.info("항공권 > 날짜 선택 > 타이틀을 저장 하였습니다. (타이틀 : " + calendarTitle + ")");
		Allure.step("항공권 > 날짜 선택 > 타이틀을 저장 하였습니다. (타이틀 : " + calendarTitle + ")");

		return calendarTitle;
	}
	
	public static void selectDate() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i < FlightsPage.selectDate().size(); i++) {
			System.out.println(Integer.parseInt(FlightsPage.selectDate().get(i).getText()));
			if (Util.getDay() == Integer.parseInt(FlightsPage.selectDate().get(i).getText())) {
				System.out.println("일치!");
				//System.out.println(Integer.parseInt(FlightsPage.selectDate().get(i).getText()));
				//Browser.driver().findElement(By.cssSelector("div[class^='DatePicker_dayString' innerText='"+ (Util.getDay()+1) +"']")).click();
				FlightsPage.selectDate().get(Util.getDay()+1).click();
				break;
			}
		}
		
		Log.info("날짜를 선택 하였습니다.");
		Allure.step("날짜를 선택 하였습니다.");
		
	}
	
	public static void apply() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.apply());
		
		FlightsPage.apply().click();
		
		Log.info("날짜 선택 후 적용버튼을 선택 하였습니다.");
		Allure.step("날짜 선택 후 적용버튼을 선택 하였습니다.");
	}
	
	public static void ticketSearch() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.ticketSearch());
		
		FlightsPage.ticketSearch().click();
		
		Log.info("항공권 검색 버튼을 선택 하였습니다.");
		Allure.step("항공권 검색 버튼을 선택 하였습니다.");
	}
	
	public static void resultSelectTicket() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.resultSelectTicket());
		
		FlightsPage.resultSelectTicket().click();
		
		Log.info("검색결과 > 승차권을 선택 하였습니다.");
		Allure.step("검색결과 > 승차권을 선택 하였습니다.");
	}
	
	public static void selectProvider() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(FlightsPage.selectProvider());
		
		FlightsPage.selectProvider().click();
		
		Log.info("항공권 정보 > 가격리스트에서 결제처를 선택 하였습니다.");
		Allure.step("항공권 정보 > 가격리스트에서 결제처를 선택 하였습니다.");
	}
}
