package com.fsproject.pages;

import java.awt.AWTException;
import java.awt.Point;
import java.awt.Robot;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.util.ReadData;
import com.fsproject.util.ResuableFunctions;



public class FlipkartHomePage {
private static String env = System.getProperty("env").toUpperCase();
WebDriver driver=BaseClass.driver;
ResuableFunctions ResuableFunctions=new ResuableFunctions();
 public FlipkartHomePage(WebDriver driver){
	 PageFactory.initElements(driver, this);
	 
 }
 
 @FindBy(xpath="//button[text()='✕']")
 public WebElement closeWindowModal;

 @FindBy(xpath="//div[text()='Mobiles']")
 public WebElement mobileLink;
 
 @FindBy(xpath="//span[text()='Electronics']")
 public WebElement linkFlipkartGlobalNavigation;
 
 @FindBy(css="a[href^='/samsung-mobile']")
 public WebElement linkSamrtPhone;
 
 @FindBy(css="a._2rpwqI")
 public WebElement linkSelectFirstSmartPhone;
 
 public void navigateToSmartPhoneHomePage() throws AWTException {
	 
//	ResuableFunctions.waitForElementToBeDisplayed(linkamzonGlobalNavigation);
	// ResuableFunctions.veryShortPause();
	 ResuableFunctions.waitForElementToBeDisplayed(closeWindowModal);
	 ResuableFunctions.click(closeWindowModal);
	 ResuableFunctions.waitForElementToBeDisplayed(mobileLink);
	 ResuableFunctions.click(mobileLink);
	 ResuableFunctions.veryShortPause();
	 //ResuableFunctions.verylongPause();
		/*
		 * try { Thread.sleep(15000); } catch (InterruptedException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
	 
	 Actions builder=new Actions(driver);
	 org.openqa.selenium.Point coordinate=linkFlipkartGlobalNavigation.getLocation();
	 Robot robot=new Robot();
	 builder.moveToElement(linkFlipkartGlobalNavigation, 5,5).build().perform();
	 builder.moveByOffset(1, 1).build().perform();
	 robot.mouseMove(coordinate.getX()+8,coordinate.getY()+60);
	 ResuableFunctions.waitForElementToBeDisplayed(linkFlipkartGlobalNavigation);
//	 Actions action=new Actions(driver);
	// ResuableFunctions.hoverelementViaAction(linkamzonGlobalNavigation);
	 builder.clickAndHold(linkFlipkartGlobalNavigation).build().perform();;
	// ResuableFunctions.click(linkamzonGlobalNavigation);
	 ResuableFunctions.veryShortPause();
	 //ResuableFunctions.hoverelementViaAction(linkTvApplince);
	 
	// ResuableFunctions.veryShortPause();
	 ResuableFunctions.waitForElementToBeDisplayed(linkSamrtPhone);
	 ResuableFunctions.click(linkSamrtPhone);
	 ResuableFunctions.veryShortPause();
	 ResuableFunctions.waitForElementToBeDisplayed(linkSelectFirstSmartPhone);
	 ResuableFunctions.click(linkSelectFirstSmartPhone);
	 
 }
}
