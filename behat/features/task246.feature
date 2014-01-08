Feature: PW-246 Recreate "Removed Subscription" Entry
  Whenever someone removes an alert from their watchlist, make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone removes an alert from their watchlist

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/login"
    When I fill in "Username" with "vishaltest"
    When I fill in "Password" with "sarla"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/mashup/testmashup1"
    Then I click "Follow this"
    And I wait for the page to come
    Then I click "Following this"
    And I wait for the page to come
    Given I am on "/api/test-api-3"
    Then I click "Track this API"
    And I wait for the page to come
    Then I click "Tracking this API"
    And I wait for the page to come
    Given I am on "/resource/makeplans-api-documentation"
    Then I click "Follow this"
    And I wait for the page to come
    Then I click "Following this"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I should see "Login"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/eventlog"
    And I wait for the page to come
    Then I should see "unsubscribed alert"
    Then I should see "/mashup/testmashup1"
    Then I should see "/api/test-api-3"
    Then I should see "/makeplans-api-documentation"
    Then I click "Logout"
