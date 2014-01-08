Feature: PW-246 Recreate "Added API Subscription" Entry
  Whenever someone tracks an API, make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone tracks an API

  @javascript @insulated @146
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/api/test-api-task-146"
    Then I click "Track this API"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "followed API"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "/api/test-api-task-146"
    Then I click "Tracking this API"
