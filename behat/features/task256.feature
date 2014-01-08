Feature: PW-256 Recreate "User Logged-In" Entry
  In order to view who is login in to site
  As a website admin
  I need to be able to see who is login

  @javascript @insulated @256
  Scenario: Login
    Then I log on as "vishaltest"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "user logged in vishaltest"
