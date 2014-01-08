Feature: PW-79 New User Registration Flow
When ever a user registers into the system
as anonymous user
I want to be able to register on the site to use its features

  @javascript @insulated @79
  Scenario: New user should not be allowed to register without accepting the terms
    Given I am on "/user/register"
    When I fill in "Username" with "featureuser1"
    Then I fill in "E-mail address" with "featureuser111@gmail.comz"
    Then I fill in "edit-pass-pass1" with "test123"
    Then I fill in "edit-pass-pass2" with "test123"
    Then I press button "Sign Up"
    Then I should see "The Terms of Service CheckBox Is Not Checked"

  @javascript @insulated @79
  Scenario: New user should be allowed to register with accepting the terms.
    Given I am on "/user/register"
    When I fill in "Username" with "featureuser1"
    Then I fill in "E-mail address" with "featureuser111@gmail.comz"
    Then I fill in "edit-pass-pass1" with "test123"
    Then I fill in "edit-pass-pass2" with "test123"
    Then I check "edit-field-terms-of-service-und-1"
    Then I press button "Sign Up"
    Then I should see "Registration successful. You are now logged in."
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/admin/people"
    Then I click "featureuser1"
    #And I click on the element with xpath "//*[@id='tasks']/ul/li[2]/a"
    And I click "Settings"
    Then I press button "edit-cancel"
    Then I check "edit-user-cancel-method--5"
    Then I press button "edit-submit"
    Then I should see "featureuser1 has been deleted"