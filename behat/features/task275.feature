Feature: PW-275 - API Profile Page / Followers Tab
If any user views the API Followers tab
As any user
I need to check whether related Followers is listed

  @javascript @insulated @275
  Scenario: Fields displayed on the API Followers tab
    Given I am on "/"
    Then I log on as "manager"
    Given I am on "api/testapipwstaff271"
    And I click on the element with xpath ".//*[@id='api-content']/div[1]/div[1]/div/span/a"
    Given I am on "api/testapipwstaff271/followers"
    Then I should see "manager"