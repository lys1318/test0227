package yanolja.com.uiMap;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class TrainPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	
	// 탭 > 왕복 
	public static WebElement roundTrip() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainSHomeJourneyType'] > button:nth-child(2)"));

		return element;
	}
	
	// 탭 > 편도  
	public static WebElement oneWay() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainSHomeJourneyType'] > button:nth-child(1)"));

		return element;
	}

	// 출발지  
	public static WebElement start() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainSHomeStation'] > button:nth-child(1)"));

		return element;
	}
	
	// 도착지   
	public static WebElement destination() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainSHomeStation'] > button:nth-child(3)"));

		return element;
	}
	
	// 검색어 입력    
	public static WebElement searchText() {
		element = Browser.driver().findElement(By.cssSelector("input[class^='TrainSHomeStationModalTitle_input']"));

		return element;
	}
	
	// 검색결과리스트    
	public static WebElement searchResult() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='TrainSHomeStationModal_suggestions'] > div:nth-child(1)"));

		return element;
	}
	
	// 날짜 선택  
	public static WebElement calendar() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainSHomeBody_searchBody'] > button:nth-child(2)"));

		return element;
	}
	
	// 날짜 선택  
	public static List<WebElement> selectDate() {
		List<WebElement> months = Browser.driver().findElements(By.cssSelector("div[class^='DatePicker_dayString']"));

		return months;
	}
	/*
	// 날짜 선택  
	public static WebElement selectDate() {
		
		element = Browser.driver().findElement(By.cssSelector("div[class^='CalendarMonthGrid'] > div:nth-child(2) > div > table > tbody > tr:nth-child(2) > td > div > div > div"));

		return element;
	}
	*/
	// 날짜 선택 적용   
	public static WebElement apply() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='FullScreenWindow_scrollRoot'] > div[class^='CallToActionButton'] > div > button"));

		return element;
	}
		
	// 인원 선택 
	public static WebElement capacity() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainSHomeBody_searchBody'] > button:nth-child(3)"));

		return element;
	}
		
	// 승차권 검색 
	public static WebElement ticketSearch() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='CallToActionButton'] > div > button"));

		return element;
	}
	
	// 검색결과 > 승차권 선택
	public static WebElement resultSelectTicket() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainTicketItems'] > article:nth-child(1)"));

		return element;
	}
	
	// 검색결과 > 승차권 선택 > 바로 예매 
	public static WebElement resultSelectTicketing() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='TrainTicketItems'] > article:nth-child(1) > section > article:nth-child(3) > button"));

		return element;
	}
	
	// 바로예매팝업 > 확인 
	public static WebElement popupOk() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='Popup_buttonsContainer'] > div:nth-child(2) > button"));

		return element;
	}
	
	// 선택한 승차권 > 예약하기  
	public static WebElement reservation() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='CallToActionButton_wrap'] > button"));

		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
