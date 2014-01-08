Feature: PW-262 Recreate Settings Tab Functionality on The User Profile Page
Allow registered users to manage their profile
as registered user
I want to be able to change my personal details and manage my subscription

  @javascript @insulated @262
  Scenario: Change all values in profile
    When I log in as a 'vishaltest1'
    Then I go to my profile page
    When I am there I go to setting tab
    And I change all the values to new values
# for the individual fields please see the mockup or the site
    Then I save the profile
    And I should see a confirmation of the profile being saved
    Then I should check the values are correct as per new submission


  @javascript @insulated @262
  Scenario: edit watch list
    When I log in as a 'vishaltest1'
    Then I go to my profile page
    Then I should be able to delete "facebook api" from my watch list
    When I refresh the page I should not see "facebook api"
