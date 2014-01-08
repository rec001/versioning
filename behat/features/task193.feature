Feature: PW-193 Create "Added Framework/Library Subscription" Entry
  Whenever a Framework/Library is tracked, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while tracking a Framework/Library.

  @javascript @insulated @193
  Scenario: Check eventlog to see whether valid entry was made while Framework/Library is tracked
    Then I log on as "pwstaff1"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrarypwstaff193" as pwstaff user
    Then I press button "Save"
    Given I am on "resource/testframeworklibrarypwstaff193"
    And I click on the element with xpath ".//*[@id='resource-content']/div[1]/div[1]/div[2]/span/a"
    Given I am on "/eventlog"
    Then I should see "followed Framework/Library"
    Then I should see "testframeworklibrarypwstaff193"