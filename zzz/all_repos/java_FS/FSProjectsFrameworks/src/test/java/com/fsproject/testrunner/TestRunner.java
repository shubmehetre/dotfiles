package com.fsproject.testrunner;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.cucumber.listener.ExtentCucumberFormatter;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features="src/test/java/com/fsproject/cucumberFeatureFile",
				glue={"com.fsproject.stepdefinition",
						"com.fsproject.stepdefinitionapi",
						"com.fsproject.stepdefintionMobile",
						"com.fsproject.pages",
        				"com.fsproject.baseClass"},
        				plugin = {"com.cucumber.listener.ExtentCucumberFormatter"},
        				tags= {"@flipkart"})

public class TestRunner 
{
	@BeforeClass
    public static void setup() 
	{
        ExtentCucumberFormatter.initiateExtentCucumberFormatter();
        ExtentCucumberFormatter.loadConfig(new File("resources/extent-config.xml"));

        ExtentCucumberFormatter.addSystemInfo("Browser Name", "name_Browser");
        ExtentCucumberFormatter.addSystemInfo("Browser version", "version");
        ExtentCucumberFormatter.addSystemInfo("Selenium version", "v3.0.1"
        		+ "");

        Map systemInfo = new HashMap(); systemInfo.put("Cucumber version", "v1.2.4");
		systemInfo.put("Extent Cucumber Reporter version", "v1.1.0");
		ExtentCucumberFormatter.addSystemInfo(systemInfo);
		 
    }

}
