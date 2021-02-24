package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.sHomeGlobalPlacePage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class sHomeGlobalPlace {
	
	public static void sHomeThemedItem() {
		Wait.elementToBeClickable(sHomeGlobalPlacePage.sHomeThemedItem());
		
		sHomeGlobalPlacePage.sHomeThemedItem().click();
		
		Log.info("해외숙소 서브홈 > 임의의 숙소를 선택 하였습니다.");
		Allure.step("해외숙소 서브홈 > 임의의 숙소를 선택 하였습니다.");
	}

}
