package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.ExhibitionPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Exhibition {

	public static void leisurelistItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(ExhibitionPage.leisurelistItem());
		
		ExhibitionPage.leisurelistItem().click();

		Log.info("기획전 > 레저 리스트 > 아이템을 선택 하였습니다.");
		Allure.step("기획전 > 레저 리스트 > 아이템을 선택 하였습니다.");
	}
	
	public static void roomslistItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(ExhibitionPage.roomslistItem());
		
		ExhibitionPage.roomslistItem().click();

		Log.info("기획전 > 국내숙박 리스트 > 아이템을 선택 하였습니다.");
		Allure.step("기획전 > 레저 리스트 > 아이템을 선택 하였습니다.");
	}
}
