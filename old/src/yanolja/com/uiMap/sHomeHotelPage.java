package yanolja.com.uiMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class sHomeHotelPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	
	// sHomeThemedItem
	public static WebElement sHomeThemedItem() {
				
		

		element = Browser.driver().findElement(By.cssSelector("section[class^='SubhomeThemedItems'] > div[class^='SubhomeThemedItems_body'] > a:nth-child(1)"));

		return element;
	}

	// sHomListItem
	public static WebElement sHomeListItem() {
				
		

		element = Browser.driver().findElement(By.cssSelector("section[class^='SubhomeList'] > div[class^='SubhomeList'] > a:nth-child(1)"));

		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
