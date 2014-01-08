Feature: PW-320 Public Facing Add Mashup Form
  In order to create mashup content type
  As an anonymous user
  I need to be able create an Mashup contents only after registering.

  @javascript @insulated @320
  Scenario: Anonymous users should be able to fill the form but not submit if they don't register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashup1"
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "Choose a Username field is required."
    Then I should see "E-mail address field is required."



  @javascript @insulated @320
  Scenario: Anonymous users should be able to fill the form and submit if they register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashup1"
    When I fill in "Choose a Username" with "testusername2"
    When I fill in "E-mail address" with "xxtest@test.comzz"
    Then I fill in "edit-pass-pass1" with "test123"
    Then I fill in "edit-pass-pass2" with "test123"
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "Mashup testmashup1 has been created"
