package yanolja.com.uiMap;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class sHomeGlobalPlacePage {
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
		element = Browser.driver().findElement(By.cssSelector("div[class^='GlobalPlaceHomeCuration_curationItemWrap'] > a:nth-child(1)"));

		return element;
	}
	
	
	// 임의의 숙소   
	public static WebElement sHomeThemedItem2() {
		
		List<WebElement> elements = Browser.driver().findElements(By.cssSelector("div[class^='swiper-container']"));
		
		System.out.println(elements.size());
		System.out.println(elements);
		
		for (int i = 0; i < elements.size(); i++) {
			
			if (elements.get(i).findElement(By.cssSelector("a > div > div[class^='GlobalPlaceHomeRecentItems_recentItemBody'] > p[class^='GlobalPlaceHomeRecentItems_title']")).getText().equals("만딜라 비치 호텔 다낭")) {
				System.out.println("만딜라 비치 호텔 다낭 업체 발견!!!!!");
				element = elements.get(i).findElement(By.cssSelector("a"));
				break;
			}

		}

		return element;
		
		//element = Browser.driver().findElement(By.cssSelector("div[class^='PlaceListItemBanner'] > a"));

		//return element;
	}
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
