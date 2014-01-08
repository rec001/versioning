Feature: PW-501 Follower alerted when non-trivial update is made to How-To/Source
  As a website admin
  I need to see if it creates an entry when user updates existing how-to/source node

  @javascript @insulated @501
  Scenario: create eventlog entry
    Then I log on as "pwstaff1"
    And I am on "/link/test-how-to-testing"
    Then I click "Edit"
    Then I fill in "Changelog" with "test updation"
    Then I press button "edit-submit"
    Then I should see "Updated"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "/eventlog"
    And I should see "How-To/Source updated"
