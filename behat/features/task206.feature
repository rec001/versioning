Feature: PW-206 Create "HowTo/SourceCode Updated" Entry
  Whenever a HowTo/SourceCode is updated, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while updating a HowTo/SourceCode


  @javascript @insulated @206
  Scenario: Check eventlog to see whether valid entry was made while HowTo/SourceCode is updated
    Then I log on as "pwstaff1"
    Given I am on "link/testhowtosourcecode200"
    Then I click "Edit"
    Then I press button "Save"
    Given I am on "/eventlog"
    Then I should see "updated HowTo/SourceCode"
    Then I should see "testhowtosourcecode200"