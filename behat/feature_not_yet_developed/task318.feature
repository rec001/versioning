Feature: PW-318 Build API Workflow Report
  In order to administer api content
  As a  pw staff
  I need to be able review api content based on their status



  @javascript
  Scenario: Make sure anonymous and registers users can't see this view
    Given I am on "/"
    And I am not logged in the site
    Then I go to "/api-workflow"
    And I should get error "access denied"
    Then I log in as 'vishaltest'
    Then I go to "/api-workflow"
    And I should get error "access denied"



  @javascript
  Scenario: Filter and delete api content who's status is new
    Given I am on "/"
    When I log in as "pwtempuser"
    And I create an api "testapi1"
    Then I go to "/api-workflow"
    And I should be able to search by api name using value "testapi1"
    And I should be able to search by "api provider"
    And I should be able to search by "api description"
    And I should be able to search by "date of submission"
    And I should be able to search by "username"
    When If I click username I should go the profile page of who made it
    When I click edit the record I should be able to edit the api
    When I click delete for api "testapi1" it should get deleted
    When I search again "testapi1" I should not get any results.
    And I go to "/api/testapi1" and it should not exist


  @javascript
  Scenario: Filter api content who's status is pending
    Given I am on "/"
    When I log in as "pwtempuser"
    And I create an api "testapi1"
    And I change the state to pending
    Then I go to "/api-workflow"
    And I should be able to search by api name using value "testapi1" in "pending section"
    And I should be able to search by "actual api provider"
    And I should be able to search by "last touched by"
    And I should be able to search by "date of last touch"
    When I click "edit the record" I should be able to edit that api
    Then I should go to the api page and delete this api

  @javascript
  Scenario: Filter api content who's status is draft
    Given I amn on "/"
    When I log in as "pwtempuser"
    And I create an api "testapi1"
    And I change state to draft
    Then I go to "api-workflow"
    And I should be able to search by api name using value "testapi1" in "draft section"
    And I should be able to search by "actual api provider"
    And I should be able to search by "last touched by"
    And I should be able to search by "date of last touch"
    When I click "edit the record" I should be able to edit that api
    Then I should go to the api page and delete this api
