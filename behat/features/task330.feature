Feature: PW-330 Public Facing Add How-To/Source-Code Form
  In order to create How-To/Source-code content type
  As an anonymous user
  I need to be able create an how-to/source-code contents only after registering.

  @javascript @insulated @330
  Scenario: Anonymous users should be able to fill the form but not submit if they don't register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode1"
    Then I press button "Save"
    Then I should see "Choose a Username field is required."
    Then I should see "E-mail address field is required."



  @javascript @insulated @330
  Scenario: Anonymous users should be able to fill the form and submit if they register
    Given I am on "/"
    Then I should see "Login"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode1"
    When I fill in "Choose a Username" with "testusername3"
    When I fill in "E-mail address" with "xxtest3@test3.comzz"
    Then I fill in "edit-pass-pass1" with "test123"
    Then I fill in "edit-pass-pass2" with "test123"
    Then I press button "Save"
    Then I should see "How-To/Source-Code testhowtosourcecode1 has been created"
