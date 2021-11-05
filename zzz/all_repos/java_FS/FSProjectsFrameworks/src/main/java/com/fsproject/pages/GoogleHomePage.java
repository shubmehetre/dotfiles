package com.fsproject.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.util.ReadData;
import com.fsproject.util.ResuableFunctions;



public class GoogleHomePage {
private static String env = System.getProperty("env").toUpperCase();
ResuableFunctions ResuableFunctions=new ResuableFunctions();
 public GoogleHomePage(WebDriver driver){
	 PageFactory.initElements(driver, this);
	 
 }
 @FindBy(name="q")
 public WebElement googleSearch;
 
 @FindBy(xpath="//a[text()='Gmail']/../following-sibling::div/a")
 public WebElement googleImage;
 
 @FindBy(linkText="Gmail")
 public WebElement gmailLink;
 
 public void verifyHomePageIsDisplayed() {
	 System.out.println(ReadData.readDataFromPropertyFile("url", env));
	
	 ResuableFunctions.refreshPage();
	 
 }
}
