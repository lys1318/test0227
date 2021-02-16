package yanolja.com.pageObject;

import yanolja.com.uiMap.MyYanoljaPage;
import yanolja.com.uiMap.sHomeHotelPage;
import yanolja.com.uiMap.sHomeMotelPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class myYanolja {

	public static void loginLink() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Wait.elementToBeClickable(MyYanoljaPage.loginLink());
		
		MyYanoljaPage.loginLink().click();

		Log.info("MY야놀자 > '로그인 및 회원가입 하기' 링크를 선택 하였습니다.");
	}

}
