Feature: PW-205 Create "Framework/Library Updated" Entry
  Whenever a Framework/Library is updated, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while updating a Framework/Library.


  @javascript @insulated @205
  Scenario: Check eventlog to see whether valid entry was made while Framework/Library is updated
    Then I log on as "pwstaff1"
    Given I am on "resource/testframeworklibrarypwstaff201"
    Then I click "Edit"
    Then I press button "Save"
    Given I am on "/eventlog"
    Then I should see "Updated Framework/Library"
    Then I should see "testframeworklibrarypwstaff201"