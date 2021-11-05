Feature: Scenarios to test Home Page

Background:
Given I open Home Page

@ui @homePage
Scenario: Home Page is displayed
Then Google search textbox is displayed
And Click on image on home page



@ui @homePageWithExample
Scenario Outline: Home Page is displayed and search values
Then Google search textbox is displayed with table
|userName|password|country|capital|
|<userName>|<password>|<userName>|<userName>|
And Click on image on home page
Examples:
|userName|password|country|capital|
|admin|admin|India|New Delhi|



@ui @tableList 
Scenario:Accessing table data as list in cucumber
Given I am able to access data from table as list
|India|New Delhi|
|China|Beijing|

@ui @tableMap
Scenario:Accessing table data as map in cucumber
Given I am able to access data from table as map
|Country|India|
|Capital|New Delhi|

@ui @tablePojoClass
Scenario:Accessing table data as pojoClass in cucumber
Given I am able to access data from table as pojoClass fields
|userName|password|country|capital|
|admin|admin|India|New Delhi|


@ui @tableExcel
Scenario:Accessing table data from Excel in cucumber
Given I am able to access data from Excel as List




