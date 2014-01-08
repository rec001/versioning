Feature: PW-166 Recreate Registration Failed Banned Email Entry
  In order to view if it creates entry in eventlog when a user creates a new account with banned Email
  As a anonymous user
  I need to be able to see what if an anonymous user registers an account with banned email.

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/register"
    When I fill in "Username" with "featureuser1"
    Then I fill in "E-mail address" with "gazetteerwew@gmail.com"
    Then I press button "Sign Up"
    Then I should see "is blacklisted"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/eventlog"
    Then I should see "failed banned email"
    Then I click "Logout"
