Feature: PW-270 - API Profile Page / Summary Tab
If any user views the API summary tab
As a pwstaff user
I need to check whether all the fields are displayed

  @javascript @insulated @270
  Scenario: Fields displayed on the API summary tab
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "api/test-api1"
    Then I should see "test provider"
    Then I should see "http://www.google.com"
    Then I should see "Amazon"
    Then I should see "No"
    Then I should see "xxvishal.khialani@gmail.comzz"
    Then I should see "xxpwtempuser@gmail.comzz"
    Then I should see "APIs related to test api1"
    Then I should see "test api1 followers"
    Then I should not see "Data Marshaling"
    Then I should not see "Actual API Provider"
    Then I should not see "Changelog"
    Then I should not see "Author informaiton"
    Then I should not see "SubmitterID"