package com.fsproject.util;

import static io.restassured.RestAssured.when;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.event.KeyEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.Wait;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.fsproject.baseClass.BaseClass;

import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;


public class ResuableFunctions
{
	BaseClass BaseClass=new BaseClass();
	WebDriver driver=BaseClass.driver;
	WebDriverWait wait=new WebDriverWait(driver,1000);

	
	/* Function Name:-refreshPage()
	   Summary :-this function will refreshes the current web page
	   Parameter:-None
	*/
	public void refreshPage()
	{
		driver.navigate().refresh();
	}

	/* Function Name:-navigateBack()
	 this function will perform move back a single "item" in the web browser's history
	  Parameter:-None
	*/
	public void navigateBack()
	{
		driver.navigate().back();
	}
	/* Function Name:-navigateForward()
	 this function will perform move a single "item" forward in the web browser's history
	 Parameter:-None
	*/
	public void navigateForward()
	{
		driver.navigate().forward();
	}

	/* Function Name:-closeWindow()
	 this function will close the working window
	 Parameter:-None
	*/
	public void closeWindow()
	{
		driver.close();
	}
	

	/* Function Name:-SelectElementFromListByIndexPosition
	  summary:-this function is to used to select the particular element using index vale from the list
	 <param element="webElement">list of web-elements</param>
	 <param elementIndex="elementToSelect">index of the element on which we have perform click</param>
	 */
	public void SelectElementFromListByIndexPosition(List<WebElement> element, int elementIndex)
	{
		element.get(elementIndex).click();
	}

	/*Function Name:-selectElementFromListByString
	  summary:-This method will select a particular element from a list.
	 <param list="listOfWebElement">consist set of webElement returned by locator</param>
	 <param elementName="nameOFElement">name of element to be selected</param>*/
	public void selectElementFromListByString(List<WebElement> list, String elementName) {        
		for (WebElement webElement : list) {
			if(getTextField(webElement).equals(elementName)){
				webElement.click();
				break;
			}	
		}
	}

	/*Function Name:-searchElementFromListByString
	 This method will search a particular element from a list.
    Parameter:- <param list="listOfWebElement">consist set of webElement returned by locator</param>
	 <param elementName="nameOFElement">name of element to be selected</param>*/
	public boolean searchElementFromListByString(List<WebElement> list, String elementName) {        
		for (WebElement webElement : list) {
			if(getTextField(webElement).equals(elementName)){
				System.out.println(webElement.getText());
				break;
			}	
		}
		return true;
	}

	/*Function Name:-setTextField
	  summary:- this function set a value to text field
	Parameter:-<param element="webElement">text field on which we have to set the text</param>*/
	public void setTextField(WebElement element, String value) throws Exception {
		waitForElementToBeDisplayed(element);	
		waitForElementTobeClickable(element);
		element.clear();		
		element.sendKeys(value);
		waitForSec();
	}
	
	public void waitForSec() throws Exception
	{
		Thread.sleep(1000);
	}

	/*Function:-getTextField
 	summary:-this function get text value from field
	Parameter:-<param element="webElement">text field on which we have to get the text</param>*/
	public String getTextField(WebElement element)	{	
		waitForElementToBeDisplayed(element);		
		return element.getText();
	}

	/*Function:-getAttribute
	 summary:-this function get the attribute name of the element
     Parameter:- <param element="webElement">element field on which we have to get the attribute name</param>*/
	public String getAttribute(WebElement element,String attributeName){
		waitForElementToBeDisplayed(element);
		return element.getAttribute(attributeName);		
	}

	/*Function:-getColour
	 this function get the color attribute name of the element
	 </summary>
	Parameter:-<param element="webElement">element field whose color we have to get</param>*/
	public String getColour(WebElement element){
		waitForElementToBeDisplayed(element);
		return element.getCssValue("color");
	}

	/*Function:-getFontType
	 this function get the font of the element
	 Parameter:-<param element="webElement">element field whose font we have to get</param>*/
	public String getFontType(WebElement element){
		waitForElementToBeDisplayed(element);
		return element.getCssValue("font-weight");
	}


	/*Function:-getBackgroundColor
	 summary:-this function get the background color of the element
	 Parameter:-<param element="webElement">element field whose font we have to get</param>*/
	public String getBackgroundColor(WebElement element){
		waitForElementToBeDisplayed(element);
		return element.getCssValue("background-color");
	}

	/*Function:-getAlertText
 	summary:-this function return the text of alert 
	Parameter:-<param alert="typeOfAlert">alert</param>*/
	public String getAlertText(Alert alert){		
		return alert.getText();
	}


