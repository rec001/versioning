Feature: PW-273 - API Profile Page / Developers Tab
If any user views the API developers tab
As a pwstaff user
I need to check whether all the fields are displayed

  @javascript @insulated @273
  Scenario: Fields displayed on the API developers tab
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "api/testapipwstaff271/developers"
    Then I should see "Username"
    Then I should see "Name"
    Then I should see "Mashup"
    Then I should see "pwtempuser"
    Then I should see "testmashuppwstaff271"