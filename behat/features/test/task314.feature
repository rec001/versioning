Feature: PW-314 PW Staffer and Owner Facing Add/Edit API Form
  In order to edit and verify api submissions made
  As a registered pw staff and Owner
  I need to be able review api content submissions and change the values after I deem fit

  @javascript @insulated
  Scenario: One api can have multiple authors.
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
    When I fill in "edit-field-authors-for-this-api-und-2-email" with "xxvishal.khialani@gmail.comzz"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I log on as "vishaltest"
    Given I am on "api/testapi1"
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "edit-field-authors-for-this-api-und-0-email" with "xxvishal.khialani@gmail.comzz"
    When I fill in "edit-field-authors-for-this-api-und-2-email" with ""
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "api/testapi1"

  @javascript
  Scenario: Try to change the api name as registered user
    Given I am on "/"
    Then I log on as "vishaltest"
    Given I am on "api/testapi1"
    Then I click "Edit"
    And I wait for the page to come
    Then "edit-title" must be disabled
#    When I fill in "API Name" with "new test"

#  @javascript @insulated
#  Scenario: Try to change the api name as registered user
#    Given I am on "/"
#    When I log in as "vishaltest"
#    Then I edit a api "/api/testapiauthor"
#    Then I change the field "API Name" as 'testnewapiname'
#    And I click "save"
#    Then I should get message "cannot save" # change message to drupal notification
#
  @javascript @insulated
  Scenario: Try to change the api name as pw staff
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "api/testapi1"
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "API Name" with "testapiauthor1"
    When I fill in "Actual API Provider" with "Accenture"
    When I fill in "Changelog" with "testchangelog"
    Given I wait for "2" secs
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "api/testapiauthor1"
    Given I am on "api/testapi1"
    Then I should be redirected to "api/testapiauthor1"


  @javascript @insulated
  Scenario: Create a Api with more values than an anonymous user
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values as pwstaff user
    Given I wait for "2" secs
    Then I press button "Save"
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "10" secs
    Then I should be redirected to "api/testapipwstaff1"