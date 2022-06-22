package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.GNBPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class GNB {

	public static void home() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(GNBPage.home());
		
		GNBPage.home().click();

		Log.info("GNB > 홈 을 선택 하였습니다.");
		Allure.step("GNB > 홈 을 선택 하였습니다.");
	}
	
	public static void area() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(GNBPage.area());
		
		GNBPage.area().click();

		Log.info("GNB > 지역 을 선택 하였습니다.");
		Allure.step("GNB > 지역 을 선택 하였습니다.");
	}
	
	public static void around() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(GNBPage.around());
		
		GNBPage.around().click();

		Log.info("GNB > 내주변 을 선택 하였습니다.");
		Allure.step("GNB > 내주변 을 선택 하였습니다.");
	}

	public static void wishlist() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(GNBPage.wishlist());
		
		GNBPage.wishlist().click();

		Log.info("GNB > 찜 을 선택 하였습니다.");
		Allure.step("GNB > 찜 을 선택 하였습니다.");
	}
	
	public static void myYanolja() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(GNBPage.myYanolja());
		
		GNBPage.myYanolja().click();

		Log.info("GNB > MY야놀자 를 선택 하였습니다.");
		Allure.step("GNB > MY야놀자 를 선택 하였습니다.");
	}
}
