Feature: PW-324 Build Mashups Workflow Report
This is a single "web" page that reports on the status of recently entered Mashups as they go through the workflow.
As a registered user
I need to check node state for workflow.

  @javascript @insulated @324
  Scenario: Make sure anonymous and registers users can't see this view
    Given I am on "/"
    Then I should see "Login"
    Given I am on "mashup-workflow"
    Then I should see "Access Denied"
    Then I log on as "vishaltest"
    Given I am on "mashup-workflow"
    Then I should see "Access Denied"

  @javascript @insulated @324
  Scenario: Filter and delete mashup content who's status is new
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashuppwstaff2" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "mashup-workflow"
    Then I should see "testmashuppwstaff2"
    And I click on the element with xpath ".//*[@id='content']/div/div[2]/table/tbody/tr[1]/td[6]/a"
    And I wait for the page to come
    Then I press button "Delete"
    And I wait for the page to come
    Given I am on "mashup-workflow"
    Then I should not see "testmashuppwstaff2"
    Given I am on "mashup/testmashuppwstaff2"
    Then I should see "Page not found"

  @javascript @insulated @324
  Scenario: Filter mashup content who's status is pending
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashuppwstaff3" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Mashup Workflow state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-18"
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "mashup-workflow"
    Then I should see "testmashuppwstaff3"
    And I click on the element with xpath ".//*[@id='content']/div/div/div/div[2]/table/tbody/tr/td[5]/a"
    And I wait for the page to come
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "Mashup testmashuppwstaff3 has been updated."