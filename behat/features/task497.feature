Feature: PW-497 Follower Alerted When Any User Leave A Comment On A Mashup They're Following
  As a website admin
  I need to see if it creates an entry when a new comment is added in mashup

  @javascript @insulated @497
  Scenario: create eventlog entry
    Then I log on as "nijotest"
    And I am on "/mashup/test-mashup-task-158/comments"
    Then I fill in "edit-comment-body-und-0-value" with "test comment"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "/eventlog"
    And I should see "Posted comment"
    And I should see "mashup/test-mashup-task-158"
    And I am on "/mashup/test-mashup-task-158/comments"
    And I click "delete"
    Then I press button "edit-submit"
    And I should see "deleted"