	/*Function Name:-clickelementViaAction
	Summary:- this function perform a click using action class
	
	Parameters:-<param element="webElement">webElement on which we have to perform click</param>*/
	public void clickelementViaAction(WebElement element)
	{		
		Actions clicker = new Actions(driver);
		clicker.moveToElement(element).perform();
		clicker.click().perform();
	}
	
	
	/*Function:-hoverelementViaAction
	 Summary:-this function hover on element using action class
	Parameter:-<param element="webElement">webElement on which we have to perform click</param>*/
	public void hoverelementViaAction(WebElement element)
	{		
		Actions hover = new Actions(driver);
		hover.moveToElement(element).click(element).build().perform();
	}

	/*Function:-GetButtonText
	 Summary:-this function return the text of button
	Parameter:-<param element="button">webElement of button</param>*/
	public String GetButtonText(By by)
	{
		WebElement element = driver.findElement(by);
		return element.getAttribute("value");
	}

	/*Function longPause
	Summary:-sometime selenium waits are not sufficient enough in that we will use hard wait.
	Parameter:-None*/
	public void longPause() 
	{
		try{
			Thread.sleep(10000);
		}catch(InterruptedException e){

		}
	}


	/*Function pauseForTime
	Summary:-sometime selenium waits are not sufficient enough in that we will use hard wait.
	Parameter:-None*/
	public void pauseForTime(long timeInMilliSec){
		try {
			Thread.sleep(timeInMilliSec);
		} catch (InterruptedException e) {			

		}
	}

	/*Function shortPause
	Summary:-sometime selenium waits are not sufficient enough in that we will use hard wait.
	Parameter:-None*/
	public void shortPause() 
	{
		try{
			Thread.sleep(1000);
		}catch(InterruptedException e){

		}
	}

	/*Function veryShortPause
	Summary:-sometime selenium waits are not sufficient enough in that we will use hard wait.
	Parameter:-None*/
	public void veryShortPause() 
	{
		try{
			Thread.sleep(3000);
		}catch(InterruptedException e){

		}
	}

	/// <summary>
	/// this function will verify if text present is read only
	/// </summary>
	public boolean verifyReadOnlyText(WebElement ele) {
		boolean flag=false;
		waitForElementToBeDisplayed(ele);
		String tempText=getTextField(ele);
		try{
			ele.sendKeys("...");
		}catch(WebDriverException ex){

		}
		if(tempText.equals(getTextField(ele))){
			flag=true;
		}
		else{
			flag=false;
		}
		return flag;
	}

	/*Function click()
	 Summary:-this function will wait for an element to become clickable and then click it
	 Parameter:element*/
	public void click(WebElement element) 
	{		
		//waitForElementTobeClickable(element);
		element.click();
	}

	/*Function:waitAndClick
	 Summary:-this function will wait for an element to become clickable and then click it
	Parameters:element1 and element2*/
	public void waitAndClick(By element1, WebElement element2) 
	{		
		waitForElementToBeInvisible(element1);
		element2.click();
	}
	

	/*Function:-uploadFile
	  Summary:- this function will upload the file.
 	<param fileToBeUploaded="fileName">file to be uploaded from resources folder</param>*/
	public void uploadFile(String fileToBeUploaded) throws AWTException
	{
		Robot robot = new Robot();
		robot.keyPress(KeyEvent.VK_ENTER);
		System.out.println("Printing name of file to verify correct file has been picked: " +fileToBeUploaded);
		Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
		StringSelection stringSelection = new StringSelection(fileToBeUploaded);
		System.out.println(stringSelection);
		clipboard.setContents(stringSelection, null);
		System.out.println(clipboard.getContents(stringSelection));
		robot.keyPress(KeyEvent.VK_CONTROL);
		robot.keyPress(KeyEvent.VK_V);
		robot.keyRelease(KeyEvent.VK_V);
		robot.keyRelease(KeyEvent.VK_CONTROL);
		robot.keyPress(KeyEvent.VK_ENTER);
		robot.keyRelease(KeyEvent.VK_ENTER);
	} 


	/*Function:doubleClick()
	  summary:-this function will perform double click on web-element.
	  Parameter:-<param webelement="elementOnWhichAction">list of web-elements from which we have to select the option</param>*/
	public void doubleClick(WebElement element)
	{
		Actions action = new Actions(driver).doubleClick(element);
		action.build().perform();
	}

