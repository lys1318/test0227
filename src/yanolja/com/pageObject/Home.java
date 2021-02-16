package yanolja.com.pageObject;

import static org.testng.AssertJUnit.assertTrue;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.LoadableComponent;

import yanolja.com.uiMap.GNBPage;
import yanolja.com.uiMap.HomePage;
import yanolja.com.utility.Browser;
import yanolja.com.utility.Constant;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Home extends LoadableComponent<Home> {
	public Home(String browser) {
		if (browser.equalsIgnoreCase("internet explorer")) {
			// Browser.IEBrowserSetup();
		} else if (browser.equalsIgnoreCase("chrome")) {
			Browser.ChromeBrowserSetup();
		}

		Browser.driver().manage().window().maximize();
		PageFactory.initElements(Browser.driver(), this);
		Browser.driver().manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
	}

	@Override
	public void load() {
		Browser.open(Constant.URL);
	}

	@Override
	protected void isLoaded() throws Error {
		// TODO Auto-generated method stub
		assertTrue(Browser.driver().getTitle().equals(Constant.TITLE));
	}

	public void close(String tc_id) {
		Browser.driver().manage().deleteAllCookies();
		Browser.close(tc_id);
	}

	public static void logo() {
		Wait.visibilityOf(HomePage.img_logo());
		
		HomePage.img_logo().isDisplayed();
		Log.info("야놀자 로고가 노출 되었습니다.");
	}

	public static void search() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.search());
		
		HomePage.search().click();

		Log.info("상단 검색 버튼을 선택 하였습니다.");
	}
	
	public static void gnbHomeActive() {
		Wait.visibilityOf(GNBPage.home());
		
		String result = GNBPage.home().getAttribute("class");
		assertTrue(result.contains("TabIcon_active"));
		Log.info("GNB > Home 메뉴가 활성화 상태 입니다.");
	}

	public static void quickCategoryMotel() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryMotel());
		
		HomePage.quickCategoryMotel().click();
		
		Log.info("퀵카테고리 > 모텔을 선택 하였습니다.");
	}

	public static void quickCategoryHotel() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryHotel());
		
		HomePage.quickCategoryHotel().click();

		Log.info("퀵카테고리 > 호텔을 선택 하였습니다.");
	}
	
	public static void quickCategoryPension() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryPension());
		
		HomePage.quickCategoryPension().click();

		Log.info("퀵카테고리 > 펜션/풀빌라를 선택 하였습니다.");
	}
	
	public static void quickCategoryGuestHouse() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryGuestHouse());
		
		HomePage.quickCategoryGuestHouse().click();

		Log.info("퀵카테고리 > 게스트하우스를 선택 하였습니다.");
	}
	
	public static void quickCategoryFirstComeCoupon() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryFirstComeCoupon());
		
		HomePage.quickCategoryFirstComeCoupon().click();

		Log.info("퀵카테고리 > 선착순 쿠폰을 선택 하였습니다.");
	}
	
	public static void quickCategoryInfinite() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryInfinite());
		
		HomePage.quickCategoryInfinite().click();

		Log.info("퀵카테고리 > 무한쿠폰룸을 선택 하였습니다.");
	}
	
	public static void quickCategoryGlobalPlace() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryGlobalPlace());
		
		HomePage.quickCategoryGlobalPlace().click();

		Log.info("퀵카테고리 > 해외숙소를 선택 하였습니다.");
	}
	
	public static void quickCategoryLeisure() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryLeisure());
		
		HomePage.quickCategoryLeisure().click();

		Log.info("퀵카테고리 > 레저/티켓을 선택 하였습니다.");
	}
	
	public static void quickCategoryFights() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryFlights());
		
		HomePage.quickCategoryFlights().click();

		Log.info("퀵카테고리 > 항공권을 선택 하였습니다.");
	}
	
	public static void quickCategoryTrain() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryTrain());
		
		HomePage.quickCategoryTrain().click();

		Log.info("퀵카테고리 > KTX를 선택 하였습니다.");
	}
	
	public static void quickCategoryRentACar() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryRentACar());
		
		HomePage.quickCategoryRentACar().click();

		Log.info("퀵카테고리 > 렌터카를 선택 하였습니다.");
	}
	
	public static void quickCategoryPrimiumHotel() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryPrimiumHotel());
		
		HomePage.quickCategoryPrimiumHotel().click();

		Log.info("퀵카테고리 > 프리미엄호텔을 선택 하였습니다.");
	}
	
	public static void quickCategoryResort() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryResort());
		
		HomePage.quickCategoryResort().click();

		Log.info("퀵카테고리 > 리조트/콘도를 선택 하였습니다.");
	}
	
	public static void quickCategoryCamping() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryCamping());
		
		HomePage.quickCategoryCamping().click();

		Log.info("퀵카테고리 > 글램핑/캠핑을 선택 하였습니다.");
	}
	
	public static void quickCategoryChild() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryChild());
		
		HomePage.quickCategoryChild().click();

		Log.info("퀵카테고리 > 아이야놀자를 선택 하였습니다.");
	}
	
	public static void quickCategoryRegion() throws InterruptedException {
		Wait.elementToBeClickable(HomePage.quickCategoryRegion());
		
		HomePage.quickCategoryRegion().click();

		Log.info("퀵카테고리 > 강원도야놀자를 선택 하였습니다.");
	}
	
	public static void recommend() {
		Wait.visibilityOf(HomePage.homePlaceRecommend());
		
		HomePage.homePlaceRecommend().isDisplayed();
		Log.info("추천위젯이 노출 되었습니다.");
	}

	public static String recommendItemTitle() {
		Wait.visibilityOf(HomePage.themePlaceItemTitle());
		
		String recommendTitle = HomePage.themePlaceItemTitle().getText();

		Log.info("추천위젯 > 임의의 상품 타이틀을 저장 하였습니다. (타이틀 : " + recommendTitle + ")");

		return recommendTitle;
	}

	public static void recommendItem() {
		Wait.elementToBeClickable(HomePage.themePlaceItem());
		
		HomePage.themePlaceItem().click();

		Log.info("추천위젯 > 임의의 상품을 선택 하였습니다.");
	}
	
	public static void exhibitionListRooms() {
		Wait.elementToBeClickable(HomePage.exhibitionListRooms());
		
		HomePage.exhibitionListRooms().click();

		Log.info("기획전 > 국내숙박을 선택 하였습니다.");
	}
	
	public static void exhibitionListLeisure() {
		Wait.elementToBeClickable(HomePage.exhibitionListLeisure());
		
		HomePage.exhibitionListLeisure().click();

		Log.info("기획전 > 레저를 선택 하였습니다.");
	}
}
