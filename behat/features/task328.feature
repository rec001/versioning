Feature: PW-328 Build Framwork/Library Workflow Report
This is a single "web" page that reports on the status of  recently entered Framwork/Library (F/L) as they go through
the workflow as a registered user.
I need to check node state for workflow.

  @javascript @insulated @328
  Scenario: Make sure anonymous and registers users can't see this view
    Given I am on "/"
    Then I should see "Login"
    Given I am on "fl-workflow"
    Then I should see "Access Denied"
    Then I log on as "vishaltest"
    Given I am on "fl-workflow"
    Then I should see "Access Denied"

  @javascript @insulated @328
  Scenario: Filter and delete Framwork/Library content who's status is new
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrarypwstaff2" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "fl-workflow"
    Then I should see "testframeworklibrarypwstaff2"
    And I click on the element with xpath ".//*[@id='content']/div/div[2]/table/tbody/tr[1]/td[6]/a"
    And I wait for the page to come
    Then I press button "Delete"
    And I wait for the page to come
    Given I am on "fl-workflow"
    Then I should not see "testframeworklibrarypwstaff2"
    Given I am on "resource/testframeworklibrarypwstaff2"
    Then I should see "Page not found"

  @javascript @insulated @328
  Scenario: Filter Framwork/Library content who's status is pending
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrarypwstaff3" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "resource/testframeworklibrarypwstaff3"
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Framework/Library Workflow state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-38"
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "fl-workflow"
    Then I should see "testframeworklibrarypwstaff3"
    And I click on the element with xpath ".//*[@id='content']/div/div[4]/div/div[2]/table/tbody/tr[1]/td[6]/a"
    And I wait for the page to come
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "Framework / Library testframeworklibrarypwstaff3 has been updated"