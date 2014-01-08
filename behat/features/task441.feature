Feature: PW-441 Members With Mashups Listing: Code
  Anonymous users should be able to see the list members who have created mashups

  @javascript @insulated @441
  Scenario: User should be able to see the list of members with mashups page
    Then I log on as "vishaltest"
    Given I am on "/add/mashup"
    When I fill in "Mashup Name" with "test mashup content12"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I wait for "2" secs
    Then I click on the text "Flickr"
    And I select "Backend" from "Primary Category"
    When I fill in "edit-body-und-0-value" with "test content12"
    And I attach the file "download.png" to "edit-field-mashup-image-und-0-upload"
    Then I press button "Save"
    Then I click "Logout"
    Given I am on "/members-mashup"
    Then I click "Username"
    Then I should see "vishaltest"
    Then I should see "test mashup content12"
    Then I log on as "admin"
    Given I am on "mashup/test-mashup-content12"
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"