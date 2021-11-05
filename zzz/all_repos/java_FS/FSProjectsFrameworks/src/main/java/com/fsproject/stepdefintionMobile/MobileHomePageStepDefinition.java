package com.fsproject.stepdefintionMobile;

import java.util.Map;

import org.openqa.selenium.WebDriver;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.pages.GoogleHomePage;

import cucumber.api.PendingException;
import cucumber.api.java.en.Then;

public class MobileHomePageStepDefinition {
	
	WebDriver driver=BaseClass.driver;
	GoogleHomePage homeObj=new GoogleHomePage(driver);
	private Map<String,String>countryValue;


	
	
	@Then("^Google search textbox \"([^\"]*)\" is displayed in mobile$")
	public void google_search_textbox_is_displayed_in_mobile(String arg1) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}

	@Then("^Click on image on home page in mobile$")
	public void click_on_image_on_home_page_in_mobile() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}


}
