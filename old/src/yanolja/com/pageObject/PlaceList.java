package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.PlaceListPage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class PlaceList {

	public static String placeListTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.placeListTitle());
		
		String placeListTitle = PlaceListPage.placeListTitle().getText();

		Log.info("PLP > 타이틀을 저장 하였습니다. (타이틀 : " + placeListTitle + ")");
		Allure.step("PLP > 타이틀을 저장 하였습니다. (타이틀 : " + placeListTitle + ")");

		return placeListTitle;
	}

	public static void placeList() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.placeListTitle());
		
		PlaceListPage.placeListTitle().click();

		Log.info("PLP > 지역명을 선택 하였습니다.");
		Allure.step("PLP > 지역명을 선택 하였습니다.");

	}

	public static String leisureSubTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.leisureSubTitle());
		
		String leisureSubTitle = PlaceListPage.leisureSubTitle().getText();

		Log.info("PLP > 이 주변 놀거리 타이틀을 저장 하였습니다. (타이틀 : " + leisureSubTitle + ")");
		Allure.step("PLP > 이 주변 놀거리 타이틀을 저장 하였습니다. (타이틀 : " + leisureSubTitle + ")");

		return leisureSubTitle;
	}

	public static void leisureViewAll() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.viewAll());
		
		PlaceListPage.viewAll().click();

		Log.info("PLP > 이 주변 놀거리 > 전체보기를 선택 하였습니다.");
		Allure.step("PLP > 이 주변 놀거리 > 전체보기를 선택 하였습니다.");

	}

	public static void regionLeisure() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.regionLeisureItem());
		
		PlaceListPage.regionLeisureItem().click();

		Log.info("이 주변 놀거리 > 임의의 상품을 선택 하였습니다.");
		Allure.step("이 주변 놀거리 > 임의의 상품을 선택 하였습니다.");
	}

	public static String regionLeisureItemTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.regionLeisureItemTitle());
		
		String regionLeisureItemTitle = PlaceListPage.regionLeisureItemTitle().getText();

		Log.info("이 주변 놀거리 > 임의의 상품 타이틀을 저장 하였습니다. (타이틀 : " + regionLeisureItemTitle + ")");
		Allure.step("이 주변 놀거리 > 임의의 상품 타이틀을 저장 하였습니다. (타이틀 : " + regionLeisureItemTitle + ")");

		return regionLeisureItemTitle;
	}

	public static String regionTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.regionTitle());
		
		String regionTitle = PlaceListPage.regionTitle().getText();

		Log.info("지역선택 타이틀을 저장 하였습니다. (타이틀 : " + regionTitle + ")");
		Allure.step("지역선택 타이틀을 저장 하였습니다. (타이틀 : " + regionTitle + ")");

		return regionTitle;
	}

	public static void calendar() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.calendar());
		
		PlaceListPage.calendar().click();

		Log.info("캘린더를 선택 하였습니다.");
		Allure.step("캘린더를 선택 하였습니다.");
	}

	public static String calendarTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.calendarTitle());
		
		String calendarTitle = PlaceListPage.calendarTitle().getText();

		Log.info("날짜 지정 팝업 타이틀을 저장 하였습니다. (타이틀 : " + calendarTitle + ")");
		Allure.step("날짜 지정 팝업 타이틀을 저장 하였습니다. (타이틀 : " + calendarTitle + ")");

		return calendarTitle;
	}

	public static void capacity() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.capacity());
		
		PlaceListPage.capacity().click();

		Log.info("인원수를 선택 하였습니다.");
		Allure.step("인원수를 선택 하였습니다.");
	}

	public static String capacityTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.capacityTitle());
		
		String capacityTitle = PlaceListPage.capacityTitle().getText();

		Log.info("인원수 팝업 타이틀을 저장 하였습니다. (타이틀 : " + capacityTitle + ")");
		Allure.step("인원수 팝업 타이틀을 저장 하였습니다. (타이틀 : " + capacityTitle + ")");

		return capacityTitle;
	}

	public static void coupon() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.coupon());
		
		PlaceListPage.coupon().click();

		Log.info("쿠폰 할인 가능한 숙소를 선택 하였습니다.");
		Allure.step("쿠폰 할인 가능한 숙소를 선택 하였습니다.");
	}

	public static String couponStatus() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.coupon());
		
		String result = PlaceListPage.coupon().getAttribute("aria-checked");

		return result;
	}

	public static void randomPlaceListItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.randomPlaceListItem());
		
		PlaceListPage.randomPlaceListItem().click();

		Log.info("임의의 숙소를 선택 하였습니다.");
		Allure.step("임의의 숙소를 선택 하였습니다.");
	}
	
	public static void placeListItem() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PlaceListPage.PlaceListItem());
		
		PlaceListPage.PlaceListItem().click();

		Log.info("임의의 숙소를 선택 하였습니다.");
		Allure.step("임의의 숙소를 선택 하였습니다.");
	}

	public static String placeListItemTitle() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PlaceListPage.PlaceListItem());
		
		String placeListItemTitle = PlaceListPage.PlaceListItem().getAttribute("title");

		Log.info("임의의 숙소 타이틀을 저장 하였습니다. (타이틀 : " + placeListItemTitle + ")");
		Allure.step("임의의 숙소 타이틀을 저장 하였습니다. (타이틀 : " + placeListItemTitle + ")");

		return placeListItemTitle;
	}
}
