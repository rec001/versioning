Feature: PW-508 Framework/Lib follower alerted when another user follows the framework/library
  Whenever someone follows a framework/library, make a record of that event in the eventlog.
  As a website admin
  I need to see if it really creates an entry in eventlog Whenever someone follows any framework/library.

  @javascript @insulated @508
  Scenario: Create eventlog entry
    Then I log on as "vishaltest"
    Given I am on "/resource/dribbble-client-library-actionscript"
    Then I click "Summary"
    Then I click "Follow this"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "/eventlog"
    Then I should see "followed Framework/Library"
    Then I should see "vishaltest"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "/resource/dribbble-client-library-actionscript"
    Then I click "Summary"
    Then I click "Following this"
