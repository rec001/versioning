Feature: PW-82 Update Eventlog on API updation
  Whenever an API is updated in the system, a new entry is inserted into eventlog.
  As a website admin I need to see if it really creates an entry in eventlog while updating an API.

  @javascript @insulated @82
  Scenario: User should update an API with minor edit
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
    And I fill in "API Description" with "test api desc new"
    And I check "edit-field-api-minor-edit-und-1"
    When I fill in "Changelog" with "minor edit updation"
    When I fill in "Actual API Provider" with "Accenture"
    Then I press button "edit-submit"
    Then I press button "edit-submit"
    Then I should see "updated"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "updated api"
    Then I should see "1"
    Given I am on "/api/test-api3"
    And I click "Edit"
    And I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"


  @javascript @insulated @82
  Scenario: User should update an API without minor edit
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
    And I fill in "API Description" with "test api desc new"
    When I fill in "Changelog" with "without minor edit updation"
    When I fill in "Actual API Provider" with "Accenture"
    Then I press button "edit-submit"
    Then I press button "edit-submit"
    Then I should see "updated"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "updated api"
    Then I should see "5"
    Given I am on "/api/test-api3"
    And I click "Edit"
    And I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"