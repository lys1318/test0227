package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.LoginPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Login {

	public static void login(String id, String password) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Wait.elementToBeClickable(LoginPage.id());
		
		LoginPage.id().sendKeys(id);
		
		Wait.elementToBeClickable(LoginPage.id());
		
		LoginPage.password().sendKeys(password);
		
		Wait.elementToBeClickable(LoginPage.login());
		
		LoginPage.login().click();

		Log.info("로그인페이지 > 로그인 버튼을 선택 하였습니다.");
		Allure.step("로그인페이지 > 로그인 버튼을 선택 하였습니다.");
	}

	public static void signup() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Wait.elementToBeClickable(LoginPage.signup());
		
		LoginPage.signup().click();

		Log.info("로그인페이지 > 야놀자 회원가입 을 선택 하였습니다.");
		Allure.step("로그인페이지 > 야놀자 회원가입 을 선택 하였습니다.");
	}
}
