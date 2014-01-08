Feature: PW-326 Public Facing Add Framework/Library Form
  In order to create Framework/Library content type
  As an anonymous user
  I need to be able create an Framework/Library contents only after registering.

  @javascript @insulated @326
  Scenario: Anonymous users should be able to fill the form but not submit if they don't register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrary1"
    Then I press button "Save"
    Then I should see "Choose a Username field is required"
    Then I should see "E-mail address field is required"



  @javascript @insulated @326
  Scenario: Anonymous users should be able to fill the form and submit if they register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrary1"
    When I fill in "Choose a Username" with "testusername4"
    When I fill in "E-mail address" with "xxtest4@test4.comzz"
    Then I fill in "edit-pass-pass1" with "test123"
    Then I fill in "edit-pass-pass2" with "test123"
    Then I press button "Save"
    Then I should see "Framework / Library testframeworklibrary1 has been created"
