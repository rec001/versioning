Feature: PW-164 Include "Wiki Updated" In the Alert Queue
  Whenever user updates his wiki information, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog, whenever someone updates his wiki info

  @javascript @insulated @164
  Scenario: Login
    Then I log on as "vishaltest"
    And I click "Settings"
    Then I fill in "edit-field-wiki-und-0-value" with "**bold**"
    Then I press button "edit-submit"
    Then I should see "The changes have been saved"
    And I click "Settings"
    Then I fill in "edit-field-wiki-und-0-value" with "**bold1**"
    Then I press button "edit-submit"
    Then I should see "The changes have been saved"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "vishaltest"
    Then I should see "Wiki Updated"

