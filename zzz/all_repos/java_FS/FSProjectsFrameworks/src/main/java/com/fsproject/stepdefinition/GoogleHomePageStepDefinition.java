package com.fsproject.stepdefinition;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.interactions.Actions;

import com.fsproject.baseClass.BaseClass;
import com.fsproject.pages.GoogleHomePage;
import com.fsproject.util.DataTableReader;
import com.fsproject.util.PojoClass;
import com.fsproject.util.ReadData;

import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.Transform;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import junit.framework.Assert;

public class GoogleHomePageStepDefinition {
WebDriver driver=BaseClass.driver;
private static String env = System.getProperty("env").toUpperCase();
GoogleHomePage homeObj=new GoogleHomePage(driver);
private Map<String,String>countryValue;





@Given("^I am able to access data from table as list$")
public void i_am_able_to_access_data_from_table_as_list(DataTable user) throws Throwable {
    // Write code here that turns the phrase above into concrete actions
   
    List<List<String>>userName=user.raw();
    System.out.println(userName.get(0).get(0));
   
}

@Given("^I am able to access data from table as map$")
public void i_am_able_to_access_data_from_table_as_map(DataTable table) throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	Map<String,String>hMap=table.asMap(String.class, String.class);
	System.out.println(hMap.get("Country"));
	System.out.println(hMap.get("Capital"));
	
    
}

@Given("^I am able to access data from table as pojoClass fields$")
public void i_am_able_to_access_data_from_table_as_pojoClass_fields(DataTable table) throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	List<PojoClass>pojoFields= table.asList(PojoClass.class);
	 for(PojoClass pojo:pojoFields) { // this.countryValue=countryValue;
		  //List<HashMap<String,String>>userName=user.raw();
		 System.out.println(pojo.getUserName()); System.out.println(pojo.getPassword());
		  System.out.println(pojo.getCountry()); System.out.println(pojo.getCapital());
		  
	 } 
	 System.out.println(ReadData.readDataFromPropertyFile("url", env));
	 homeObj.verifyHomePageIsDisplayed();
   
}

@Given("^I am able to access data from Excel as List$")
public void i_am_able_to_access_data_from_Excel_as_List(@Transform(DataTableReader.class)DataTable table) throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	System.out.println(table.toString());
    
}



@Given("^I open Home Page$")
public void i_open_Home_Page() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	//List<List<String>>userName=user.raw();
//	this.countryValue=countryValue;
	//List<HashMap<String,String>>userName=user.raw();
	//System.out.println(countryValue.get("country"));
    System.out.println("it is home page");
    driver.get("https://www.google.com");
    
  
  //  Assert.assertTrue(homeObj.googleSearch.isDisplayed());
 //   homeObj.image.click();
}


@Given("^I open Home Page \"([^\"]*)\"$")
public void i_open_Home_Page_at(@Transform(DataTableReader.class)DataTable table) throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	/*List<List<String>>userName=user.raw();
	this.countryValue=countryValue;
	//List<HashMap<String,String>>userName=user.raw();
	System.out.println(userName.get(0).get(0));*/
	System.out.println(table.toString());
	List<String>datalist=table.asList(String.class);
	for(String str:datalist) {
		System.out.println(str);
	}
	for(Map<String,String>userName:table.asMaps(String.class, String.class)) {
	this.countryValue=userName ;
	//List<HashMap<String,String>>userName=user.raw();
	System.out.println(userName.get("Country"));
	System.out.println(userName.get("Capital"));
	}
    System.out.println("it is home page");
    driver.get("https://www.google.com");
	
    
  
  //  Assert.assertTrue(homeObj.googleSearch.isDisplayed());
 //   homeObj.image.click();
}

	
@Then("^Google search textbox is displayed with table$")
public void Google_search_textbox_is_displayed(List<PojoClass> tab) throws Throwable {
    // Write code here that turns the phrase above into concrete actions
  //  System.out.println("it is home page");
	
	
	System.out.println(tab.get(0).getUserName());
    Assert.assertTrue(homeObj.googleSearch.isDisplayed());
    //homeObj.image.click();
}
@Then("^Google search textbox is displayed$")
public void Google_search_textbox_is_displayed() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
  //  System.out.println("it is home page");
	//System.out.println(searchValue);
    Assert.assertTrue(homeObj.googleSearch.isDisplayed());
    //homeObj.image.click();
}
@Then("^Click on image on home page$")
public void Click_on_image_on_home_page() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
  //  System.out.println("it is home page");
  //  Assert.assertTrue(homeObj.googleSearch.isDisplayed());
    //homeObj.image.click();
	Actions act=new Actions(driver);
   // act.keyDown(homeObj.googleImage,Keys.CONTROL).click(homeObj.googleImage).keyUp(homeObj.googleImage,Keys.CONTROL);
    homeObj.googleImage.click();
    
}

}
