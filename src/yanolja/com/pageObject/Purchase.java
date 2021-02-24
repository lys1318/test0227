package yanolja.com.pageObject;

import io.qameta.allure.Allure;
import yanolja.com.uiMap.PurchasePage;
import yanolja.com.utility.Log;
import yanolja.com.utility.Wait;

public class Purchase {
	
	public static void birthday(String birthday) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.birthday());

		PurchasePage.birthday().sendKeys(birthday);

		Log.info("구매하기 > 대표 탑승자 정보 > 생년월일이 입력 되었습니다.");
		Allure.step("구매하기 > 대표 탑승자 정보 > 생년월일이 입력 되었습니다.");

	}
	
	public static void working() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PurchasePage.working());

		PurchasePage.working().click();

		Log.info("숙소 예약 > 도보 를 선택 하였습니다.");
		Allure.step("숙소 예약 > 도보 를 선택 하였습니다.");

	}
	
	public static void actionAgreeForPayment() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PurchasePage.actionAgreeForPayment());

		PurchasePage.actionAgreeForPayment().click();

		Log.info("숙소 예약 > 동의 및 결제 를 선택 하였습니다.");
		Allure.step("숙소 예약 > 동의 및 결제 를 선택 하였습니다.");

	}
	
	public static void roomOrder() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PurchasePage.roomOrder());

		PurchasePage.roomOrder().click();

		Log.info("숙소 예약 > 결제하기 선택 되었습니다.");
		Allure.step("숙소 예약 > 결제하기 선택 되었습니다.");

	}
	
	public static void point() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.point());

		PurchasePage.point().click();
		//JavascriptExecutor executor = (JavascriptExecutor)Browser.driver();
		//executor.executeScript("arguments[0].click();", LeisurePDPPage.countUp());

		Log.info("구매하기 > 가격 및 할인 정보 > 포인트 > 전액사용 선택 되었습니다.");
		Allure.step("구매하기 > 가격 및 할인 정보 > 포인트 > 전액사용 선택 되었습니다.");

	}
	
	public static void agreeAll() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.agreeAll());

		PurchasePage.agreeAll().click();

		Log.info("구매하기 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");
		Allure.step("구매하기 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");

	}
	
	public static void order() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.order());

		PurchasePage.order().click();

		Log.info("구매하기 > 결제하기 선택 되었습니다.");
		Allure.step("구매하기 > 결제하기 선택 되었습니다.");

	}
	
	public static void trainTicketOrderAgreeAll() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.trainTicketOrderAgreeAll());

		PurchasePage.trainTicketOrderAgreeAll().click();

		Log.info("구매하기 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");
		Allure.step("구매하기 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");

	}
	
	public static void trainTicketOrder() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.trainTicketOrder());

		PurchasePage.trainTicketOrder().click();

		Log.info("구매하기 > 결제하기 선택 되었습니다.");
		Allure.step("구매하기 > 결제하기 선택 되었습니다.");

	}
	
	public static void roomReservationAgreeAll() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PurchasePage.roomReservationAgreeAll());

		PurchasePage.roomReservationAgreeAll().click();

		Log.info("숙소 예약 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");
		Allure.step("숙소 예약 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");

	}
	
	public static void emailClear() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.email());

		PurchasePage.email().clear();

		Log.info("해외숙소 예약 > 예약자 정보 > 이메일 항목이 초기화 되었습니다.");
		Allure.step("해외숙소 예약 > 예약자 정보 > 이메일 항목이 초기화 되었습니다.");
	}
	
	public static void email(String email) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.email());

		PurchasePage.email().sendKeys(email);

		Log.info("해외숙소 예약 > 예약자 정보 > 이메일이 입력 되었습니다.");
		Allure.step("해외숙소 예약 > 예약자 정보 > 이메일이 입력 되었습니다.");
	}
	
	public static void lastName(String lastName) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.lastName());

		PurchasePage.lastName().sendKeys(lastName);

		Log.info("해외숙소 예약 > 투숙객 정보 > 성(영문) 이 입력 되었습니다.");
		Allure.step("해외숙소 예약 > 투숙객 정보 > 성(영문) 이 입력 되었습니다.");
	}
	
	public static void firstName(String firstName) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.visibilityOf(PurchasePage.firstName());

		PurchasePage.firstName().sendKeys(firstName);

		Log.info("해외숙소 예약 > 투숙객 정보 > 이름(영문) 이 입력 되었습니다.");
		Allure.step("해외숙소 예약 > 투숙객 정보 > 이름(영문) 이 입력 되었습니다.");
	}
	
	public static void globalAgreeAll() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PurchasePage.globalAgreeAll());

		PurchasePage.globalAgreeAll().click();

		Log.info("해외숙소 예약 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");
		Allure.step("해외숙소 예약 > 규정 및 약관 동의 > 전체 동의 선택 되었습니다.");

	}
	
	public static void globalOrder() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Wait.elementToBeClickable(PurchasePage.globalOrder());

		PurchasePage.globalOrder().click();

		Log.info("해외숙소 예약 > 결제하기 를 선택 하였습니다.");
		Allure.step("해외숙소 예약 > 결제하기 를 선택 하였습니다.");

	}
}
