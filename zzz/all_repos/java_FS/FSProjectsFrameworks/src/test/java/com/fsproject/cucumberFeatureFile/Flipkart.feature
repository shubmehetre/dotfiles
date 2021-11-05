Feature: Scenarios to test Home Page

@ui @flipkart
Scenario Outline:Flipkart product buying E2E
Given I run injecting script with "<FileName>" file
And I am on Products Home Page
When I add some Product
Then Select My Cart and Proceed to checkout
  Examples:
    |FileName|
    |InjectedFile|

