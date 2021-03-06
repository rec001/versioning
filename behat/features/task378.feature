Feature: PW-378 API update Email confirmation to API owner
If an owner updates his API, a confirmation message goes to his email address.
I need to check if the owner receives an email after updating his API.


  @javascript @insulated @378
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/api"
    When I fill in "API Name" with "test api3"
    When I fill in "API Provider" with "test provider"
    Then I fill in "edit-field-api-home-page-und-0-url" with "http://www.google.com"
    When I fill in "API Endpoint" with "test endpoint"
    And I select "API Overviews" from "Primary category"
    And I fill in "API Description" with "test api desc"
    Then I press button "edit-submit"
    Then I should be redirected to "/api/test-api3"
    Then I should see "created"
    Then I click "Logout"
    Then I log on as "manager"
    Given I am on "/api/test-api3"
    And I click "Edit"
    Then I check "edit-workflow-12"
    When I fill in "Actual API Provider" with "Accenture"
    When I fill in "Changelog" with "changed to pending"
    Then I press button "edit-submit"
    Then I press button "edit-submit"
    Given I am on "/api/test-api3"
    And I click "Edit"
    Then I check "edit-workflow-13"
    When I fill in "Changelog" with "draft"
    Then I press button "edit-submit"
    Given I am on "/api/test-api3"
    And I click "Edit"
    Then I check "edit-workflow-14"
    When I fill in "Changelog" with "approved"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "/api/test-api3"
    And I click "Edit"
    And I fill in "API Description" with "new test api desc"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    Then I click "Reports"
    And I click "Recent log messages"
    Then I should see "Successfully sent email to xxvishal.khialani@gmail.comzz"
    Given I am on "/api/test-api3"
    And I click "Edit"
    And I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
