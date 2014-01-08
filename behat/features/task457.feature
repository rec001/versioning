Feature: PW-457 Framework/Library Submission Completed Page
  Whenever a new Framework/Library is submitted, user must be redirected to custom page.
  As an authenticated user
  I need to see if user is redirected to custom page when Framework/Library is created.


  @javascript @insulated @457
  Scenario: Created Framework/Library as authenticated user and see whether redirected to custom page
    Then I log on as "vishaltest"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrary457"
    Then I press button "Save"
    Then I should see "Framework / Library testframeworklibrary457 has been created"
    Then I should see "Framework/Library/SDK Submission Completed"
    Then I should see "What would you like to do next?"