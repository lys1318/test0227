package yanolja.com.uiMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class PurchasePage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */

	// birthday
	public static WebElement birthday() {
		element = Browser.driver().findElement(By.cssSelector("section[class='train-passenger-input-content'] > div:nth-child(5) > div > section > section > div > input"));

		return element;
	}
	
	// point
	public static WebElement point() {
		element = Browser.driver().findElement(By.cssSelector("div[class='use-available-point'] > button"));

		return element;
	}
	
	// trainTicketOrderAgreeAll
	public static WebElement trainTicketOrderAgreeAll() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='train-order-terms-content'] > section > div[class^='checkbox-icon-container']"));

		return element;
	}
	
	// agreeAll
	public static WebElement agreeAll() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='reservation-cancel-terms-container'] > div:nth-child(2) > div:nth-child(1) > section > div[class^='checkbox-icon-container no-select']"));

		return element;
	}
	
	// agree
	public static WebElement roomReservationAgreeAll() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='checkbox-content agree-item total'] > div[class^='checkbox-icon-container no-select']"));

		return element;
	}
	
	// trainTicketOrder
	public static WebElement trainTicketOrder() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='payment-btn-container'] > div:nth-child(1) > button"));

		return element;
	}

	// order
	public static WebElement order() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='order-action-container'] > button"));

		return element;
	}
	
	// working
	public static WebElement working() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='visit-type-container'] > button:nth-child(1)"));

		return element;
	}
	
	// actionAgreeForPayment
	public static WebElement actionAgreeForPayment() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='payment-actions'] > button:nth-child(2)"));

		return element;
	}
	
	// roomOrder
	public static WebElement roomOrder() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='payment-btn-container'] > button"));

		return element;
	}
	
	// email
	public static WebElement email() {
		element = Browser.driver().findElement(By.cssSelector("input[id='이메일']"));

		return element;
	}
	
	// lastName
	public static WebElement lastName() {
		element = Browser.driver().findElement(By.cssSelector("input[id='성(영문)']"));

		return element;
	}
	
	// firstName
	public static WebElement firstName() {
		element = Browser.driver().findElement(By.cssSelector("input[id='이름(영문)']"));

		return element;
	}
	
	// globalAgreeAll
	public static WebElement globalAgreeAll() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='reservation-cancel-terms-container'] > div:nth-child(2) > section:nth-child(1) > section > div[class^='checkbox-icon-container no-select']"));

		return element;
	}
	
	// globalOrder
	public static WebElement globalOrder() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='reservation-payment-action'] > button"));

		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
