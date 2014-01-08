Feature: PW-200 Create "HowTo/SourceCode Published" Entry
  Whenever a HowTo/SourceCode is published in the system, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while publishing a HowTo/SourceCode.


  @javascript @insulated @200
  Scenario: Check eventlog to see whether valid entry was made while HowTo/SourceCode is published
    Then I log on as "pwstaff1"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode200" as pwstaff user
    Then I press button "Save"
    Given I am on "link/testhowtosourcecode200"
    Then I click "Edit"
    Then I should see "Change How-To/Source-Code state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-64"
    Then I press button "Save"
    Then I click "Edit"
    Then I should see "Change How-To/Source-Code state"
    Then I should see "APPROVED"
    When I click on the element with css selector "#edit-workflow-65"
    Then I press button "Save"
    Given I am on "/eventlog"
    Then I should see "HowTo/SourceCode Published"
    Then I should see "testhowtosourcecode200"