package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.SearchPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Search {
	
	public static void searchHome() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(SearchPage.searchNavHome());
		
		SearchPage.searchNavHome().click();
		
		Log.info("상단 네비게이션에서 Home 버튼을 선택 하였습니다.");
		Allure.step("상단 네비게이션에서 Home 버튼을 선택 하였습니다.");
	}
	
	public static void searchInput(String text) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(SearchPage.searchInputBox());
		
		SearchPage.searchInputBox().sendKeys(text);
		
		Log.info("검색어로 '" + text + "' 가 입력 되었습니다.");
		Allure.step("검색어로 '" + text + "' 가 입력 되었습니다.");
	}
	
	public static String searchPlaceAutocompleteItemTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(SearchPage.searchPlaceAutocompleteItemTitle());
		
		String searchPlaceAutocompleteItemTitle = SearchPage.searchPlaceAutocompleteItemTitle().getText();
		
		Log.info("자동완성목록 > 아이템 타이틀을 저장 하였습니다. (타이틀 : " + searchPlaceAutocompleteItemTitle + ")");
		Allure.step("자동완성목록 > 아이템 타이틀을 저장 하였습니다. (타이틀 : " + searchPlaceAutocompleteItemTitle + ")");
		
		return searchPlaceAutocompleteItemTitle;
	}
	
	public static void searchPlaceAutocomplete() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(SearchPage.searchPlaceAutocomplete());
		
		SearchPage.searchPlaceAutocomplete().click();
		
		Log.info("자동완성 목록에서 아이템을 선택 하였습니다.");
		Allure.step("자동완성 목록에서 아이템을 선택 하였습니다.");
	}
}
