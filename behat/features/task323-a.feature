Feature: PW-323-A - Check workflow of mashup for different users
  In order review mashup content types
  As a registered user , pw staff and manager
  I need to be able use the workflow of mashupbased on different roles

  @javascript @insulated @323a
  Scenario: Reg user can only save a new mashup cannot change workflow state
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashup3"
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "mashup/testmashup3"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "Change Mashup Workflow state"


  @javascript @insulated @323a
  Scenario: Pw staff user can use states new,pending,approved and rejected
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "mashup/testmashup3"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "Changelog" with "testchangelog"
    Then I should see "Change Mashup Workflow state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-18"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Mashup Workflow state"
    Then I should see "APPROVED"
    Then I should see "REJECTED"
    When I click on the element with css selector "#edit-workflow-19"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "Change Mashup Workflow state"