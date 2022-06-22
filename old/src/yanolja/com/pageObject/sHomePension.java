package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.sHomePensionPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class sHomePension {

	public static void sHomeThemedItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(sHomePensionPage.sHomeThemedItem());
		
		sHomePensionPage.sHomeThemedItem().click();

		Log.info("펜션/풀빌라 서브홈에 추천위젯 테마형 그룹 추천 상품을 선택 하였습니다.");
		Allure.step("펜션/풀빌라 서브홈에 추천위젯 테마형 그룹 추천을 상품 선택 하였습니다.");
	}

	public static void sHomeListItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(sHomePensionPage.sHomeListItem());
		
		sHomePensionPage.sHomeListItem().click();

		Log.info("펜션/풀빌라 서브홈에 추천위젯 리스트형 추천 상품을 선택 하였습니다.");
		Allure.step("펜션/풀빌라 서브홈에 추천위젯 리스트형 추천 상품을 선택 하였습니다.");
	}
}
