package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.RoomDetailPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class RoomDetail {
	
	public static String roomDetailNavTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(RoomDetailPage.roomDetailNavTitle());
		
		String roomDetailNavTitle = RoomDetailPage.roomDetailNavTitle().getText();
		
		Log.info("객실 상세 > 네비게이션 타이틀을 저장 하였습니다. (타이틀 : " + roomDetailNavTitle + ")");
		Allure.step("객실 상세 > 네비게이션 타이틀을 저장 하였습니다. (타이틀 : " + roomDetailNavTitle + ")");
		
		return roomDetailNavTitle;
	}
	
	public static String roomItemTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(RoomDetailPage.roomType());
		
		String roomItemTitle = RoomDetailPage.roomType().getText();
		
		Log.info("객실 상세 > 객실타입을 저장 하였습니다. (타이틀 : " + roomItemTitle + ")");
		Allure.step("객실 상세 > 객실타입을 저장 하였습니다. (타이틀 : " + roomItemTitle + ")");
		
		return roomItemTitle;
	}
	
	public static void roomReserve() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(RoomDetailPage.roomReserve());
		
		RoomDetailPage.roomReserve().click();
		
		Log.info("객실 상세 > 숙박 예약하기를 선택 하였습니다.");
		Allure.step("객실 상세 > 숙박 예약하기를 선택 하였습니다.");
	}

}
