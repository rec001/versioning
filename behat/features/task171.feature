Feature: PW-171 Check Banned Email List
  In order to view if it validates when a user creates a new account with banned Email
  As an admin
  I need to be able to see what if an anonymous user registers an account with banned email.

  @javascript @insulated @171
  Scenario: Login
    Given I am on "/user/register"
    When I fill in "Username" with "testuser"
    Then I fill in "E-mail address" with "gazetteerwew@gmail.com"
    Then I press button "Sign Up"
    Then I should see "is blacklisted"
