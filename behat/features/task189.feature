Feature: PW-189 Include "Category Updated" In the Alert Queue
  Whenever a content is edit that has a category, then an eventlog entry is made
  As pwstaff
  I need to be create and update a content type to see whether an eventlog entry is being made

  @javascript @insulated @189
  Scenario: When a content with category is created or update an eventlog entry must be made
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecodepwstaff189" as pwstaff user
    Then I press button "Save"
    Given I am on "eventlog"
    Then I should see "Content with primary category Actors created"
    Then I should see "Content with secondary category Adventure created"
    Given I am on "link/testhowtosourcecodepwstaff189"
    Then I click "Edit"
    Then I press button "Save"
    Given I am on "eventlog"
    Then I should see "Content with primary category Actors updated"
    Then I should see "Content with secondary category Adventure updated"