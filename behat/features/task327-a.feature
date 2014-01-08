Feature: PW-327-A Edit Framework/Library Form
  In order review Framework/Library content types
  As a registered user , pw staff and manager
  I need to be able use the workflow of Framework/Library based on different roles

  @javascript @insulated @327a
  Scenario: Reg user can only save a new howto/sourcecode cannot change workflow state
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrary3"
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "resource/testframeworklibrary3"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "Change Framework/Library Workflow state"


  @javascript @insulated @327a
  Scenario: Pw staff user can use states new,pending,approved and rejected
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "resource/testframeworklibrary3"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "Changelog" with "testchangelog"
    Then I should see "Change Framework/Library Workflow state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-38"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Framework/Library Workflow state"
    Then I should see "APPROVED"
    Then I should see "REJECTED"
    When I click on the element with css selector "#edit-workflow-39"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "Change Framework/Library Workflow state"