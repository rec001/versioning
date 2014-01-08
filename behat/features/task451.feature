Feature: PW-451 API Submission Completion Page
  Whenever a new API is submitted, user must be redirected to custom page.
  As an authenticated user
  I need to see if user is redirected to custom page when API is created.


  @javascript @insulated @451
  Scenario: Created API as authenticated user and see whether redirected to custom page
    Then I log on as "vishaltest"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapi451"
    Then I press button "Save"
    Then I should see "API testapi451 has been created"
    Then I should see "API Submission Completed"
    Then I should see "Our staff is reviewing your submission. What would you like to do next? "