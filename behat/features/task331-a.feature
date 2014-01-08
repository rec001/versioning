Feature: PW-331-A Edit How-To/Source-Code Form
  In order review howto/sourcecode content types
  As a registered user , pw staff and manager
  I need to be able use the workflow of howto/sourcecode based on different roles

  @javascript @insulated @331a
  Scenario: Reg user can only save a new howto/sourcecode cannot change workflow state
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode3"
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "link/testhowtosourcecode3"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "Change How-To/Source-Code state"


  @javascript @insulated @323a
  Scenario: Pw staff user can use states new,pending,approved and rejected
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "link/testhowtosourcecode3"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "Changelog" with "testchangelog"
    Then I should see "Change How-To/Source-Code state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-64"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change How-To/Source-Code state"
    Then I should see "APPROVED"
    Then I should see "REJECTED"
    When I click on the element with css selector "#edit-workflow-65"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "Change How-To/Source-Code state"