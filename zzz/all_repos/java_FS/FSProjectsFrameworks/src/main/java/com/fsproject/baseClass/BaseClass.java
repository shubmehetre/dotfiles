package com.fsproject.baseClass;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.Capabilities;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.firefox.internal.ProfilesIni;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.logging.LogType;
import org.openqa.selenium.logging.LoggingPreferences;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.fsproject.util.ReadData;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.MobileCapabilityType;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServiceBuilder;
import io.appium.java_client.service.local.flags.GeneralServerFlag;

public class BaseClass

{
	public static WebDriver driver;
	private static String env = System.getProperty("env").toUpperCase();
	String BaseUrl = ReadData.readDataFromPropertyFile("DefaultBaseUrl"+env,env);
	String browser =  System.getProperty("browser");
	private static String OS = System.getProperty("os.name").toLowerCase();
	public AppiumDriverLocalService appiumService;
	
	@Before("@ui")
	public WebDriver setUp() throws Exception 
	{
		if (browser != null) {
			if (browser.equalsIgnoreCase("chrome")) {
				driver = chromeDriver();
			} else if (browser.equalsIgnoreCase("firefox")) {
				driver = firefoxDriver();
			} else if (browser.equalsIgnoreCase("internetexplorer")) {
				driver = ieDriver();
			}
			

			else {
				System.out
						.println("***** WARNING ***** - BROWSER  provided is Incorrect so initiating default (chrome) browser.");
				driver = chromeDriver();
			}
		} else {
			System.out
					.println("***** WARNING ***** - BROWSER  provided is NULL or BLANK so initiating default (chrome) browser.");
			driver = chromeDriver();
		}

		driver.manage().deleteAllCookies();

		driver.manage().window().maximize();
		
		driver.get(BaseUrl);

		
		 driver.manage().timeouts().pageLoadTimeout(40, TimeUnit.SECONDS);
		 driver.manage().deleteAllCookies();
	    
	    System.out.println("After navigate to Base Url");
		return driver;
	}
	@Before("@mobile")
	public WebDriver setUpMobile() throws Exception 
	{
		if (browser != null) {
		}if (browser.equalsIgnoreCase("androidmobilebrowser")) {
			driver = androidMobileWebDriver();
		}else if (browser.contains("androidNativeAppTesting")) {
			driver = androidNativeAppDriver();
		}else if(browser.contains("iOSNativeAppTesting")) {
			driver = iPhoneNativeAppDriver();
		}

			

			else {
				System.out
						.println("***** WARNING ***** - BROWSER  provided is Incorrect so initiating default (chrome) browser.");
				driver = chromeDriver();
			}
		
		
		return driver;
	}
	
