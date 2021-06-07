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
		
		System.out.println("isDisplayed : " + RoomDetailPage.roomReserve().isDisplayed());
		System.out.println("isEnabled : " + RoomDetailPage.roomReserve().isEnabled());
		
		Wait.elementToBeClickable(RoomDetailPage.roomReserve());
		
		RoomDetailPage.roomReserve().click();
		
		Log.info("객실 상세 > 숙박 예약하기를 선택 하였습니다.");
		Allure.step("객실 상세 > 숙박 예약하기를 선택 하였습니다.");
	}
	
	public static void roomReserveAvailable() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("roomReserveAvailable : " + RoomDetailPage.roomReserveAvailable());
		
		for (int i = 1; i < 10; i++) {
			if(RoomDetailPage.roomReserveAvailable() == true) {
				roomReserve();
				break;
			} else {
				System.out.println("예약 가능한 객실이 없습니다.");
				PlaceDetail.CheckinOutBox();
				PlaceDetail.selectDate(i+1);				
				PlaceDetail.apply();
			}			
		}
	}
	
	public static void purchase() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(RoomDetailPage.purchase());

		RoomDetailPage.purchase().click();

		Log.info("숙소 예약 > 바로 예약하기를 선택 하였습니다.");
		Allure.step("숙소 예약 > 바로 예약하기를 선택 하였습니다.");

	}
	
	public static void cartIn() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(RoomDetailPage.cartIn());

		RoomDetailPage.cartIn().click();

		Log.info("숙소 예약 > 장바구니 담기를 선택 하였습니다.");
		Allure.step("숙소 예약 > 장바구니 담기를 선택 하였습니다.");

	}
}
