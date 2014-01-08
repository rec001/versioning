Feature: PW-241 Recreate "User Registered" Entry
  In order to view how if a user creates a new account, it creates an entry in eventlog

  @javascript @insulated @241
  Scenario: Login
    Given I am on "/user/register"
    When I fill in "Username" with "featureuser1"
    Then I fill in "E-mail address" with "featureuser111@gmail.comz"
    Then I press button "Sign Up"
    Then I should see "A welcome message with further instructions has been sent"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "registered"
    Given I am on "/admin/people"
    Then I click "featureuser1"
    And I click on the element with xpath "//*[@id='tasks']/ul/li[2]/a"
    Then I press button "edit-cancel"
    Then I check "edit-user-cancel-method--5"
    Then I press button "edit-submit"
    Then I should see "featureuser1 has been deleted"
