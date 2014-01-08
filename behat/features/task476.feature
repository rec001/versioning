Feature: PW-476 How-to/source Search Page
  As a website user
  I need to see if I can search how-to/source using keyword and categories

  @javascript @insulated @476
  Scenario: Search using how-to/source Name and category field
    Given I am on "/howtos/directory"
    Then I fill in "edit-term" with "test"
    And I select "Accessibility" from "edit-category"
    And I select "APL" from "edit-language"
    And I select "Google Maps" from "edit-api"
    Then I check "edit-deadpool"
    Then I check "edit-source"
    And I press button "edit-submit"
    Then I should see "Test how to for testing"

  @javascript @insulated @476
  Scenario: Search using how-to/source text fields
    Given I am on "/howtos/directory"
    Then I fill in "edit-term" with "test desc"
    And I press button "edit-submit"
    Then I should see "Test how to for testing"

