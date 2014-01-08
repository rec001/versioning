Feature: PW-262 Recreate Settings Tab Functionality on The User Profile Page
Allow registered users to manage their profile
as registered user
I want to be able to change my personal details and manage my subscription

  @javascript @insulated @262
  Scenario: Change all values in profile
    Then I log on as "profiletester"
    Then I click "profiletester"
    And I click on the element with xpath "//*[@id='tasks']/ul/li[2]/a"
    And I fill in "About Me" with "coder bio here"
    And I fill in "First Name" with "profilefirst"
    And I fill in "Last Name" with "profilelast"
    Then I fill in "edit-field-user-twitter-url-und-0-url" with "@newuser"
    Then I fill in "edit-field-user-linkedin-url-und-0-url" with "www.linkedin.com/profile/view?id=84033"
    Then I fill in "edit-field-user-google-url-und-0-url" with "https://plus.google.com/u/0/123"
    Then I fill in "edit-field-user-facebook-url-und-0-url" with "http://www.facebook.com/testuser"
    And I press button "Save"
    And I should see "The changes have been saved"
    Then I should see "profilefirst"
    Then I should see "profilelast"
    Then I should see "coder bio here"


  @javascript @insulated @262
  Scenario: edit watch list
    Then I log on as "profiletester"
    Then I click "profiletester"
    Then I should see "Test api for task 236"
    Then I click "Untrack"
    Given I am on "/profile/profiletester"
    Then I should not see "Test api for task 236"
    Given I am on "/api/test-api-task-236"
    Then I click "Track this API"
    Given I am on "/profile/profiletester"
    Then I should see "Test api for task 236"
