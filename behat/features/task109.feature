Feature: PW-109 Recreate Mashup RSS Feed and URL
  As a website user
  I need to see if it creates rss feed for newly created news posts

  @javascript @insulated @109
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content4"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I select "Backend" from "Primary Category"
    When I fill in "edit-body-und-0-value" with "test content"
    And I attach the file "download.png" to "edit-field-mashup-image-und-0-upload"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "mashup/test-mashup-content4"
    Then I click "Workflow"
    Then I check "edit-workflow-18"
    Then I press button "edit-submit"
    Then I check "edit-workflow-19"
    Then I press button "edit-submit"
    Given I am on "/rss_mashup"
    Then I should see "test mashup content4"
    Given I am on "mashup/test-mashup-content4"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
