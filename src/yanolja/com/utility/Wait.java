package yanolja.com.utility;

import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Wait {
	
	public static WebElement visibilityOf(WebElement element) {		
		
		try {
			
			try {

				Thread.sleep(1000);

				WebDriverWait wait = new WebDriverWait(Browser.driver(), 5);
				wait.until(ExpectedConditions.visibilityOf(element));

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return element;
			
		} catch (StaleElementReferenceException e) {
			System.out.println("StaleElementReferenceException!!!");
			try {
				
				Thread.sleep(1000);
				
				WebDriverWait wait = new WebDriverWait(Browser.driver(), 5);
				wait.until(ExpectedConditions.visibilityOf(element));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			return element;
		}
	}
	
	public static WebElement elementToBeClickable(WebElement element) {

		try {
		
			try {

				Thread.sleep(1000);
				
				WebDriverWait wait = new WebDriverWait(Browser.driver(), 5);
				wait.until(ExpectedConditions.elementToBeClickable(element));

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return element;
			
		} catch (StaleElementReferenceException e) {
			System.out.println("StaleElementReferenceException!!!");
			try {

				Thread.sleep(1000);
				
				WebDriverWait wait = new WebDriverWait(Browser.driver(), 5);
				wait.until(ExpectedConditions.elementToBeClickable(element));

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			

			return element;
		}
	}
	
	public static void loader() {		
		
		try {
			
			try {

				Thread.sleep(1000);
				
				WebDriverWait wait = new WebDriverWait(Browser.driver(), 5);
				wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("div[class*='SquareLoader']")));

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (StaleElementReferenceException e) {
			System.out.println("StaleElementReferenceException!!!");
			try {

				Thread.sleep(1000);
				
				WebDriverWait wait = new WebDriverWait(Browser.driver(), 5);
				wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("div[class*='SquareLoader']")));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}
