Feature: PW-336 Build Event Workflow
This is a single "web" page that reports on the status of recently entered Events as they go through the workflow
As a registered user
I need to check node state for workflow.

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/login"
    When I fill in "Username" with "vishaltest"
    When I fill in "Password" with "sarla"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/node/add/event"
    And I wait for the page to come
    When I fill in "Event Name" with "test event content"
    When I fill in "Event Location" with "test location"
    When I fill in "URL" with "http://www.example.com"
    When I fill in "Event Hash Tag" with "test content"
    And I select "Amazon" from "Related Companies"
    And I select "StrikeIron March Mashup" from "Related Contests"
    And I select "Backend" from "Primary Category"
    Then I click "wysiwyg-toggle-edit-body-und-0-value"
    When I fill in "edit-body-und-0-value" with "test content"
    When I attach the file "/home/nijo/Downloads/download.jpg" to "edit-field-event-image-und-0-upload"
    Then I press button "Save"
    And I wait for the page to comep
    Then I should be redirected to "content/test-event-content"
    Then I click "Logout"
    Given I am on "/user/login"
    And I wait for the page to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/content/test-event-content"
    Then I should see "Current state: NEW"
    When I check "PENDING"
    Then I press button "Update workflow"
    And I wait for the page to come
    Then I should see "Current state: PENDING"
    Then I click "Logout"
