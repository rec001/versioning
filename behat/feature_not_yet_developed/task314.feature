Feature: PW-314 PW Staffer and Owner Facing Add/Edit API Form
  In order to edit and verify api submissions made
  As a registered pw staff and Owner
  I need to be able review api content submissions and change the values after I deem fit

  @javascript
  Scenario: One api can have multiple authors.
    Given I am on "/"
    When I log in as "pwtempuser"
    And I create api and save "testapiauthor"
    Then I edit a api "/api/testapiauthor"
    Then I fill 'vishaltest' in "OwnerID"
    And I should not see any option
    Then I fill 'vishal.khialani@redcrackle.com' in "OwnerID"
    And I wait for system to show "vishal.khialani@redcrackle.com"
    Then I click "vishal.khialani@redcrackle.com"
    Then I press button "save"
    Then I logout
    When I login as "vishaltest"
    Then I go edit "/api/testapiauthor"
    Then I remove "pwtempuser" from "Authors for this Api"
    Then I press button "save"

  @javascript
  Scenario: Try to change the api name as registered user
    Given I am on "/"
    When I log in as "vishaltest"
    Then I edit a api "/api/testapiauthor"
    Then I change the field "API Name" as 'testnewapiname'
    And I click "save"
    Then I should get message `  "cannot save" # change message to drupal notification

  @javascript
  Scenario: Try to change the api name as pw staff
    Given I am on "/"
    When I log in as "pwtempuser"
    Then I edit a api "/api/testapiauthor"
    Then I change the field "API Name" as 'testapiauthor1'
    And I click "save"
    Then I should get redirected to "/api/testapiauthor1"
    Then I go to "/api/testapiauthor"
    And I should then go to "/api/testapiauthor1"



  @javascript
  Scenario: Create a Api with more values than an anonymous user
    Given I am on "/"
    Then I log in using "pwtempuser"
    Then I make a content same steps as 312 scenario "Anonymous users should be abl..."
    Then I also fill in "New" in "API Status"
    Then I fill in "actualapiprovider1" in "Actual API Provider"
    Then I will in "vishaltest" in "SubmitterID"
    Then I will in "pwtempuser" in "OwnerID"
    And the value for "last touched by" should be empty
    And the "Date Submitted" should be emtpy too
    Then I should see "Date Published" should be empty too
    And I should see "Last Update" as emtpy too as its new
    And I should not click "Deadpool Checkbox"
    And I should fill "testadmincomments1" in "Admin Comments"
    Then I fill in "www.apihuburltest1.com" in "APIhub URL"
    And I then upload a file in "Image/Uploader"
    Then I fill in "testtopmatchsearchtext1" in "Top Match Search Text"






