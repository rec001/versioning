Feature: PW-145 Update Eventlog on API Submission
  Whenever a new API is created in the system, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while creating an API.


  @javascript @insulated @145
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/api"
    When I fill in "API Name" with "test api2"
    When I fill in "API Provider" with "test provider"
    Then I fill in "edit-field-api-home-page-und-0-url" with "http://www.google.com"
    When I fill in "API Endpoint" with "test endpoint"
    And I select "API Overviews" from "Primary category"
    And I select "Adobe" from "Secondary Categories"
    And I fill in "API Description" with "test api desc"
    Then I fill in "Related to?" with "text here!"
    Then I fill in "Other options" with "other options here"
    Then I press button "edit-submit"
    Then I should be redirected to "/api/test-api2"
    Then I should see "created"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "submitted API"
    Then I should see "test api2"
    Given I am on "/api/test-api2"
    Then I click "Edit"
    And I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"

