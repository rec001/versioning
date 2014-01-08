Feature: PW-244 Email Confirmation of API Submission
If a registered user submits an API, a confirmation message goes to the submitter's email address.
As a registered user
I need to check if an authenticated user receives an email after submitting an API.


  @javascript @insulated @244
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/api"
    When I fill in "API Name" with "test api4"
    When I fill in "API Provider" with "test provider"
    Then I fill in "edit-field-api-home-page-und-0-url" with "http://www.google.com"
    When I fill in "API Endpoint" with "test endpoint"
    And I select "API Overviews" from "Primary category"
    And I fill in "API Description" with "test api desc"
    Then I press button "edit-submit"
    Then I should be redirected to "/api/test-api4"
    Then I should see "created"
    Then I click "Logout"
    Then I log on as "admin"
    Then I click "Reports"
    And I click "Recent log messages"
    Then I should see "Successfully sent email to xxvishal.khialani@gmail.comzz"
    Given I am on "/api/test-api4"
    And I click "Edit"
    And I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
