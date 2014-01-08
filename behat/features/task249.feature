Feature: PW-249 Recreate "Forgot Password Email Sent" Entry
  In order to view how if a user forgot their password and requested for a new one.
  As a website admin
  I need to be able to see what if a certain user requested for a new password

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/password"
    When I fill in "Username" with "admin"
    Then I press button "E-mail new password"
    And I wait for the page to come
    Then I should see "Further instructions have been"
    Given I am on "/user/password"
    When I fill in "Username" with "niyas.absl@gmail.com"
    Then I press button "E-mail new password"
    And I wait for the page to come
    Then I should see "Further instructions have been"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/eventlog"
    And I wait for the page to come
    Then I should see "Forgot password, email sent to zzvishal.khialani@redcrakle.comzz"
    Then I should see "Forgot password, email sent to niyas.absl@gmail.com"
    Then I click "Logout"
