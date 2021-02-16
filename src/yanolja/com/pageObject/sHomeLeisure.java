package yanolja.com.pageObject;

import yanolja.com.uiMap.sHomeLeisurePage;
import yanolja.com.uiMap.sHomeMotelPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class sHomeLeisure {

	public static void sHomePopularCategoryAll() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(sHomeLeisurePage.sHomePopularCategoryAll());
		
		sHomeLeisurePage.sHomePopularCategoryAll().click();
		
		Log.info("인기 카테고리 > 상품 전체보기를 선택 하였습니다.");
	}
	
	public static void categoryMore() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(sHomeLeisurePage.categoryMore());
		
		sHomeLeisurePage.categoryMore().click();
		
		Log.info("인기 카테고리 > 더보기 를 선택 하였습니다.");
	}
	
	public static void tabBarMobileVoucher() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(sHomeLeisurePage.tabBarMobileVoucher());
		
		sHomeLeisurePage.tabBarMobileVoucher().click();
		
		Log.info("전체 카테고리 > 모바일교환권 탭을 선택 하였습니다.");
	}
	
	public static void mobileVoucherCategory() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(sHomeLeisurePage.mobileVoucherCategory());
		
		sHomeLeisurePage.mobileVoucherCategory().click();
		
		Log.info("전체 카테고리 > 모바일교환권탭 > 첫번째 카테고리를 선택 하였습니다.");
	}
	
	public static void mobileVoucherCategoryAll() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(sHomeLeisurePage.mobileVoucherCategoryAll());
		
		sHomeLeisurePage.mobileVoucherCategoryAll().click();
		
		Log.info("전체 카테고리 > 모바일교환권탭 > 첫번째 카테고리 > 전체 를 선택 하였습니다.");
	}
}
