package yanolja.com.pageObject;

import yanolja.com.uiMap.LoginPage;
import yanolja.com.uiMap.MyYanoljaPage;
import yanolja.com.uiMap.RegionPage;
import yanolja.com.uiMap.sHomeHotelPage;
import yanolja.com.uiMap.sHomeMotelPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Region {

	public static void rankingWidgetItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Wait.elementToBeClickable(RegionPage.rankingWidgetItem());
		
		RegionPage.rankingWidgetItem().click();

		Log.info("강원도야놀자 > 랭킹위젯 > 임의의 상품을 선택 하였습니다.");
	}
	
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
	}
}
