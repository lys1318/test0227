package yanolja.com.uiMap;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class ExhibitionPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	
	// selectTab
	public static WebElement selectTab(String tabName) {
		
		List<WebElement> elements = Browser.driver().findElements(By.cssSelector("li[class^='CategoryExpandTab']"));
		
		for (int i = 0; i < elements.size(); i++) {
			if (elements.get(i).getText().equals(tabName)) {

				element = elements.get(i);
				break;
			}
		}

		return element;
		
	}
	
	// List Item
	public static WebElement roomslistItem() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='PlaceListItemText'] > a"));
		
		return element;
	}

	// List Item
	public static WebElement leisurelistItem() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='ExhibitionDetailDomesticLeisure'] > a"));

		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
