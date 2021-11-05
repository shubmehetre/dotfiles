package com.fsproject.stepdefinition;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import com.fsproject.util.*;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.interactions.Actions;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.pages.FlipkartHomePage;
import com.fsproject.pages.FlipkartProductDetailsPage;
import com.fsproject.pages.FlipkartSignInPage;
import com.fsproject.pages.FlipkartTVHomePage;
import com.fsproject.pages.GoogleHomePage;

import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.Transform;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import junit.framework.Assert;

public class FlipkartStepDefinition {
WebDriver driver=BaseClass.driver;
private static String env = System.getProperty("env").toUpperCase();
String host=ReadData.readDataFromPropertyFile("host",env);
String userServer=ReadData.readDataFromPropertyFile("userServer",env);
String serverPath=ReadData.readDataFromPropertyFile("serverPath",env);
String batchScriptPath=ReadData.readDataFromPropertyFile("batchScriptPath",env);
String passwordServer=ReadData.readDataFromPropertyFile("passwordServer",env);
FlipkartHomePage homeObj=new FlipkartHomePage(driver);
FlipkartTVHomePage homeTVObj=new FlipkartTVHomePage(driver);
FlipkartProductDetailsPage amazonDetailsPageObj=new FlipkartProductDetailsPage(driver);
FlipkartSignInPage amazonSignInPageObj=new FlipkartSignInPage(driver);
private Map<String,String>countryValue;


@Given("^I am on Products Home Page$")
public void i_am_on_Products_Home_Page() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	
	
    homeObj.navigateToSmartPhoneHomePage();
}

@When("^I add some Product$")
public void i_add_some_Product() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	homeTVObj.addProductFromCartPage();

}

@When("^Select My Cart and Proceed to checkout$")
public void select_My_Cart_and_Proceed_to_checkout() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	amazonDetailsPageObj.navigateToCheckoutPage();
	amazonSignInPageObj.verifySignPageIsDisplayed();
}

@When("^I run injecting script with \"([^\"]*)\" file$")
public void I_run_injecting_script_with_file(String originalFile) throws Throwable {
	SftpConnection.sftpConnection(host, userServer, passwordServer,serverPath,System.getProperty("user.dir")+"/resources/InjectedMessage/"+originalFile);
		//boolean ptimestamp = false;
		//String command="scp " + (ptimestamp ? "-p" :"") +" -t "+System.getProperty("user.dir")+"/resources/InjectedMessage/"+originalFile;
		//BatchRunClass.getBatchRunCommandData(host, userServer, passwordServer,"cd "+serverPath+"&&"+command);
	BatchRunClass.getBatchRunCommandData(host, userServer, passwordServer, "cd "+serverPath+"&&unix2dos "+originalFile);


	}


}
