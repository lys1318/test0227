package yanolja.com.uiMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class GlobalPlacePage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	
	// reservation
	public static WebElement reservation() {
		//element = Browser.driver().findElement(By.cssSelector("div[class^='GlobalPlaceDetailOptionList_container'] > div:nth-child(1) > div[class^='GlobalPlaceDetailOptionList_roomInfoWrap'] > div[class^='GlobalPlaceDetailOptionList_roomContent'] > div[class^='GlobalPlaceDetailOptionList_optionInfoWrap'] > div:nth-child(1) > div[class^='GlobalPlaceDetailOptionListItem_infoWrap'] > div:nth-child(2) > div:nth-child(2) > button"));
		element = Browser.driver().findElement(By.cssSelector("div.GlobalPlaceDetailOptionList_container__2Z7Vu > div:nth-child(1) > div.GlobalPlaceDetailOptionList_roomInfoWrap__1SNs8 > div > div.GlobalPlaceDetailOptionList_optionInfoWrap__3hU1A > div:nth-child(1) > div > div:nth-child(2) > div.GlobalPlaceDetailOptionListItem_reservationWrap__3HJYS > button"));
		//#__next > div.StyleComponent_container__1jS9A.GlobalPlaceDetailBody_container__emEX3 > div.GlobalPlaceDetailOptionList_container__2Z7Vu > div:nth-child(1) > div.GlobalPlaceDetailOptionList_roomInfoWrap__1SNs8 > div > div.GlobalPlaceDetailOptionList_optionInfoWrap__3hU1A > div:nth-child(1) > div > div:nth-child(2) > div.GlobalPlaceDetailOptionListItem_reservationWrap__3HJYS > button
		return element;
	}
	
	// selectRoom
	public static WebElement selectRoom() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='CallToActionButton_container'] > div > button"));

		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
