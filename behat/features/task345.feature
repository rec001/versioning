Feature: PW-345 Build Contest workflow
This is a single "web" page that reports on the status of recently entered Contests as they go through the workflow
As a registered user
I need to check node state for workflow.

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/login"
    When I fill in "Username" with "vishaltest"
    When I fill in "Password" with "sarla"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/node/add/contest"
    And I wait for the page to come
    When I fill in "Contest Name " with "test contest content"
    When I fill in "URL " with "http://www.example.com"
    And I select "Jan" from "edit-field-contest-dates-und-0-value-month"
    And I select "1" from "edit-field-contest-dates-und-0-value-day"
    And I select "2014" from "edit-field-contest-dates-und-0-value-year"
    And I select "Jan" from "edit-field-contest-dates-und-0-value2-month"
    And I select "31" from "edit-field-contest-dates-und-0-value2-day"
    And I select "2014" from "edit-field-contest-dates-und-0-value2-year"
    Then I click "wysiwyg-toggle-edit-body-und-0-value"
    When I fill in "edit-body-und-0-value" with "test content"
    When I fill in "edit-field-prize-list-und-0-value" with "test content"
    When I fill in "edit-field-total-estimated-us-value-o-und-0-value" with "test content"
    When I fill in "edit-field-contest-related-company-und-0-target-id" with "Twitter"
    And I wait for the options to come
    When I click on the text "Twitter"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I wait for the options to come
    When I click on the text "Flickr"
    Then I press button "edit-field-api-und-add-more"
    And I wait for the options to come
    When I fill in "edit-field-api-und-1-target-id" with "Eventful"
    And I wait for the options to come
    When I click on the text "Eventful"
    When I fill in "edit-field-event-und-0-target-id" with "testevent1"
    And I wait for the options to come
    When I click on the text "testevent1"
    And I select "Backend" from "Primary Category"
    And I select "Adobe" from "Secondary Category"
    When I fill in "edit-field-content-hashtag-und-0-value" with "test content"
    When I attach the file "/home/nijo/Downloads/download.jpg" to "edit-field-contest-image-und-0-upload"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "content/test-contest-content"
    Then I click "Logout"
    Given I am on "/user/login"
    And I wait for the page to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/contest-workflow"
    Then I should see "test contest content"
    Then I click "Logout"
