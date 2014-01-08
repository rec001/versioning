Feature: PW-236 Email Alert To API Users on API Change
I need to check if any existing API is changed, it should send an email for all users who tracks the API.


  @javascript @insulated @236
  Scenario: Login
    Then I log on as "manager"
    Given I am on "/api/test-api-task-236"
    And I click "Edit"
    And I fill in "API Description" with "new test api desc"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    Then I click "Reports"
    And I click "Recent log messages"
    Then I should see "Successfully sent email to xxvishal.khialani@gmail.comzz"

