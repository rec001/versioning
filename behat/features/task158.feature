Feature: PW-158 Recreate "Added Mashup Subscription" Entry
  Whenever someone follows a mashup, make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone follows any mashup.

  @javascript @insulated @158
  Scenario: create eventlog entry
    Then I log on as "vishaltest"
    Given I am on "/mashup/test-mashup-task-158"
    Then I click "Follow this"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "followed Mashup"
    Then I should see "vishaltest"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "/mashup/test-mashup-task-158"
    Then I click "Following this"
