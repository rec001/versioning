Feature: PW-201 Create "Framework/Library Published" Entry
  Whenever a new Framework/Library is published, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while publishing a Framework/Library.


  @javascript @insulated @201
  Scenario: Check eventlog to see whether valid entry was made while Framework/Library is created
    Then I log on as "pwstaff1"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrarypwstaff201" as pwstaff user
    Then I press button "Save"
    Given I am on "resource/testframeworklibrarypwstaff201"
    Then I click "Edit"
    When I fill in "Changelog" with "testchangelog"
    Then I should see "Change Framework/Library Workflow state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-38"
    Then I press button "Save"
    Then I click "Edit"
    Then I should see "Change Framework/Library Workflow state"
    Then I should see "APPROVED"
    Then I should see "REJECTED"
    When I click on the element with css selector "#edit-workflow-39"
    Then I press button "Save"
    Given I am on "/eventlog"
    Then I should see "Framework/Library published"
    Then I should see "testframeworklibrarypwstaff201"