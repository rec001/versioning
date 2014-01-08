Feature: PW-444 Rebuild view of Event Log
  Allow admin to see all eventlog records in one page


  @javascript @insulated @444
  Scenario: Access eventlog page
    When I log on as "admin"
    Given I am on "/eventlog"
    When I fill in "edit-message" with "user logged"
    And I wait for "2" secs
    Then I click on the text "user logged in admin"
    Then I press button "edit-submit-eventlog"
    Then I should see "user logged in admin"