Feature: PW-196 Create "Sent Mashup Publication Notification" Entry
If a mashup is published,a notification message goes to the submitter's email address. we need to create an eventlog entry when it happens
As an admin
I need to check if it creates an entry in eventlog for sending notification email.

  @javascript @insulated @196
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content5"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I wait for "2" secs
    Then I click on the text "Flickr"
    And I select "Backend" from "Primary Category"
    When I fill in "edit-body-und-0-value" with "test content"
    And I attach the file "download.png" to "edit-field-mashup-image-und-0-upload"
    Then I press button "edit-submit"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "mashup/test-mashup-content5"
    Then I click "Workflow"
    Then I check "edit-workflow-18"
    Then I press button "edit-submit"
    Then I check "edit-workflow-19"
    Then I press button "edit-submit"
    Given I am on "/eventlog"
    Then I should see "test mashup content5"
    Then I should see "sent Mashup publication notification email for"
    Then I should see "test mashup content5 to xxvishal.khialani@gmail.comzz"
    Given I am on "mashup/test-mashup-content5"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
