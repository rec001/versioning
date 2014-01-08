Feature: PW-384 Develop Rules For DEFUNCT Status
  In order review api content types
  As a manager
  I need to be able use the workflow of api and change status of api to defunct


  @javascript @insulated @384
  Scenario: All users except manager and admin should not be able to change the state to defunct
    Given I am on "/"
    Given there are users:
      | usernames | roles |
      | pwtempuser  | PW Staff   |
      | vishaltest   | authenticated user   |
    Then I log on each time as different "usernames"
    Then I create a api name "testapi3"
    Then I log out
    When I log in as "admin"
    And I then publish the api "testapi3"
    Then I log out
    And I log in as "usernames"
    Then I go to "api/testapi3"
    And I should not be able to change the state to "defunct"
    And I log out
    Then I log in as admin and delete the "api/testapi3"




  @javascript @insulated @384
  Scenario: manager should be able to change the state to defunct of a published api only
    Given I am on "/"
    Given I log in as "pwtempmanager" # role of this user is a manager
    Then I create a api name "testapi3"
    Then I change the state to "pending"
    And I should not be able to change the state to "defunct"
    Then I change the state to "draft"
    And I should not be able to change the state to "defunct"
    Then I change the state to "approved"
    And I should be able to change the state to "defunct"
    Then I delete the "api/testapi3"
