Feature: PW-318 Build API Workflow Report
  In order to administer api content
  As a  pw staff
  I need to be able review api content based on their status

  @javascript @insulated @318
  Scenario: Make sure anonymous and registers users can't see this view
    Given I am on "/"
    Then I should see "Login"
    Given I am on "api-workflow"
    Then I should see "Access Denied"
    Then I log on as "vishaltest"
    Given I am on "api-workflow"
    Then I should see "Access Denied"



  @javascript @insulated @318
  Scenario: Filter and delete api content who's status is new
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff2" as pwstaff user
    Given I wait for "2" secs
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Given I am on "api-workflow"
    Then I should see "testapipwstaff2"
    And I click on the element with xpath ".//*[@id='content']/div/div[3]/table/tbody/tr[1]/td[7]/a"
    And I wait for the page to come
    Given I wait for "2" secs
    Then I press button "Delete"
    And I wait for the page to come
    Given I am on "api-workflow"
    Then I should not see "testapipwstaff2"
    Given I am on "api/testapipwstaff2"
    Then I should see "Page not found"

  @javascript @insulated @318
  Scenario: Filter api content who's status is pending
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff3" as pwstaff user
    Given I wait for "2" secs
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-12"
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Given I am on "api-workflow"
    Then I should see "testapipwstaff3"
    And I click on the element with xpath ".//*[@id='content']/div/div[5]/div[1]/div[2]/table/tbody/tr/td[6]/a"
    And I wait for the page to come
    Given I wait for "2" secs
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Then I should see "API testapipwstaff3 has been updated."

  @javascript @insulated @318
  Scenario: Filter api content who's status is draft
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff4" as pwstaff user
    Given I wait for "2" secs
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-12"
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "DRAFT"
    When I click on the element with css selector "#edit-workflow-13"
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Given I am on "api-workflow"
    Then I should see "testapipwstaff4"
    And I click on the element with xpath ".//*[@id='content']/div/div[5]/div[2]/div[2]/table/tbody/tr/td[5]/a"
    And I wait for the page to come
    Given I wait for "2" secs
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "5" secs
    Then I should see "API testapipwstaff4 has been updated."