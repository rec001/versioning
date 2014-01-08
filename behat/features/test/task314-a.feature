Feature: PW-314-A - Check workflow of api for different users
  In order review api content types
  As a registered user , pw staff and manager
  I need to be able use the workflow of api based on different roles

  @javascript
  Scenario: Reg user can only save a new api cannot change state
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "api/testapi1"
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "Change Workflow API state"


  @javascript
  Scenario: Pw staff user can only use states new,pending,draft,rejected but not approved
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "api/testapi1"
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "Actual API Provider" with "Accenture"
    When I fill in "Changelog" with "testchangelog"
    Given I wait for "2" secs
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
    Then I should see "REJECTED"
    Then I should not see "APPROVED"

  @javascript
  Scenario: Manager user can only use states new,pending,draft,rejected and approved
    Given I am on "/"
    Then I log on as "manager"
    Given I am on "api/testapi1"
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Workflow API state"
    Then I should see "REJECTED"
    Then I should see "APPROVED"
    When I click on the element with css selector "#edit-workflow-14"
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "API testapi1 has been updated."