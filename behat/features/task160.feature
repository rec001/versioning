Feature: PW-160 Create "Mashup Updated" Entry
  Whenever a new mashup is updated in the system, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while updating a mashup.

  @javascript @insulated @160
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content6"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I wait for "2" secs
    Then I click on the text "Flickr"
    And I select "Backend" from "Primary Category"
    When I fill in "edit-body-und-0-value" with "test content"
    And I attach the file "download.png" to "edit-field-mashup-image-und-0-upload"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "mashup/test-mashup-content6"
    Then I click "Workflow"
    Then I check "edit-workflow-18"
    Then I press button "edit-submit"
    Then I check "edit-workflow-19"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "mashup/test-mashup-content6"
    Then I click "Edit"
    When I fill in "edit-body-und-0-value" with "test content new"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "Mashup Updated"
    Then I should see "test mashup content6"
    Given I am on "mashup/test-mashup-content6"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"

