Feature: PW-194 Create "Added How-To/Source Subscription" Entry
  Whenever a How-To/Source is tracked, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog while tracking a How-To/Source.

  @javascript @insulated @194
  Scenario: Check eventlog to see whether valid entry was made while How-To/Source is tracked
    Then I log on as "pwstaff1"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode194" as pwstaff user
    Then I press button "Save"
    Given I am on "link/testhowtosourcecode194"
    And I click on the element with xpath ".//*[@id='resource-content']/div/div[1]/div[2]/span/a"
    Given I am on "/eventlog"
    Then I should see "followed Howto/Sourcecode"
    Then I should see "testhowtosourcecode194"