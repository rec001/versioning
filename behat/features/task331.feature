Feature: PW-331 Edit How-To/Source-Code Form
  In order to edit and verify howto/sourcecode submissions made
  As a registered pw staff and Owner
  I need to be able review howto/sourcecode content submissions and change the values after I deem fit

  @javascript @insulated @331
  Scenario: One howto/sourcecode can have multiple authors.
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode2"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I log on as "pwstaff1"
    Given I am on "link/testhowtosourcecode2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "edit-field-howto-ownerid-und-2-email" with "xxvishal.khialani@gmail.comzz"
    When I fill in "Changelog" with "testchangelog"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I log on as "vishaltest"
    Given I am on "link/testhowtosourcecode2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "OwnerID"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "link/testhowtosourcecode2"

  @javascript @insulated @331
  Scenario: Try to change the howto/sourcecode name as pw staff
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "link/testhowtosourcecode2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "How-To/Source-Code Name" with "testhowtosourcecodeauthor1"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "link/testhowtosourcecodeauthor1"
    Given I am on "link/testhowtosourcecode2"
    Then I should be redirected to "link/testhowtosourcecodeauthor1"


  @javascript @insulated @331
  Scenario: Create a howto/sourcecode with more values than an anonymous user
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecodepwstaff1" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "How-To/Source-Code testhowtosourcecodepwstaff1 has been created"