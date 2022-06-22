package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.RegionPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Region {
	
	public static void regionhomeMapInfo() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Wait.elementToBeClickable(RegionPage.regionhomeMapInfo());
		
		RegionPage.regionhomeMapInfo().click();

		Log.info("강원도야놀자 > 지도 페이지뷰 지도를 선택 하였습니다.");
		Allure.step("강원도야놀자 > 지도 페이지뷰 지도를 선택 하였습니다.");
	}
}
