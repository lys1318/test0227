package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.RoomDetailPage;
import yanolja.com.uiMap.TrainPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;

public class Train {
	
	public static void oneWay() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(TrainPage.oneWay());
		
		TrainPage.oneWay().click();
		
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
		
		Wait.elementToBeClickable(TrainPage.roundTrip());
		
		TrainPage.roundTrip().click();
		
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
		
		Wait.elementToBeClickable(TrainPage.start());
		
		TrainPage.start().click();
		
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
		
		Wait.elementToBeClickable(TrainPage.destination());
		
		TrainPage.destination().click();
		
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
		
		Wait.elementToBeClickable(TrainPage.searchText());
		
		TrainPage.searchText().sendKeys(text);
		
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
		
		Wait.elementToBeClickable(TrainPage.searchResult());
		
		TrainPage.searchResult().click();
		
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
		
		Wait.elementToBeClickable(TrainPage.calendar());
		
		TrainPage.calendar().click();
		
		Log.info("가는날을 선택 하였습니다.");
		Allure.step("가는날을 선택 하였습니다.");
	}
	/*
	public static void selectDate() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(TrainPage.selectDate());
		
		TrainPage.selectDate().click();
		
		Log.info("날짜를 선택 하였습니다.");
	}
	*/
	public static void selectDate() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i < TrainPage.selectDate().size(); i++) {
			if (Util.getDay() == Integer.parseInt(TrainPage.selectDate().get(i).getText())) {
				System.out.println("일치!");
				//Browser.driver().findElement(By.cssSelector("div[class^='DatePicker_dayString' innerText='"+ (Util.getDay()+1) +"']")).click();
				TrainPage.selectDate().get(Util.getDay()+1).click();
				break;
			}
		}
		
	}
	
	public static void apply() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(TrainPage.apply());
		
		TrainPage.apply().click();
		
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
		
		Wait.elementToBeClickable(TrainPage.ticketSearch());
		
		TrainPage.ticketSearch().click();
		
		Log.info("승차권 검색 버튼을 선택 하였습니다.");
		Allure.step("승차권 검색 버튼을 선택 하였습니다.");
	}
	
	public static void resultSelectTicket() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(TrainPage.resultSelectTicket());
		
		TrainPage.resultSelectTicket().click();
		
		Log.info("검색결과 > 승차권을 선택 하였습니다.");
		Allure.step("검색결과 > 승차권을 선택 하였습니다.");
	}
	
	public static void resultSelectTicketing() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(TrainPage.resultSelectTicketing());
		
		TrainPage.resultSelectTicketing().click();
		
		Log.info("검색결과 > 승차권 > 바로예매 를 선택 하였습니다.");
		Allure.step("검색결과 > 승차권 > 바로예매 를 선택 하였습니다.");
	}
	
	public static void popupOk() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(TrainPage.popupOk());
		
		TrainPage.popupOk().click();
		
		Log.info("검색결과 > 승차권 > 바로예매 > 바로예매팝업 > 확인을 선택 하였습니다.");
		Allure.step("검색결과 > 승차권 > 바로예매 > 바로예매팝업 > 확인을 선택 하였습니다.");
	}
	/*
	public static void reservation() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(TrainPage.reservation());
		
		TrainPage.reservation().click();
		
		Log.info("검색결과 > 승차권 > 바로예매 > 바로예매팝업 > 확인 > 예약하기를 선택 하였습니다.");
		Allure.step("검색결과 > 승차권 > 바로예매 > 바로예매팝업 > 확인 > 예약하기를 선택 하였습니다.");
	}
	*/
	public static void cartIn() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(TrainPage.cartIn());

		TrainPage.cartIn().click();

		Log.info("선택한 승차권 > 장바구니 담기를 선택 하였습니다.");
		Allure.step("선택한 승차권 > 장바구니 담기를 선택 하였습니다.");

	}
}
