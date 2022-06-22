package yanolja.com.uiMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class sHomeMotelPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	// Title
	public static WebElement sHomeNavTitle() {
		element = Browser.driver().findElement(By.cssSelector("h1[class^='PageTitle_pageTitle']"));

		return element;
	}

	// Back
	public static WebElement sHomeNavBack() {
		element = Browser.driver()
				.findElement(By.cssSelector("Button[class^='PageTitleImageButton'] > img[alt^='뒤로가기']"));

		return element;
	}

	// Search
	public static WebElement sHomeNavSearch() {
		element = Browser.driver()
				.findElement(By.cssSelector("Button[class^='PageTitleImageButton'] > img[alt^='검색']"));
		
		return element;
	}

	// Home
	public static WebElement sHomeNavHome() {
		element = Browser.driver().findElement(By.cssSelector("Button[class^='PageTitleImageButton'] > img[alt^='홈']"));

		return element;
	}
	
	// Region1Depth
	public static WebElement sHomeRegion1Depth() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='SubhomeRegionList_regionListWrap'] > ul > li:nth-child(1) > a"));
		return element;
	}

	// Region2Depth
	public static WebElement sHomeRegion2Depth() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='SubhomeRegionList_region2Depth'] > a[class^='SubhomeRegionList_region2DepthItem'] > span"));
		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
