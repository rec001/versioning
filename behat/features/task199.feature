Feature: PW-199 Create "HowTo/SourceCode Submitted" Entry
  Whenever a new HowTo/SourceCode is created in the system, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while creating an HowTo/SourceCode.


  @javascript @insulated @199
  Scenario: Check eventlog to see whether valid entry was made while HowTo/SourceCode is created
    Then I log on as "vishaltest"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode199"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "submitted HowTo/SourceCode"
    Then I should see "testhowtosourcecode199"