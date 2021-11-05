Feature: Mobile Scenario Testing

@mobile
Scenario Outline: Mobile Home Page is displayed
Then Google search textbox "<SearchValue>" is displayed in mobile 
And Click on image on home page in mobile
Examples:
|SearchValue|
|Google|