	@After("@ui")
	public void tearDown(Scenario scenario) throws Exception {
		if (scenario.isFailed()) {
			try {
				final byte[] screenshot = ((TakesScreenshot) driver)
						.getScreenshotAs(OutputType.BYTES);
				scenario.embed(screenshot, "image/png");
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("\n***** SCENARIO '" + scenario.getName() + "'"
					+ " is FAILED *****");
			System.out.println("***** Page Title -> '" + driver.getTitle()
					+ "'");
			System.out.println("***** Current URL-> '" + driver.getCurrentUrl()
					+ "'");
		} else {
			System.out.println("\n.....SCENARIO IS PASSED.....");
		}

		System.out
				.println("\n===============================================================================");

		if (driver != null) {
			//driver.manage().deleteAllCookies();
			
		//	driver.close();
			driver.quit();
		}
	}
	@After("@mobile")
	public void tearDownMobile(Scenario scenario) throws Exception {
		driver.quit();
		appiumService.stop();
	}
	public WebDriver androidMobileWebDriver() throws MalformedURLException 
	{
	//	System.setProperty("ANDROID_HOME", "C:\\Users\\Purnima Chhabra\\AppData\\Local\\Android\\android-sdk");
		
		System.out.println(System.getenv("ANDROID_HOME"));
		System.out.println(System.getenv("PATH"));
		DesiredCapabilities cap = new DesiredCapabilities();
		cap.setCapability("browserName", "chrome");
	//	cap.setCapability("appium-version", "1.6.1");
		cap.setCapability("platformVersion","7.0");
		cap.setCapability("deviceName","YSJRY5GEJBRKSK9P");
		cap.setCapability("platformName","ANDROID");
		AppiumServiceBuilder builder = new AppiumServiceBuilder()
				.usingDriverExecutable(new File("C:/Program Files/nodejs/node.exe"))		
				.withAppiumJS(new File("C:/Program Files (x86)/Appium/resources/app/node_modules/appium/build/lib/main.js"))
				.withArgument(GeneralServerFlag.LOG_LEVEL, "info")
				.usingAnyFreePort();
			appiumService = builder.build();
		    appiumService.start();
		   String  appiumServiceUrl = appiumService.getUrl().toString();
		   System.out.println(appiumServiceUrl);
		AndroidDriver driver = new AndroidDriver(new URL(appiumServiceUrl), cap);
		driver.get("https://www.google.com");
		return driver;
	}
	public WebDriver androidNativeAppDriver() throws MalformedURLException, InterruptedException 
	{
	//	System.setProperty("ANDROID_HOME", "C:\\Users\\Purnima Chhabra\\AppData\\Local\\Android\\android-sdk");
		
		
		DesiredCapabilities cap = new DesiredCapabilities();
		//cap.setCapability("browserName", "chrome");
	//	cap.setCapability("appium-version", "1.6.1");
		cap.setCapability("platformVersion","7.0");
		cap.setCapability("deviceName","YSJRY5GEJBRKSK9P");
		cap.setCapability("platformName","ANDROID");
		cap.setCapability("appPackage", "com.fsproject.android.stage");
		cap.setCapability("appActivity", "com.pique.mobile.view.SplashActivity");
		cap.setCapability("unicodeKeyboard", true);
		cap.setCapability("resetKeyboard", true);
		cap.setCapability("useJSONSource", true);
		cap.setCapability("no-reset", "true");
		cap.setCapability("full-reset", "False");
		
		String apkpath="/Users/fidel/Downloads/Test.apk";
		File app=new File(System.getProperty("user.dir")+"/resources/fsproject-stage.apk");
		cap.setCapability("app", app.getAbsolutePath());
		AppiumServiceBuilder builder = new AppiumServiceBuilder()
				.usingDriverExecutable(new File("C:/Program Files/nodejs/node.exe"))		
				.withAppiumJS(new File("C:/Program Files (x86)/Appium/resources/app/node_modules/appium/build/lib/main.js"))
				.withArgument(GeneralServerFlag.LOG_LEVEL, "info")
				.usingAnyFreePort();
	       appiumService = builder.build();
		    appiumService.start();
		   String  appiumServiceUrl = appiumService.getUrl().toString();
		   System.out.println(appiumServiceUrl);
		//your test scripts logic...
		
		AndroidDriver androiddriver = new AndroidDriver(new URL(appiumServiceUrl), cap);
	//	AndroidDriver driver = new AndroidDriver(new URL("http://0.0.0.0:4723/wd/hub"), cap);
	    Thread.sleep(10000);
		
		return androiddriver;
	}
	public WebDriver iPhoneNativeAppDriver() throws MalformedURLException, InterruptedException 
	{
	//	System.setProperty("ANDROID_HOME", "C:\\Users\\Purnima Chhabra\\AppData\\Local\\Android\\android-sdk");
		
		
		DesiredCapabilities cap = new DesiredCapabilities();
		
	//	cap.setCapability("deviceName", "iPhone 6");
		cap.setCapability("platformVersion", "11.2");
		cap.setCapability("platformName", "iOS");
	//	cap.setCapability("platform", "Mac");
      // cap.setCapability("deviceName", "iPhone Simulator");
        cap.setCapability("deviceName", "iPhone 6");
        
        cap.setCapability("udid", "8a66f7ede6e5c299cb7a96a3a3228ccfb4b373fb");
        cap.setCapability("unicodeKeyboard", true);
		cap.setCapability("resetKeyboard", true);
       cap.setCapability("bundleId", "com.fsproject.MCKA.QA");
      File app=new File("/Applications/MCKA-QA.ipa");
        cap.setCapability("app", "/Applications/MCKA-QA.ipa");
       cap.setCapability("clearSystemFile", true);
     //   cap.setCapability("keychainPath", "/Users/admin/Library/Keychains/login.keychain-db");
     //   cap.setCapability("keychainPassword", "password");
     //  cap.setCapability(CapabilityType.BROWSER_NAME, "safari");
    //    cap.setCapability("autoWebview", "true");
  //      cap.setCapability("startIWDP", "true");
     //  cap.setCapability("showXcodeLog", "true");
   //     cap.setCapability(MobileCapabilityType.NEW_COMMAND_TIMEOUT,0);

 //       cap.setCapability("automationName", "XCUITest");
      //  cap.setCapability(MobileCapabilityType.NO_RESET, "true");
        cap.setCapability(MobileCapabilityType.FULL_RESET,true);
        
      /* appiumService = AppiumDriverLocalService.buildService(new AppiumServiceBuilder()
                .usingDriverExecutable(new File(("/usr/local/bin/node")))
                .withAppiumJS(new File(("/usr/local/bin/appium")))
                .withIPAddress("0.0.0.0")
                .usingPort(4723)
                .withArgument(GeneralServerFlag.SESSION_OVERRIDE));
     //           .withLogFile(new File("build/appium.log")));
        appiumService.start();*/

		IOSDriver IOSdriver = new IOSDriver(new URL("http://0.0.0.0:4723/wd/hub"), cap);
	//	driver.launchApp();
		TouchAction action = new TouchAction(IOSdriver);
		action.tap(250,395).perform();
		 Thread.sleep(2000);
	
			return IOSdriver;
		}
	public WebDriver chromeDriver() {
		LoggingPreferences logPrefs = new LoggingPreferences();
		logPrefs.enable(LogType.BROWSER, Level.ALL);
		DesiredCapabilities chCapabilities = DesiredCapabilities.chrome();
		ChromeOptions options = new ChromeOptions();
	//	options.addArguments("--test-type");
	//	options.addArguments("--no-sandbox");
		//options.addArguments("--headless");
		
		  chCapabilities.setCapability(CapabilityType.ForSeleniumServer.
		  ENSURING_CLEAN_SESSION, true);
		  chCapabilities.setCapability(CapabilityType.LOGGING_PREFS, logPrefs);
		  chCapabilities.setCapability(ChromeOptions.CAPABILITY, options);
		 
		if (OS.toLowerCase().contains("nux") || OS.toLowerCase().contains("nix")) {
			System.out.println("Launching driver for LINUX");
			System.setProperty("webdriver.chrome.driver", "resources/drivers/chromedriver");
		} else if (OS.toLowerCase().contains("win")) {
			System.out.println("Launching driver for WINDOWS");
			System.setProperty("webdriver.chrome.driver", "resources/drivers/chromedriver.exe");
		} else if (OS.toLowerCase().contains("mac")) {
			System.out.println("Launching driver for MAC");
			System.setProperty("webdriver.chrome.driver", "src/test/resources/drivers/chromedriver");
		} else {
			System.out.println("!x!x!x!x! ERROR !x!x!x!x! - OPERATING SYSTEM NOT SUPPORTED");
		}
		return driver = new ChromeDriver(options);
	}

	public WebDriver firefoxDriver() 
	{
		ProfilesIni Profiles = new ProfilesIni();
		FirefoxProfile ffProfile = Profiles.getProfile("default");
		driver = new FirefoxDriver((Capabilities) ffProfile);
		System.out.println("Browser-------> Firefox\n");
		return driver;
	}

	public WebDriver ieDriver() 
	{
		System.setProperty("webdriver.ie.driver",
				"resources/drivers/iedriver.exe");
		
		/*
		 * DesiredCapabilities ieCapabilities = new DesiredCapabilities();
		 * ieCapabilities = DesiredCapabilities .internetExplorer();
		 * ieCapabilities.setCapability(InternetExplorerDriver.IE_ENSURE_CLEAN_SESSION,
		 * true); ieCapabilities .setCapability(
		 * InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS,
		 * true);
		 */
		
		  DesiredCapabilities dc = new DesiredCapabilities();
		  dc.setCapability(InternetExplorerDriver.ENABLE_PERSISTENT_HOVERING,false);
		  dc.setCapability(InternetExplorerDriver.REQUIRE_WINDOW_FOCUS, false);
		  dc.setCapability(InternetExplorerDriver.UNEXPECTED_ALERT_BEHAVIOR, true);
		  dc.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
		  dc.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true); 
		  dc.setJavascriptEnabled(true);  
		
		driver = new InternetExplorerDriver(dc);
		System.out.println("Browser-------> Internet Explorer\n");
		return driver;
		
	
	      
	}
	
	
}


