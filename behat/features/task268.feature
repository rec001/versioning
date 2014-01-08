Feature: PW-268 API Directory/Search Results Page
  As a website user
  I need to see if I can search apis using keyword and categories

  @javascript @insulated @268
  Scenario: Search using API Name and category fields
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "test api"
    And I select "Accidents" from "edit-category"
    And I select "ads" from "edit-data-format"
    And I press button "edit-submit"
    Then I should see "Test api for task 236"

  @javascript @insulated @268
  Scenario: Search using API Provider
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "testuser"
    And I press button "edit-submit"
    Then I should see "Test api for search page"

  @javascript @insulated @268
  Scenario: Search using API Endpoint
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "endpoint1"
    And I press button "edit-submit"
    Then I should see "Test api for task 236"

  @javascript @insulated @268
  Scenario: Search using API Description
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "University of Oxford IT services status"
    And I press button "edit-submit"
    Then I should see "University of Oxford Systems Status"

  @javascript @insulated @268
  Scenario: Search using data marshaling
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "XML"
    And I press button "edit-submit"
    Then I should see "ForeignAssistance.gov"

  @javascript @insulated @268
  Scenario: Search using related to field
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "related to value testing"
    And I press button "edit-submit"
    Then I should see "Test api for task 236"

  @javascript @insulated @268
  Scenario: Search using Differentiators field
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "differentiator field value testing"
    And I press button "edit-submit"
    Then I should see "Test api for task 236"

  @javascript @insulated @268
  Scenario: Search using Top Match Search Text
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "topmatch text"
    And I press button "edit-submit"
    Then I should see "Test api for task 236"

  @javascript @insulated @268
  Scenario: Search using API Kits
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "test apikits value"
    And I press button "edit-submit"
    Then I should see "Test api for task 236"

  @javascript @insulated @268
  Scenario: Search using API Forum
    Given I am on "/apis/directory"
    Then I fill in "edit-term" with "test apiforum value"
    And I press button "edit-submit"
    Then I should see "Test api for task 236"

