Feature: PW-188 Include "Search Updated" In the Alert Queue
  As a website user
  I need to see if I get notification for new results on my tracked search terms

  @javascript @insulated @188
  Scenario: Create entry for new results of tracked search in API directory page
    Then I log on as "vishaltest"
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "test api"
    And I select "3d" from "edit-category"
    And I select "Atom" from "edit-data-format"
    And I press button "edit-submit"
    Then I should see "Track search"
    And I press button "Track search"
    Then I should see "Untrack search"
    Then I click "Untrack search"
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
    Given I am on "/api/test-api2"
    Then I click "Edit"
    When I fill in "Actual API Provider" with "Accenture"
    When I fill in "Changelog" with "testchangelog"
    Given I wait for "2" secs
    When I click on the element with css selector "#edit-workflow-12"
    Then I press button "Save"
    Then I click "Edit"
    When I click on the element with css selector "#edit-workflow-13"
    Then I press button "Save"
    Then I click "Edit"
    When I click on the element with css selector "#edit-workflow-14"
    Then I press button "Save"
    Then I run the cron to index new api
    Given I am on "/eventlog"
    Then I should see "Search updated"
    Given I am on "/api/test-api2"
    Then I click "Edit"
    And I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"


