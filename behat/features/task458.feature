Feature: PW-458 How-To/Source-Code Submission Completed Page
  Whenever a new How-To/Source-Code is submitted, user must be redirected to custom page.
  As an authenticated user
  I need to see if user is redirected to custom page when How-To/Source-Code is created.


  @javascript @insulated @458
  Scenario: Created Framework/Library as authenticated user and see whether redirected to custom page
    Then I log on as "vishaltest"
    Given I am on "node/add/how-to-source-code"
    Then I should see "Create How-To/Source-Code"
    Then I fill howto-sourcecode values with "testhowtosourcecode458"
    Then I press button "Save"
    Then I should see "How-To/Source-Code testhowtosourcecode458 has been created"
    Then I should see "How-To/Source-Code Submission Completed"
    Then I should see "Our staff is reviewing your submission. What would you like to do next? "