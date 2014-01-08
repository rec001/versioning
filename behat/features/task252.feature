Feature: PW-252 Recreate "Unsubscribed PWW" Entry
  Whenever someone unsubscribe from pw watchlist from his account , make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone unsubscribe from pw watchlist

  @javascript @insulated @252
  Scenario: Login
    Then I log on as "vishaltest"
    And I click "Settings"
    Then I uncheck "edit-field-watchlist-und-2"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "vishaltest unsubscribed from PWW"
    Given I am on "/users/vishaltest"
    And I click "Settings"
    Then I check "edit-field-watchlist-und-2"
    Then I press button "edit-submit"
    Then I should see "saved"

