package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.ExhibitionPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Exhibition {
	
	public static void selectTab(String tabName) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(ExhibitionPage.selectTab(tabName));
		
		String tab = tabName;
		
		ExhibitionPage.selectTab(tabName).click();

		Log.info("QA 로그 전용 기획전 > " + tab + "탭 을 선택 하였습니다.");
		Allure.step("QA 로그 전용 기획전 > " + tab + "탭 을 선택 하였습니다.");
	}
	
	public static void leisurelistItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(ExhibitionPage.leisurelistItem());
		
		ExhibitionPage.leisurelistItem().click();

		Log.info("QA 로그 전용 기획전 > 레저그룹_수정X탭 > 임의의 아이템을 선택 하였습니다.");
		Allure.step("QA 로그 전용 기획전 > 레저그룹_수정X탭 > 임의의 아이템을 선택 하였습니다.");
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

		Log.info("QA 로그 전용 기획전 > 국내그룹_수정X탭 > 임의의 아이템을 선택 하였습니다.");
		Allure.step("QA 로그 전용 기획전 > 국내그룹_수정X탭 > 임의의 아이템을 선택 하였습니다.");
	}
}
