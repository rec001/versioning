Feature: PW-314A - Check workflow of api for different users
  In order review api content types
  As a registered user , pw staff and manager
  I need to be able use the workflow of api based on different roles

  @javascript
  Scenario: Reg user can only save a new api cannot change state
    Given I am on "/"
    Then I log in as "vishaltest"
    And I create a new api
    Then I should not have the option to change the state


  @javascript
  Scenario: Pw staff user can only use states save,pending,draft,rejected but not approved
    Given I am on "/"
    Then I log in as "pwtempuser"
    And I create a new api
    Then I should not have the option to change the state to pending , draft and then rejected
    When I try to save it as approved I should get an error



  @javascript
  Scenario: Manager user can only use states save,pending,draft,rejected and approved
    Given I am on "/"
    Then I log in as "pwtempmanager"
    And I create a new api
    Then I should not have the option to change the state to pending , draft, approved and then rejected
