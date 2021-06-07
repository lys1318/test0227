package yanolja.com.uiMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class CartPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	
	// cart
	public static WebElement cart() {
		element = Browser.driver().findElement(By.cssSelector("button[class^='PageTitleImageButton_button'] > img[alt='장바구니']"));

		return element;
	}
	
	// Reservation
	public static WebElement reservation() {
		element = Browser.driver().findElement(By.cssSelector("button[class*='css-18suqg9']"));

		return element;
	}
	
	// back
	public static WebElement back() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='css-1am8kzc'] > svg"));

		return element;
	}
	
	// itemCount
	public static WebElement itemCount() {
		element = Browser.driver().findElement(By.cssSelector("div[class*='item-count']"));

		return element;
	}
	
	// delete
	public static WebElement delete() {
		element = Browser.driver().findElement(By.cssSelector("div[class*='css-znqfbq']"));

		return element;
	}
	
	// popupDelete
	public static WebElement popupDelete() {
		element = Browser.driver().findElement(By.cssSelector("div[class*='primary css-17y1gu4']"));

		return element;
	}
}
