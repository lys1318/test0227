package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.LeisurePLPPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class LeisurePLP {
	
	public static void leisureListItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(LeisurePLPPage.leisureListItem());

		LeisurePLPPage.leisureListItem().click();

		Log.info("레저PLP > 임의의 상품을 선택 하였습니다.");
		Allure.step("레저PLP > 임의의 상품을 선택 하였습니다.");

	}
	
	public static void mobileVoucherCategoryListItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(LeisurePLPPage.mobileVoucherCategoryListItem());

		LeisurePLPPage.mobileVoucherCategoryListItem().click();

		Log.info("레저PLP > 모바일교환권 > 임의의 상품을 선택 하였습니다.");
		Allure.step("레저PLP > 모바일교환권 > 임의의 상품을 선택 하였습니다.");

	}
}
