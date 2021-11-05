package com.fsproject.pages;

import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.util.ReadData;
import com.fsproject.util.ResuableFunctions;


public class FlipkartSignInPage {
private WebDriver driver;
private static String env = System.getProperty("env").toUpperCase();
ResuableFunctions ResuableFunctions=new ResuableFunctions();
 public FlipkartSignInPage(WebDriver driver){
	 this.driver=driver;
	 PageFactory.initElements(driver, this);
	 
	 
 }
 @FindBy(xpath="//span[text()='Login or Signup']")
 public WebElement loginLabel;
 
 
 
 public void verifySignPageIsDisplayed() {
	 ResuableFunctions.waitForElementToBeDisplayed(loginLabel);
	 System.out.println(loginLabel.getText());
	 Assert.assertEquals(loginLabel.getText().trim(),"LOGIN OR SIGNUP");
	 
 }
}
