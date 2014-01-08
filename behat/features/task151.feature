Feature: PW-151 Recreate Login Failed Entry
  In order to view how many times people failed to log on
  As a website admin
  I need to be able to see what user or guest was not able to log on

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/login"
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Then I should see "Logout"
    When I click "Logout"
    And I wait for the page to come
    Then I should see "Login"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "let"
    Then I press button "Log in"
    Then I should see "unrecognized username or password"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "notactualuser"
    When I fill in "Password" with "let"
    Then I press button "Log in"
    Then I should see "unrecognized username or password"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    Given I am on "/eventlog"
    Then I should see "user logged in admin"
    Then I should see "User failed login: admin"
    Then I should see "User failed login: Guest"
    Then I should see "user logged in admin"
    Then I should see "Logout"
    Then I click "Logout"
