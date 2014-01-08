Feature: PW-503 Follower notified when a comment is left on a how-to/source
  As a website admin
  I need to see if it creates an entry when a new comment is added in how-to/source node

  @javascript @insulated @503
  Scenario: create eventlog entry
    Then I log on as "nijotest"
    And I am on "/link/net-twilio-libraries/comments"
    Then I fill in "edit-subject" with "test subject"
    Then I fill in "edit-comment-body-und-0-value" with "test comment"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "/eventlog"
    And I should see "Posted comment"
    And I should see "link/net-twilio-libraries"
    And I am on "/link/net-twilio-libraries/comments"
    And I click "delete"
    Then I press button "edit-submit"
    And I should see "deleted"
