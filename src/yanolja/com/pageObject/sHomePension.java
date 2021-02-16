package yanolja.com.pageObject;

import yanolja.com.uiMap.sHomePensionPage;
import yanolja.com.uiMap.sHomeMotelPage;
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

		Log.info("펜션/풀빌라 서브홈에 추천위젯 아이템을 선택 하였습니다.");
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

		Log.info("펜션/풀빌라 서브홈에 추천위젯 리스트형 아이템을 선택 하였습니다.");
	}
}
