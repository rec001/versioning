Feature: PW-280 Mashup Search Page
  As a website user
  I need to see if I can search mashups using keyword and categories

  @javascript @insulated @280
  Scenario: Search using Mashup Name and category field
    Given I am on "/mashups/directory"
    Then I fill in "edit-term" with "test"
    And I select "3D" from "edit-category"
    And I press button "edit-submit"
    Then I should see "test mashup task 158"

  @javascript @insulated @280
  Scenario: Search using Mashup Name and api field
    Given I am on "/mashups/directory"
    Then I fill in "edit-term" with "test"
    And I select "Microsoft Bing Maps" from "edit-api"
    And I press button "edit-submit"
    Then I should see "mashup test vishaltest2"

  @javascript @insulated @280
  Scenario: Search using mashup description
    Given I am on "/mashups/directory"
    Then I fill in "edit-term" with "VCarious is a"
    And I press button "edit-submit"
    Then I should see "VCarious"
