Feature: PW-314 PW Staffer and Owner Facing Add/Edit API Form
  In order to edit and verify api submissions made
  As a registered pw staff and Owner
  I need to be able review api content submissions and change the values after I deem fit

  @javascript @insulated @314
  Scenario: One api can have multiple authors.
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapi2"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I log on as "pwstaff1"
    Given I am on "api/testapi2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "edit-field-authors-for-this-api-und-2-email" with "xxvishal.khialani@gmail.comzz"
    When I fill in "Actual API Provider" with "Accenture"
    When I fill in "Changelog" with "testchangelog"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I log on as "vishaltest"
    Given I am on "api/testapi2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "OwnerID"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "api/testapi2"

#  @javascript @insulated
#  Scenario: Try to change the api name as registered user
#    Given I am on "/"
#    Then I log on as "vishaltest"
#    Given I am on "api/testapi2"
#    Then I click "Edit"
#    And I wait for the page to come
#    Then "edit-title" must be disabled


  @javascript @insulated @314
  Scenario: Try to change the api name as pw staff
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "api/testapi2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "API Name" with "testapiauthor1"
    When I fill in "Actual API Provider" with "Accenture"
    When I fill in "Changelog" with "testchangelog"
    Given I wait for "1" secs
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "api/testapiauthor1"
    Given I am on "api/testapi2"
    Then I should be redirected to "api/testapiauthor1"


  @javascript @insulated @314
  Scenario: Create a Api with more values than an anonymous user
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff1" as pwstaff user
    Given I wait for "1" secs
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "1" secs
    Then I should see "API testapipwstaff1 has been created"

  @javascript @insulated @314
  Scenario: Check whether deadpool value is checked
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "api/testapipwstaff1"
    Then I should see "Deadpool Checkbox"
    Then I should see "(Yes)"