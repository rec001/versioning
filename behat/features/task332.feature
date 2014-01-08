Feature: PW-332 Build How-To/Source-Code Workflow Report
This is a single "web" page that reports on the status of recently entered How-To/Source-Code as they go through the workflow
As a registered user.
I need to check node state for workflow.

  @javascript @insulated @332
  Scenario: Make sure anonymous and registers users can't see this view
    Given I am on "/"
    Then I should see "Login"
    Given I am on "howto-sourcecode-workflow"
    Then I should see "Access Denied"
    Then I log on as "vishaltest"
    Given I am on "howto-sourcecode-workflow"
    Then I should see "Access Denied"

  @javascript @insulated @332
  Scenario: Filter and delete how-to/source-code content who's status is new
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecodepwstaff2" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "howto-sourcecode-workflow"
    Then I should see "testhowtosourcecodepwstaff2"
    And I click on the element with xpath ".//*[@id='content']/div/div[2]/table/tbody/tr[1]/td[6]/a"
    And I wait for the page to come
    Then I press button "Delete"
    And I wait for the page to come
    Given I am on "howto-sourcecode-workflow"
    Then I should not see "testhowtosourcecodepwstaff2"
    Given I am on "link/testhowtosourcecodepwstaff2"
    Then I should see "Page not found"

  @javascript @insulated @332
  Scenario: Filter how-to/source-code content who's status is pending
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecodepwstaff3" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change How-To/Source-Code state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-64"
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "howto-sourcecode-workflow"
    Then I should see "testhowtosourcecodepwstaff3"
    And I click on the element with xpath ".//*[@id='content']/div/div[4]/div/div[2]/table/tbody/tr/td[6]/a"
    And I wait for the page to come
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "How-To/Source-Code testhowtosourcecodepwstaff3 has been updated"