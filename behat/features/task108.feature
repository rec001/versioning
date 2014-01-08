Feature: PW-108 Recreate Blog RSS Feed and URL
  As a website user
  I need to see if it creates rss feed for newly created news posts

  @javascript @insulated @108
  Scenario: create content News
    Then I log on as "nijotest"
    Given I am on "node/add/api"
    Then I fill api values with "testapifeed"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "manager"
    Given I am on "api/testapifeed"
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
    Then I click "Logout"
    Given I am on "/rss_api"
    Then I should see "testapifeed"