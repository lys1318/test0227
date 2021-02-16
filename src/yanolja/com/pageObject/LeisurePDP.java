package yanolja.com.pageObject;

import org.openqa.selenium.JavascriptExecutor;

import yanolja.com.uiMap.LeisurePDPPage;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class LeisurePDP {
	
	public static void countUp() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(LeisurePDPPage.countUp());

		JavascriptExecutor executor = (JavascriptExecutor)Browser.driver();
		executor.executeScript("arguments[0].click();", LeisurePDPPage.countUp());

		Log.info("레저PDP > 티켓 구매수량이 증가 되었습니다.");

	}
	
	public static void callToAction() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(LeisurePDPPage.callToAction());

		LeisurePDPPage.callToAction().click();

		Log.info("레저PDP > 상품 선택하기를 선택 하였습니다.");

	}
}