	/*Function:-selectFromDropDownList
	 summary:this function will perform selecting element from dropdown list.
	 Parameters:-WebElement from element and byVisibleText*/
	public void selectFromDropDownList(WebElement element, String byVisibleText)
	{
		Select select = new Select(element);
		select.selectByVisibleText(byVisibleText);
	}

	/*Function:-getSelectedElementFromDropDownList
	 summary:-this function will perform selecting element from dropdown list.
	 Parameter:-WEbElement
	 */
	public String getSelectedElementFromDropDownList(WebElement element)
	{
		Select select = new Select(element);
		String selectedValue = select.getFirstSelectedOption().getText();
		return selectedValue;
	}

	/*Function:-selectFromDropDownListByIndex
	 summary:-this function will perform selecting element from dropdown list by index
	Parameter:-Webelemt and indexValues*/	
	public void selectFromDropDownListByIndex(WebElement element, int indexValue)
	{
		Select select = new Select(element);
		select.selectByIndex(indexValue);
	}

	
	/*Function:-clickUsingJavaScript
	 this function will perform click on web-element using java script.
	Parameter:-<param webelement="elementOnWhichAction">list of web-elements from which we have to select the option</param>*/
	
	public void clickUsingJavaScript(WebElement elementToCLick)
	{
		
		JavascriptExecutor executor = (JavascriptExecutor)driver;
		executor.executeScript("arguments[0].click();", elementToCLick);
	}

	/*Function:-clickUsingJavaScript
	Summary:-this function will return true if element is visible or displayed else retrun false
	Parameter:-WebElement element name
	*/
	public boolean isElementVisible(WebElement element) {
		try 
		{
			element.isDisplayed();
			System.out.println("Element is located");
			return true;
		} 
		catch (NoSuchElementException msg) 
		{
			System.out.println("Element is not visible");
			return false;
		}
	}

	/*Function:-checkElementVisible
	 this function will return true if element is visible or displayed else retrun false
	 Parameter:-WebElement element name
	*/
	public void checkElementVisible(WebElement element) 
	{
		element.isDisplayed();
		System.out.println(element + ": Is successfully located");
	}
	
	public void waitForLoaderToInvisible(By locator, int time) throws InterruptedException
	{
		for(int i=0;i<=time;i++)
		{
		Boolean flag=driver.findElements(locator).size()>0;
		if(flag)
		{
			System.out.println("Loader status:-" +flag);
			Thread.sleep(1000);
			
		}
		
		else
		{
			System.out.println("Loader status:-" +flag);
			break;
		}
		
		}
	}
	
	public void scrollDownByPixel(int pixel)
	{
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("scroll(0, "+pixel+")");
	}
	
	/*
	 * Wait<WebDriver> fluentWait = new FluentWait<WebDriver>(driver)
	 * .withTimeout(60, TimeUnit.SECONDS) .pollingEvery(3, TimeUnit.SECONDS)
	 * .ignoring(NoSuchElementException.class);
	 */

	//***********************************************************************************************************************************************//
	//********************************************** Common wait methods those cab be accessed from any class ********************************************//
	//***********************************************************************************************************************************************//

	public void waitForElementToBeDisplayed(WebElement element){
		wait.until(ExpectedConditions.visibilityOf(element));
	}


	public void waitForElementTobeClickable(WebElement element){
		wait.until(ExpectedConditions.elementToBeClickable(element));
		
	}	

	public void waitForElementsToBeDisplayed(List<WebElement> elements){
		wait.until(ExpectedConditions.visibilityOfAllElements(elements));
	}

	public void waitForElementToBeInvisible(By elementLocator){
		wait.until(ExpectedConditions.invisibilityOfElementLocated(elementLocator));
	}

	public void waitForTextToBeInvisible(By locator,String text){
		wait.until(ExpectedConditions.invisibilityOfElementWithText(locator, text));
	}
	
	public void waitForTitleToGetDisplayed(String title){
		wait.until(ExpectedConditions.titleContains(title));
	}
	
	/** 
	 * this function will wait for page load to complete
	  */
	public void waitForLoad(WebDriver driver) {
        ExpectedCondition<Boolean> pageLoadCondition = new
                ExpectedCondition<Boolean>() {
                    public Boolean apply(WebDriver driver) {
                        return ((JavascriptExecutor)driver).executeScript("return document.readyState").equals("complete");
                    }
                };
        WebDriverWait wait1 = new WebDriverWait(driver, 30);
      
        wait.until(pageLoadCondition);
    }
	

	
}
