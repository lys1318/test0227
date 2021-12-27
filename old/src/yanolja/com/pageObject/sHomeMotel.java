package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.sHomeMotelPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class sHomeMotel {
	
	public static String sHomeTitle() {
		Wait.visibilityOf(sHomeMotelPage.sHomeNavTitle());
		
		String sHomeNavTitle = sHomeMotelPage.sHomeNavTitle().getText();
		
		Log.info("서브홈 > 타이틀을 저장 하였습니다. (타이틀 : " + sHomeNavTitle + ")");
		Allure.step("서브홈 > 타이틀을 저장 하였습니다. (타이틀 : " + sHomeNavTitle + ")");
		
		return sHomeNavTitle;
	}
	
	public static void sHomeHome() {
		Wait.elementToBeClickable(sHomeMotelPage.sHomeNavHome());
		
		sHomeMotelPage.sHomeNavHome().click();
		
		Log.info("상단 네비게이션에서 Home 버튼을 선택 하였습니다.");
		Allure.step("상단 네비게이션에서 Home 버튼을 선택 하였습니다.");
	}
	
	public static void sHomeBack() {
		Wait.elementToBeClickable(sHomeMotelPage.sHomeNavBack());
		
		sHomeMotelPage.sHomeNavBack().click();
		
		Log.info("상단 네비게이션에서 Back 버튼을 선택 하였습니다.");
		Allure.step("상단 네비게이션에서 Back 버튼을 선택 하였습니다.");
	}
	
	public static void sHomeSearch() {
		Wait.elementToBeClickable(sHomeMotelPage.sHomeNavSearch());
		
		sHomeMotelPage.sHomeNavSearch().click();
		
		Log.info("상단 네비게이션에서 Search 버튼을 선택 하였습니다.");
		Allure.step("상단 네비게이션에서 Search 버튼을 선택 하였습니다.");
	}
	
	public static void sHomeRegion1Depth() {
		Wait.elementToBeClickable(sHomeMotelPage.sHomeRegion1Depth());
		
		sHomeMotelPage.sHomeRegion1Depth().click();
		
		Log.info("1Depth 지역을 선택 하였습니다.");
		Allure.step("1Depth 지역을 선택 하였습니다.");
	}
	
	public static void sHomeRegion2Depth() {
		Wait.elementToBeClickable(sHomeMotelPage.sHomeRegion2Depth());
		
		sHomeMotelPage.sHomeRegion2Depth().click();
		
		Log.info("2Depth 지역을 선택 하였습니다.");
		Allure.step("2Depth 지역을 선택 하였습니다.");
	}
	
}
