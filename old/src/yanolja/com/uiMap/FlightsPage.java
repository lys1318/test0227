package yanolja.com.uiMap;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class FlightsPage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */
	// Title
		public static WebElement flightsTitle() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='flights_titleBody'] > strong"));

			return element;
		}

		// Back
		public static WebElement navBack() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='CollapsingNavTopButtons_backButton']"));

			return element;
		}
		
		// 탭 > 왕복 
		public static WebElement roundTrip() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FlightSearchFormBody_tripTypeSelector'] > div:nth-child(1)"));

			return element;
		}
		
		// 탭 > 편도  
		public static WebElement oneWay() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FlightSearchFormBody_tripTypeSelector'] > div:nth-child(2)"));

			return element;
		}

		// 출발지  
		public static WebElement start() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FlightSearchFormBody_locationContainer'] > div:nth-child(1)"));

			return element;
		}
		
		// 도착지   
		public static WebElement destination() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FlightSearchFormBody_locationContainer'] > div:nth-child(3)"));

			return element;
		}
		
		// 검색어 입력    
		public static WebElement searchText() {
			element = Browser.driver().findElement(By.cssSelector("input[class^='FlightSearchAirportModal_searchInput']"));

			return element;
		}
		
		// 검색결과리스트    
		public static WebElement searchResult() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FlightSearchAirportBody_airportBodyContainer'] > div:nth-child(1)"));

			return element;
		}
		
		// 날짜 선택  
		public static WebElement calendar() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FlightSearchFormBody_formContents'] > div:nth-child(2) > div:nth-child(2)"));

			return element;
		}
		
		// 날짜 타이틀   
		public static WebElement calendarTitle() {
			element = Browser.driver().findElement(By.cssSelector("h1[class^='PageTitle_pageTitle']"));

			return element;
		}
		
		// 날짜 선택  
		public static List<WebElement> selectDate() {
			List<WebElement> days = Browser.driver().findElements(By.cssSelector("div[class^='DatePicker_dayString']"));

			return days;
		}
		
		// 날짜 선택 적용   
		public static WebElement apply() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FullScreenWindow_scrollRoot'] > div[class^='CallToActionButton'] > div > button"));

			return element;
		}
			
		// 인원 선택 
		public static WebElement capacity() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='FlightSearchFormBody_formContents'] > div:nth-child(3) > div:nth-child(2)"));

			return element;
		}
			
		// 승차권 검색 
		public static WebElement ticketSearch() {
			element = Browser.driver().findElement(By.cssSelector("div[class^='CallToActionButton'] > div > button"));

			return element;
		}
		
		// 검색결과 > 승차권 선택
		public static WebElement resultSelectTicket() {
			element = Browser.driver().findElement(By.cssSelector("section[class^='FlightListBody_container'] > article > div > article:nth-child(1)"));

			return element;
		}
		
		// 검색결과 
		public static WebElement selectProvider() {
			element = Browser.driver().findElement(By.cssSelector("section[class^='FlightDetail_container'] > div > div:nth-child(1) > div:nth-child(2) > a"));

			return element;
		}
	
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
