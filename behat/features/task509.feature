Feature: PW-509 Framework/Library follower is notified when a comment is left on that framework/library
  As a website admin
  I need to see if it creates an entry when a new comment is added in framework/library

  @javascript @insulated @509
  Scenario: create eventlog entry
    Then I log on as "nijotest"
    And I am on "/resource/dribbble-client-library-actionscript/comments"
    Then I fill in "edit-comment-body-und-0-value" with "test comment"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "/eventlog"
    And I should see "Posted comment"
    And I should see "resource/dribbble-client-library-actionscript"
    And I am on "/resource/dribbble-client-library-actionscript/comments"
    And I click "delete"
    Then I press button "edit-submit"
    And I should see "deleted"
