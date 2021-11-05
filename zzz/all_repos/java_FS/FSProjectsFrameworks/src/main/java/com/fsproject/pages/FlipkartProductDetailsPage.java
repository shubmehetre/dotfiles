package com.fsproject.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.util.ReadData;
import com.fsproject.util.ResuableFunctions;

import junit.framework.Assert;



public class FlipkartProductDetailsPage {
private WebDriver driver;
private static String env = System.getProperty("env").toUpperCase();
ResuableFunctions ResuableFunctions=new ResuableFunctions();
 public FlipkartProductDetailsPage(WebDriver driver){
	 this.driver=driver;
	 PageFactory.initElements(driver, this);
	 
	 
 }
 @FindBy(xpath="//span[text()='Place Order']/..")
 public WebElement buttonProceedToCeckout;
 
 
 
 public void navigateToCheckoutPage() {
	 
	ResuableFunctions.waitForElementToBeDisplayed(buttonProceedToCeckout);
	// ResuableFunctions.shortPause();
	ResuableFunctions.click(buttonProceedToCeckout);
	
	 //Assert.assertTrue(driver.getTitle().contains("Amazon Sign In India"));
	 
 }
}
