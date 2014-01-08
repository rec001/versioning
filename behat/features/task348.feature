Feature: PW-348 Email Confirmation of Mashup Submission
If a registered user submits a mashup, a confirmation message goes to the submitter's email address.
As a registered user
I need to check if an authenticated user receives an email after submitting a mashup.

  @javascript @insulated @348
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content2"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I select "Backend" from "Primary Category"
    When I fill in "edit-body-und-0-value" with "test content"
    And I attach the file "download.png" to "edit-field-mashup-image-und-0-upload"
    Then I press button "Save"
    Then I should be redirected to "mashup/test-mashup-content2"
    Then I click "Logout"
    Then I log on as "admin"
    Then I click "Reports"
    Then I click "Recent log messages"
    Then I should see "Successfully sent email to xxvishal.khialani@gmail.comzz"
    Given I am on "mashup/test-mashup-content2"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
