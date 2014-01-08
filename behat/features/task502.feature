Feature: PW-502 Follower of How-To alerted when another user follows the How-To/Source
  Whenever someone follows a how-to/source, make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone follows any how-to/source.

  @javascript @insulated @502
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/link/net-twilio-libraries"
    Then I click "Summary"
    Then I click "Follow"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "followed Howto/Sourcecode"
    Then I should see "vishaltest"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "/link/net-twilio-libraries"
    Then I click "Summary"
    Then I click "Following this"
