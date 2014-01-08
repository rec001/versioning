Feature: PW-165 Recreate Registration Failed Captcha Entry
  In order to view how if a user creates a new account
  As a anonymous user
  I need to be able to see what if an anonymous user registers an account with wrong captcha entry.

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/register"
    When I fill in "Username" with "featureuser1"
    Then I fill in "E-mail address" with "featureuser1@gmail.com"
    Then I fill in "What code is in the image?" with "abcde"
    Then I press button "Sign Up"
    Then I should see "CAPTCHA was not correct"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/eventlog"
    Then I should see "failed captcha"
    Then I click "Logout"
