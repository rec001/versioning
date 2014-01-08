Feature: PW-507 Follower alerted when non-trivial update is made to framework/library
  As a website admin
  I need to see if it creates an entry when user updates existing framework/library

  @javascript @insulated @507
  Scenario: create eventlog entry
    Then I log on as "pwstaff1"
    And I am on "/resource/test-framework-testing"
    Then I click "Edit"
    Then I fill in "Changelog" with "test updation"
    Then I press button "edit-submit"
    Then I should see "Updated"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "/eventlog"
    And I should see "Updated Framework/Library"
