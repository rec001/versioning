Feature: PW-186 Recreate "Added Search Subscription" Entry
  As a website user
  I need to see if I can track search terms

  @javascript @insulated @186
  Scenario: Track search in API directory page
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
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "followed Search Term"
