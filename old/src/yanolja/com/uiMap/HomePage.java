package yanolja.com.uiMap;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import yanolja.com.utility.Browser;

public class HomePage {
	private static WebElement element = null;
	private static Select select = null;

	/*
	 * //cssSelector 속성 값 부분 일치 1. ^= | input[id^='ctrl'] | ID가 crrl로 시작하는 엘리먼트를 반환
	 * (예: ctrl_12) 2. $= | input[id$='_userName'] | ID가 _userName으로 끝나는 엘리먼트를 반환
	 * (예: a_1_userName) 3. *= | input[id*='userName'] | ID가 userName을 포함하는 엘리먼트를 반환
	 * (예:panel_login_userName_textfield)
	 */

	// logo
	public static WebElement img_logo() {
		element = Browser.driver().findElement(By.cssSelector(".HomeTitle_logo__14aI3 img"));

		return element;
	}

	// search
	public static WebElement search() {
		element = Browser.driver().findElement(By.cssSelector("button[class^='HomeTitle_button'] > img[alt='검색']"));

		return element;
	}
	
	// cart
	public static WebElement cart() {
		element = Browser.driver().findElement(By.cssSelector("button[class^='HomeTitle_button'] > img[alt='장바구니']"));

		return element;
	}
		
	// 퀵카테고리 > 모텔
	public static WebElement quickCategoryMotel() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/motel']"));

		return element;
	}

	// 퀵카테고리 > 호텔 
	public static WebElement quickCategoryHotel() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/hotel']"));

		return element;
	}
	
	// 퀵카테고리 > 펜션  
	public static WebElement quickCategoryPension() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/pension']"));

		return element;
	}
	
	// 퀵카테고리 > 게스트하우스   
	public static WebElement quickCategoryGuestHouse() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/guest-house']"));

		return element;
	}
	
	// 퀵카테고리 > 선착순 쿠폰 (내주변쿠폰)    
	public static WebElement quickCategoryFirstComeCoupon() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/recommend']"));

		return element;
	}
	
	// 퀵카테고리 > 무한쿠폰룸 (마이룸)    
	public static WebElement quickCategoryInfinite() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/motel?myRoom=1']"));

		return element;
	}
	
	// 퀵카테고리 > 레저    
	public static WebElement quickCategoryLeisure() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/leisure']"));

		return element;
	}
	
	// 퀵카테고리 > 해외숙소  
	public static WebElement quickCategoryGlobalPlace() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/global/place']"));

		return element;
	}
	
	// 퀵카테고리 > 항공권   
	public static WebElement quickCategoryFlights() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/flights']"));

		return element;
	}
	
	// 퀵카테고리 > 기차    
	public static WebElement quickCategoryTrain() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/train']"));

		return element;
	}
	
	// 퀵카테고리 > 렌터카    
	public static WebElement quickCategoryRentACar() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/exhibition/20191213_135343_1888938b']"));

		return element;
	}
	
	// 퀵카테고리 > 프리미엄호텔     
	public static WebElement quickCategoryPrimiumHotel() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/exhibition/20200429_172629_b68db51a']"));

		return element;
	}
	
	// 퀵카테고리 > 리조트/콘도      
	public static WebElement quickCategoryResort() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/exhibition/20200513_141452_e63b280f']"));

		return element;
	}
	
	// 퀵카테고리 > 글램핑/캠핑      
	public static WebElement quickCategoryCamping() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/exhibition/20200428_175541_4e2cb38a']"));

		return element;
	}
	
	// 퀵카테고리 > 아이야놀자 
	public static WebElement quickCategoryChild() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/exhibition/20200512_184328_a2b65d7b']"));

		return element;
	}
	
	// 퀵카테고리 > 강원도야놀자  
	public static WebElement quickCategoryRegion() {
		element = Browser.driver().findElement(By.cssSelector("a[href='https://qa-m.yanolja.com/region/4200000000']"));

		return element;
	}
	
	// 추천위젯
	public static WebElement homePlaceRecommend() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='HomePlaceRecommend']"));

		return element;
	}
	
	// 다른 테마 보기
	public static WebElement otherTheme() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='HomePlaceRecommend'] > div[class^='HomePlaceRecommend_footer']"));

		return element;
	}

	// 추천위젯종류
	public static WebElement recommendType() {
		element = Browser.driver().findElement(By.cssSelector("section[class^='HomePlaceRecommend'] > header > div:nth-child(2) > a"));

		return element;
	}
	
	// 추천위젯상품
	public static WebElement themePlaceItem() {
		element = Browser.driver().findElement(By.cssSelector("div[class^='HomePlaceRecommend_body'] > a:nth-child(1)"));

		return element;
	}

	// 추천위젯상품타이틀
	public static WebElement themePlaceItemTitle() {
		element = Browser.driver().findElement(By.cssSelector(
				"div[class^='HomePlaceRecommend_body'] > a:nth-child(1) > div[class^='ThemePlaceItem_body'] > div[class^='ThemePlaceItem_title']"));

		return element;
	}
	
	// 기획전 > QA로그전용
	public static WebElement exhibition() {
		List<WebElement> elements = Browser.driver().findElements(By.cssSelector("section[class^='HomeExhibition_exhibitionList'] > div[class^='ExhibitionItem_item']"));
		
		for (int i = 0; i < elements.size(); i++) {
			if (elements.get(i).findElement(By.cssSelector("a > div[class^='ExhibitionItem_contents'] > div[class^='ExhibitionItem_title']")).getText().equals("QA 로그 전용")) {

				element = elements.get(i).findElement(By.cssSelector("a"));
				break;
			}
		}

		return element;
	}
	
	/*
	 * // test 회사 선택 셀렉박스 public static Select slc_testCompany() { select = new
	 * Select(Browser.driver().findElement(By.id("Company")));
	 * 
	 * return select; }
	 */
}
