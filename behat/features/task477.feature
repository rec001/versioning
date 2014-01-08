Feature: PW-477 Framework/Library Search Page
  As a website user
  I need to see if I can search framework/library using keyword and categories

  @javascript @insulated @477
  Scenario: Search using framework/library Name and other field
    Given I am on "/framework/directory"
    Then I fill in "edit-term" with "test framework"
    And I select "Accessibility" from "edit-category"
    And I select "C" from "edit-language"
    And I select "Gigablast" from "edit-api"
    And I press button "edit-submit"
    Then I should see "Test framework for testing"

  @javascript @insulated @476
  Scenario: Search using framework/library text fields
    Given I am on "/framework/directory"
    Then I fill in "edit-term" with "Accommodations"
    And I press button "edit-submit"
    Then I should see "Test framework for testing"

  @javascript @insulated @476
  Scenario: Search using framework/library text fields
    Given I am on "/framework/directory"
    Then I fill in "edit-term" with "test desc"
    And I press button "edit-submit"
    Then I should see "Test framework for testing"

