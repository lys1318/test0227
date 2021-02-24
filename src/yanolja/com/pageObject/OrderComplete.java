package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.OrderCompletePage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class OrderComplete {
	
	public static void orderComplete() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(OrderCompletePage.orderComplete());

		if(OrderCompletePage.orderComplete().isDisplayed()) {
			Log.info("구매완료 페이지가 노출 되었습니다.");
			Allure.step("구매완료 페이지가 노출 되었습니다.");
		}

	}

}
