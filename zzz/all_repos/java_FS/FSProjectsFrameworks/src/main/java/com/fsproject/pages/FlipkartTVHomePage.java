package com.fsproject.pages;

import java.util.List;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.util.ReadData;
import com.fsproject.util.ResuableFunctions;

import junit.framework.Assert;



public class FlipkartTVHomePage {
WebDriver driver=BaseClass.driver;
private static String env = System.getProperty("env").toUpperCase();
ResuableFunctions ResuableFunctions=new ResuableFunctions();
 public FlipkartTVHomePage(WebDriver driver){
	 PageFactory.initElements(driver, this);
	 
 }
 @FindBy(xpath="//button[text()='ADD TO CART']")
 public WebElement buttonAddtoCart;

 @FindBy(css="a[href*='viewcart']>div]")
 public WebElement buttonCartCount;
 
 public void addProductFromCartPage() {
	 Set<String>windows=driver.getWindowHandles();
	 System.out.println(windows.size());
	 for(String window:windows) {
		 driver.switchTo().window(window);
		 if(driver.getTitle().contains("Samsung Galaxy")){
			
			 break;
		 }
		
		
	 }
	 ResuableFunctions.shortPause();
	// ResuableFunctions.waitForElementToBeDisplayed(buttonAddtoCart);
	 //ResuableFunctions ResuableFunctions=new ResuableFunctions(driver);
	// driver.findElement(By.cssSelector("div[class='_1k1QCg _3QNwd7']>ul>li")).click();
	 ResuableFunctions.waitForElementToBeDisplayed(buttonAddtoCart);
	 ResuableFunctions.hoverelementViaAction(buttonAddtoCart);
	// ResuableFunctions.veryShortPause();
//	 ResuableFunctions.click(buttonAddtoCart);
	 
 }
 public void navigateProductDetailsPage() {
	// ResuableFunctions.shortPause();
	// ResuableFunctions.waitForElementToBeDisplayed(buttonCartCount);
	 //Assert.assertTrue(Integer.parseInt(buttonCartCount.getText())==1);
	// ResuableFunctions.click(buttonCartCount);
	 ResuableFunctions.veryShortPause();
	 
 }
}
