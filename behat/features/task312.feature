Feature: PW-312 Public Facing Add API Form
  In order to create api content type
  As a registered user
  I need to be able create an api contents so that others can find information about various apis.

  @javascript @insulated
  Scenario: Anonymous users should be able to fill the form but not submit if they don't register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapi1"
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "Choose a Username field is required."
    Then I should see "E-mail address field is required."



  @javascript @insulated
  Scenario: Anonymous users should be able to fill the form and submit if they register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapi1"
    When I fill in "Choose a Username" with "testusername1"
    When I fill in "E-mail address" with "xxtest@test.comzz"
    Then I press button "Save"
    And I wait for the page to come
    And I wait for "60" secs
    Then I should see "API testapi1 has been created"
