Feature: PW-198 Create "Framework/Library Submitted" Entry
  Whenever a new Framework/Library is created in the system, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while creating an Framework/Library.


  @javascript @insulated @198
  Scenario: Check eventlog to see whether valid entry was made while Framework/Library is created
    Then I log on as "vishaltest"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrary198"
    Then I press button "Save"
    Then I should see "Framework / Library testframeworklibrary198 has been created"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "submitted Framework/Library"
    Then I should see "testframeworklibrary198"