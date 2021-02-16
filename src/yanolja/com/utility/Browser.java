package yanolja.com.utility;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Browser {

	private static WebDriver driver;
	/*
	public static void IEBrowserSetup() {
		String driverFile = Constant.Path_project + "\\Lib\\IEDriverServer.exe";
		System.setProperty("webdriver.ie.driver", driverFile);
		
		// InternetExplorer 브라우저 
		DesiredCapabilities cap =	DesiredCapabilities.internetExplorer();
		cap.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
		cap.setCapability(InternetExplorerDriver.IE_ENSURE_CLEAN_SESSION, true);
		cap.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
		cap.setCapability(InternetExplorerDriver.IGNORE_ZOOM_SETTING, true);
		
		driver = new InternetExplorerDriver(cap);
	}
	*/
	public static void ChromeBrowserSetup() {
		String driverFile = "/usr/local/bin/chromedriver";
		System.setProperty("webdriver.chrome.driver", driverFile);
		driver = new ChromeDriver();
	}
	
	public static WebDriver driver() {		
		return driver;
	}
	
	public static void open (String url) {		
		driver.get(url);
	}
	
	public static void close(String tc_id) {
		driver.manage().deleteAllCookies();
		driver.quit();	
		Log.endTC(tc_id);
	}	
}
