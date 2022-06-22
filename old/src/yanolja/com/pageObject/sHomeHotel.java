package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.sHomeHotelPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class sHomeHotel {

	public static void sHomeThemedItem() {
		Wait.elementToBeClickable(sHomeHotelPage.sHomeThemedItem());
		
		sHomeHotelPage.sHomeThemedItem().click();

		Log.info("호텔 서브홈에 추천위젯 테마형 그룹 추천 상품을 선택 하였습니다.");
		Allure.step("호텔 서브홈에 추천위젯 테마형 그룹 추천 상품을 선택 하였습니다.");
	}
	
	public static void sHomeListItem() {
		Wait.elementToBeClickable(sHomeHotelPage.sHomeListItem());
		
		sHomeHotelPage.sHomeListItem().click();

		Log.info("호텔 서브홈에 추천위젯 리스트형 추천 상품을 선택 하였습니다.");
		Allure.step("호텔 서브홈에 추천위젯 리스트형 추천 상품을 선택 하였습니다.");
	}

}
