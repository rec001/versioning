Feature: PW-384 Develop Rules For DEFUNCT Status
  In order review api content types
  As a manager
  I need to be able use the workflow of api and change status of api to defunct

  @javascript @insulated @384
  Scenario: All users except manager and admin should not be able to change the state to defunct
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff5" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    Then I should see "Change Workflow API state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-12"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "DRAFT"
    When I click on the element with css selector "#edit-workflow-13"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "api/testapipwstaff5"
    Then I click "Edit"
    And I wait for the page to come
    And I select "APIs" from "Forums"
    Then I should see "Change Workflow API state"
    Then I should see "APPROVED"
    When I click on the element with css selector "#edit-workflow-14"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    Then I log on as "pwstaff1"
    Given I am on "api/testapipwstaff5"
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "DEFUNCT"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "api/testapipwstaff5"
    Then I click "Edit"
    And I wait for the page to come
    Then I press button "Delete"
    And I wait for the page to come
    Then I press button "Delete"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff6"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "api/testapipwstaff6"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "Actual API Provider" with "Accenture"
    When I fill in "Changelog" with "testchangelog"
    And I select "APIs" from "Forums"
    Then I should see "Change Workflow API state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-12"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "DRAFT"
    When I click on the element with css selector "#edit-workflow-13"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "APPROVED"
    When I click on the element with css selector "#edit-workflow-14"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "api/testapipwstaff6"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "DEFUNCT"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "api/testapipwstaff6"
    Then I click "Edit"
    And I wait for the page to come
    Then I press button "Delete"
    And I wait for the page to come
    Then I press button "Delete"
    Then I click "Logout"

  @javascript @insulated @384
  Scenario: manager should be able to change the state to defunct of a published api only
    Given I am on "/"
    Then I log on as "manager"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff7" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    Then I should see "Change Workflow API state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-12"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "DRAFT"
    When I click on the element with css selector "#edit-workflow-13"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "APPROVED"
    When I click on the element with css selector "#edit-workflow-14"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "DEFUNCT"
    When I click on the element with css selector "#edit-workflow-61"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "api/testapipwstaff7"
    Then I click "Edit"
    And I wait for the page to come
    Then I press button "Delete"
    And I wait for the page to come
    Then I press button "Delete"
    Then I click "Logout"