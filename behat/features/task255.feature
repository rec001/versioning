Feature: PW-255 Reproduce "Follower unfavorited Followee" Entry
  Whenever a user removes another user from his track list, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog when one user untracks other users.


  @javascript @insulated @255
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/profile/profiletester"
    Then I click "Track This User"
    Then I click "Untrack"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "removed favorite profile "
    Then I should see "vishaltest"
    Then I should see "profiletester"

