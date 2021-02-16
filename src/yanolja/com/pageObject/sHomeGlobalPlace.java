package yanolja.com.pageObject;

import yanolja.com.uiMap.sHomeGlobalPlacePage;
import yanolja.com.uiMap.sHomeMotelPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class sHomeGlobalPlace {
	
	public static void sHomeThemedItem() {
		Wait.elementToBeClickable(sHomeGlobalPlacePage.sHomeThemedItem());
		
		sHomeGlobalPlacePage.sHomeThemedItem().click();
		
		Log.info("해외숙소 서브홈 > 임의의 숙소를 선택 하였습니다.");
	}

}
