Feature: PW-152 Create "Mashup Submitted" Entry
  Whenever a new mashup is submitted into the system, a new entry is inserted into event log:
  As a website admin
  I need to check eventlog entry when an authenticated user or anonymous user submitted a mashup.


  @javascript @insulated @152
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content8"
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
    Given I am on "/eventlog"
    Then I should see "test mashup content8"
    Then I should see "Mashup submitted"
    Given I am on "mashup/test-mashup-content8"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
