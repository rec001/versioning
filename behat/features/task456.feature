Feature: PW-456 Mashup Submission Completed Page
If a mashup is submitted, an user is redirected to submission confirmation page
As an admin
I need to check if it redirects to the confirmation page

  @javascript @insulated @456
  Scenario: Login
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content11"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I wait for "2" secs
    Then I click on the text "Flickr"
    And I select "Backend" from "Primary Category"
    When I fill in "edit-body-und-0-value" with "test content"
    And I attach the file "download.png" to "edit-field-mashup-image-und-0-upload"
    Then I press button "Save"
    Then I should see "Your Mashup Submission Is Complete"
    Then I click "Logout"
    Then I log on as "admin"
    Given I am on "mashup/test-mashup-content11"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
