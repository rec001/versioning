Feature: PW-272 - API Profile Page / Source Code Tab
If any user views the API Source Code tab
As any user
I need to check whether related Source Code is listed

  @javascript @insulated @272
  Scenario: Fields displayed on the API Source Code tab
    Given I am on "/"
    Then I log on as "manager"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecodepwstaff272" as pwstaff user
    When I fill in "edit-field-api-und-0-target-id" with "testapipwstaff271"
    Given I wait for "3" secs
    When I click on the text "testapipwstaff271"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "link/testhowtosourcecodepwstaff272"
    Then I click "Edit"
    And I wait for the page to come
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
    Given I am on "api/testapipwstaff271/howtosourcecode"
    Then I should see "testhowtosourcecodepwstaff272"