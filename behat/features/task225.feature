Feature: PW-225 Recreate "Profile Updated" Entry
  Whenever someone updates the user profile, make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone updates their profile

  @javascript @insulated @225
  Scenario: Login
    Then I log on as "vishaltest"
    Then I click "vishaltest"
    And I click on the element with xpath "//*[@id='tasks']/ul/li[2]/a"
    And I fill in "About Me" with "vishal bio here"
    And I press button "Save"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "vishaltest"
    Then I should see "updated profile"
