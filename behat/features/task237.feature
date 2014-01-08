Feature: PW-237 Reproduce "Follower favorited Followee" Entry
  Whenever a user follows another user in the system, a new entry is inserted into eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog when one user tracks other users.


  @javascript @insulated @237
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/profile/profiletester"
    Then I click "Track This User"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "added favorite profile"
    Then I should see "vishaltest"
    Then I should see "profiletester"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "/profile/profiletester"
    Then I click "Untrack"

