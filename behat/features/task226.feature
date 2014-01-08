Feature: PW-226 Include "Updated Profile" In the Alert Queue
  Whenever user updates his profile, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog, whenever someone updates his account

  @javascript @insulated @226
  Scenario: Login
    Then I log on as "vishaltest"
    And I click "Settings"
    Then I fill in "edit-field-user-url-und-0-url" with "http://www.mywebsite.com"
    Then I press button "edit-submit"
    Then I should see "The changes have been saved"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "vishaltest"
    Then I should see "updated profile"

