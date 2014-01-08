Feature: PW-375 One Time "Mashup Rejected" Email Notification
If a mashup is rejected, a notification message goes to the submitter's email address.
As an admin
I need to check if an authenticated user receives an email after rejecting the mashup

  @javascript @insulated @375
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content7"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I select "Backend" from "Primary Category"
    When I fill in "edit-body-und-0-value" with "test content1"
    And I attach the file "download.png" to "edit-field-mashup-image-und-0-upload"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "mashup/test-mashup-content7"
    Then I click "Workflow"
    Then I check "edit-workflow-18"
    Then I press button "edit-submit"
    Then I check "edit-workflow-20"
    Then I press button "edit-submit"
    Then I click "Reports"
    Then I click "Recent log messages"
    Then I should see "Successfully sent email to xxvishal.khialani@gmail.comzz"
    Given I am on "mashup/test-mashup-content7"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
