package yanolja.com.pageObject;

import org.openqa.selenium.JavascriptExecutor;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.PlaceDetailPage;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Log;
import yanolja.com.utility.Util;
import yanolja.com.utility.Wait;

public class PlaceDetail {
	
	public static void placeDetailNavBack() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceDetailPage.placeDetailNavBack());

		PlaceDetailPage.placeDetailNavBack().click();
		
		Log.info("숙소 상세 > 뒤로가기 를 선택 하였습니다.");
		Allure.step("숙소 상세 > 뒤로가기 를 선택 하였습니다.");
		
	}
	
	public static String placeDetailTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceDetailPage.placeDetailTitle());
		
		String placeDetailTitle = PlaceDetailPage.placeDetailTitle().getText();
		
		Log.info("숙소 상세 > 타이틀을 저장 하였습니다. (타이틀 : " + placeDetailTitle + ")");
		Allure.step("숙소 상세 > 타이틀을 저장 하였습니다. (타이틀 : " + placeDetailTitle + ")");
		
		return placeDetailTitle;
	}
	
	public static void placeDetailHome() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceDetailPage.placeDetailNavHome());
		
		PlaceDetailPage.placeDetailNavHome().click();
		
		Log.info("상단 네비게이션에서 Home 버튼을 선택 하였습니다.");
		Allure.step("상단 네비게이션에서 Home 버튼을 선택 하였습니다.");
	}
	
	public static String roomItemTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceDetailPage.roomItemTitle());
		
		String roomItemTitle = PlaceDetailPage.roomItemTitle().getText();
		
		Log.info("숙소 상세 > 객실타입을 저장 하였습니다. (타이틀 : " + roomItemTitle + ")");
		Allure.step("숙소 상세 > 객실타입을 저장 하였습니다. (타이틀 : " + roomItemTitle + ")");
		
		return roomItemTitle;
	}
	
	public static void roomItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceDetailPage.roomItem());
		// 호텔 > 숙소상세 > 객실 선택 시 일반적인 click으로는 진행안됨
		// JavascriptExecutor 로 문제는 해결 하였으나 원인파악 필요!
		//PlaceDetailPage.roomItem().click();
		
		JavascriptExecutor executor = (JavascriptExecutor)Browser.driver();
		executor.executeScript("arguments[0].click();", PlaceDetailPage.roomItem());
		
		Log.info("숙소 상세 > 객실타입을 선택 하였습니다.");
		Allure.step("숙소 상세 > 객실타입을 선택 하였습니다.");
	}
	
	public static void CheckinOutBox() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceDetailPage.CheckinOutBox());
		
		PlaceDetailPage.CheckinOutBox().click();
		
		Log.info("체크인/체크아웃 영역을 선택 하였습니다.");
		Allure.step("체크인/체크아웃 영역을 선택 하였습니다.");
	}
	
	public static void selectDate(Integer day) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i < PlaceDetailPage.selectDate().size(); i++) {
			if (Util.getDay() == Integer.parseInt(PlaceDetailPage.selectDate().get(i).getText())) {
				System.out.println("일치!");
				//Browser.driver().findElement(By.cssSelector("div[class^='DatePicker_dayString' innerText='"+ (Util.getDay()+1) +"']")).click();
				PlaceDetailPage.selectDate().get(Util.getDay() + day).click();
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
		
		Wait.elementToBeClickable(PlaceDetailPage.apply());
		
		PlaceDetailPage.apply().click();
		
		Log.info("날짜 선택 후 적용 버튼을 선택 하였습니다.");
		Allure.step("날짜 선택 후 적용 버튼을 선택 하였습니다.");
	}
}
