package yanolja.com.pageObject;

import org.openqa.selenium.NoSuchElementException;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.CartPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Cart {
	
	// Cart
	public static void cart() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(CartPage.cart());
		
		CartPage.cart().click();

		Log.info("상단 카트 버튼을 선택 하였습니다.");
		Allure.step("상단 카트 버튼을 선택 하였습니다.");
	}
	
	// reservation
	public static void reservation() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(CartPage.reservation());
		
		CartPage.reservation().click();

		Log.info("장바구니 > 예약하기 선택 되었습니다.");
		Allure.step("장바구니 > 예약하기 선택 되었습니다.");

	}
	
	// itemCount
	public static void delete() throws InterruptedException {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if (CartPage.noItemText().isDisplayed()) {
				CartPage.back().click();
				Log.info("장바구니 > 뒤로가기 선택 되었습니다.");
				Allure.step("장바구니 > 뒤로가기 선택 되었습니다.");
			}
		} catch (NoSuchElementException e) {
			CartPage.delete().click();
			Log.info("장바구니 > 선택삭제 선택 되었습니다.");
			Allure.step("장바구니 > 선택삭제 선택 되었습니다.");
			
			Thread.sleep(3000);
			CartPage.popupDelete().click();
			Log.info("장바구니 > 선택삭제 > 팝업 > 삭제하기 선택 되었습니다.");
			Allure.step("장바구니 > 선택삭제 > 팝업 > 삭제하기 선택 되었습니다.");
			
			Thread.sleep(3000);
			CartPage.back().click();
			Log.info("장바구니 > 뒤로가기 선택 되었습니다.");
			Allure.step("장바구니 > 뒤로가기 선택 되었습니다.");
		}
		/*
		if (CartPage.noItemText().isDisplayed()) {
			CartPage.back().click();
			Log.info("장바구니 > 뒤로가기 선택 되었습니다.");
			Allure.step("장바구니 > 뒤로가기 선택 되었습니다.");
		} else {
			CartPage.delete().click();
			Log.info("장바구니 > 선택삭제 선택 되었습니다.");
			Allure.step("장바구니 > 선택삭제 선택 되었습니다.");
			
			Thread.sleep(3000);
			CartPage.popupDelete().click();
			Log.info("장바구니 > 선택삭제 > 팝업 > 삭제하기 선택 되었습니다.");
			Allure.step("장바구니 > 선택삭제 > 팝업 > 삭제하기 선택 되었습니다.");
			
			Thread.sleep(3000);
			CartPage.back().click();
			Log.info("장바구니 > 뒤로가기 선택 되었습니다.");
			Allure.step("장바구니 > 뒤로가기 선택 되었습니다.");
		}
		*/
	}
}
