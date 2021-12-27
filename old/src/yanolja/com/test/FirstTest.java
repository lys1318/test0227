package yanolja.com.test;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class FirstTest {
	WebDriver driver;
	public void launchBrowser() throws InterruptedException {
		String driverFile = "/usr/local/bin/chromedriver";
		//String driverFile = "/Users/inho.choi/Documents/workspace/YanoljaTest/driver/chromedriver";
		System.setProperty("webdriver.chrome.driver", driverFile);
		driver = new ChromeDriver();
		driver.get("http://www.yanolja.com");
		Thread.sleep(3000);
		driver.quit();
	}
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		FirstTest obj = new FirstTest();
		obj.launchBrowser();
	}

}