package yanolja.com.uiMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class RoomDetailPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */

	// Title
	public static WebElement roomDetailNavTitle() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='PageTitle_pageTitleWrap'] > h1"));

		return element;
	}

	// Back
	public static WebElement roomDetailNavBack() {
		element = Browser.driver().findElement(By.cssSelector("button[class^='PageTitleImageButton'] > img[alt='뒤로가기']"));

		return element;
	}

	// Back
	public static WebElement roomDetailNavHome() {
		element = Browser.driver().findElement(By.cssSelector("button[class^='PageTitleImageButton'] > img[alt='홈']"));

		return element;
	}
	
	//Room Type
	public static WebElement roomType() {
		element = Browser.driver().findElement(By.cssSelector("header[class^='RoomDetailInfo_container'] > h2"));

		return element;
	}
	
	//Room Reservation
	public static WebElement roomReserve() {
		element = Browser.driver().findElement(By.cssSelector("button[class^='RoomReserveButtons_button']"));

		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
