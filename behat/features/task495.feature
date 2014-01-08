Feature: PW-495 Alert Follower When Comment is Left On API S/he Is Following
  As a website admin
  I need to see if it creates an entry when a new comment is added in api

  @javascript @insulated @495
  Scenario: create eventlog entry
    Then I log on as "nijotest"
    And I am on "/api/test-api-task-236"
    Then I fill in "edit-comment-body-und-0-value" with "test comment"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "/eventlog"
    And I should see "Posted comment"
    And I should see "api/test-api-task-236"
    And I am on "/api/test-api-task-236"
    And I click "delete"
    Then I press button "edit-submit"
    And I should see "deleted"
