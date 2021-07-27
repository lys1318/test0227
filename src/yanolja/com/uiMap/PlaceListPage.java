package yanolja.com.uiMap;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class PlaceListPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	// Title
	public static WebElement placeListTitle() {
		element = Browser.driver().findElement(By.cssSelector("h2[class^='PlaceListTitle_title'] > span"));

		return element;
	}

	// SubTitle
	public static WebElement leisureSubTitle() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='SubHeader_titleWrap'] > h2"));

		return element;
	}

	// 전체보기
	public static WebElement viewAll() {
		element = Browser.driver().findElement(By.cssSelector(
				"div[class^='PlaceListBody_regionLeisureWrap'] > section > header > div[class^='SubHeader_aside'] > a"));

		return element;
	}

	// 이 주변 놀거리 아이템
	public static WebElement regionLeisureItem() {
		element = Browser.driver().findElement(By.cssSelector(
				"div[class^='PlaceListBody_regionLeisureWrap'] > section[class^='LeisureCrossSellWidget'] > div[class^='Swiper_container'] > div[class^='Swiper_swiper'] > div[class^='swiper-container'] > div[class^='swiper-wrapper'] > a:nth-child(1)"));

		return element;
	}

	// 이 주변 놀거리 아이템 타이틀
	public static WebElement regionLeisureItemTitle() {
		element = Browser.driver().findElement(By.cssSelector(
				"div[class^='PlaceListBody_regionLeisureWrap'] > section[class^='LeisureCrossSellWidget'] > div[class^='Swiper_container'] > div[class^='Swiper_swiper'] > div[class^='swiper-container'] > div[class^='swiper-wrapper'] > a:nth-child(1) > div[class^='RecommendationElement_body'] > p[class^='RecommendationElement_title']"));

		return element;
	}

	// 모텔 지역선택 
	public static WebElement regionTitle() {
		element = Browser.driver().findElement(By.cssSelector("section > div[class^='RegionTitle_regionTitleWrap'] > div > h2"));

		return element;
	}

	// 날짜 선택  
	public static WebElement calendar() {
		element = Browser.driver().findElement(By.cssSelector("button[class*='Bottom_calendarButton']"));

		return element;
	}
	
	// 날짜 선택  
	public static WebElement calendarTitle() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='PageTitle_pageTitleWrap'] > h1"));

		return element;
	}
	
	// 인원 선택 
	public static WebElement capacity() {
		element = Browser.driver().findElement(By.cssSelector("button[class*='Bottom_capacityButton']"));

		return element;
	}
	
	// 인원수 선택  
	public static WebElement capacityTitle() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='PageTitle_pageTitleWrap'] > h1"));

		return element;
	}
	
	// 인원수 선택  
	public static WebElement coupon() {
		element = Browser.driver().findElement(By.cssSelector("button[class^='PlaceListSubOptions_couponButton']"));

		return element;
	}
	
	// 임의의 숙소   
	public static WebElement PlaceListItem() {
		
		List<WebElement> elements = Browser.driver().findElements(By.cssSelector("div[class^='PlaceListItemBanner_container']"));
		
		for (int i = 0; i < elements.size(); i++) {
			
			if (elements.get(i).findElement(By.cssSelector("a > div[class^='PlaceListItemBanner_contents'] > div:nth-child(1) > div[class^='PlaceListTitle_container'] > strong")).getText().equals("[테스트] PERIOE06")) {
				element = elements.get(i).findElement(By.cssSelector("a"));
				break;
			}

		}

		return element;
		
	}
	/*
	// 임의의 숙소   
	public static WebElement PlaceListItem() {
		
		List<WebElement> elements = Browser.driver().findElements(By.cssSelector("div[class^='PlaceListBody_topAdWrap'] > div[class^='PlaceListItemBanner_container']"));
		
		for (int i = 0; i < elements.size(); i++) {
			
			if (elements.get(i).findElement(By.cssSelector("a > div[class^='PlaceListItemBanner_contents'] > div:nth-child(1) > div[class^='PlaceListTitle_container'] > strong")).getText().equals("[테스트] PERIOE06")) {
				System.out.println("[테스트] PERIOE06 업체 발견!!!!!");
				element = elements.get(i).findElement(By.cssSelector("a"));
				break;
			}

		}

		return element;
		
		//element = Browser.driver().findElement(By.cssSelector("div[class^='PlaceListItemBanner'] > a"));

		//return element;
	}
	*/
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
