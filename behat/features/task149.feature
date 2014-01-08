Feature: PW-149 Recreate "Autosubscribed Email" Entry
  Whenever someone creates an account with 'auto subscribe' checkbox enabled,, make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone creates an account with newsletter subscription checkbox enabled

  @javascript @insulated @149
  Scenario: Login
    Given I am on "/user/register"
    When I fill in "Username" with "featureuser1"
    Then I fill in "E-mail address" with "featureuser111@gmail.comz"
    Then I fill in "edit-pass-pass1" with "test123"
    Then I fill in "edit-pass-pass2" with "test123"
    And I check "edit-field-user-subscribe-und-1"
    Then I check "edit-field-terms-of-service-und-1"
    Then I press button "Sign Up"
    Then I should see "Registration successful. You are now logged in."
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "registered"
    Then I should see "PW Watchlist Autosubscribe"
    Given I am on "/admin/people"
    Then I click "featureuser1"
    #And I click on the element with xpath "//*[@id='tasks']/ul/li[2]/a"
    And I click "Settings"
    Then I press button "edit-cancel"
    Then I check "edit-user-cancel-method--5"
    Then I press button "edit-submit"
    Then I should see "featureuser1 has been deleted"

