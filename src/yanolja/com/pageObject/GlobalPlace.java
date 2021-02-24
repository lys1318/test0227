package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.GlobalPlacePage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class GlobalPlace {
	
	public static void reservation() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(GlobalPlacePage.reservation());
		
		GlobalPlacePage.reservation().click();
		
		Log.info("숙소 상세 > 예약하기 버튼을 선택 하였습니다.");
		Allure.step("숙소 상세 > 예약하기 버튼을 선택 하였습니다.");
	}
	
	public static void selectRoom() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(GlobalPlacePage.reservation());
		
		GlobalPlacePage.selectRoom().click();
		
		Log.info("숙소 상세 > 객실 선택하기 버튼을 선택 하였습니다.");
		Allure.step("숙소 상세 > 객실 선택하기 버튼을 선택 하였습니다.");
	}
}
