package com.fsproject.stepdefinitionapi;

import static io.restassured.RestAssured.given;

import static io.restassured.specification.ProxySpecification.auth;
import static io.restassured.specification.ProxySpecification.host;



import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.response.ResponseBodyData;

public class ApiTest {
	private String access_Token = "aaa1a1346e49c73fd0a189f604ea04a9e4b1ee4b044102048ce3ff0ce48d";
	private String client_ID = "b932dc1dbb789fe275ea";
	private String APIUrl = "https://a.wunderlist.com/api/v1";
@Given("^Ouath login is succesfull$")
public void ouath_login_is_succesfull() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	given().proxy(host("proxy.tcs.com").withPort(8080)).auth().oauth2(access_Token).headers("X-Access-Token",access_Token, "X-Client-ID",client_ID).when().get(APIUrl + "/user").then().statusCode(200);
	
	Response response=given().proxy(host("proxy.tcs.com").withPort(8080)).auth().oauth2(access_Token).headers("X-Access-Token",access_Token, "X-Client-ID",client_ID).when().get(APIUrl + "/user");
	
	System.out.println(response.asString());
	JsonPath jsonPath=response.jsonPath();
	System.out.println(jsonPath.get("id").toString());
}

@Then("^Verify JSON Test for API$")
public void verify_JSON_Test_for_API() throws Throwable {
    // Write code here that turns the phrase above into concrete actions
	io.restassured.response.Response response=given().proxy(host("proxy.tcs.com").withPort(8080)).when().get("http://ip.jsontest.com/");
    System.out.println(response.asString());
  
}
	
}
