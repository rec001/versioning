Feature: PW-350 Email Confirmation of How-To/Source-Code Submission
If a registered user submits a how-to/source-code, a confirmation message goes to the submitter's email address.
As a registered user
I need to check if an authenticated user receives an email after submitting a how-to/source-code.

  @javascript @insulated
  Scenario: Login
    Given I am on "/user/login"
    When I fill in "Username" with "vishaltest"
    When I fill in "Password" with "sarla"
    Then I press button "Log in"
    And I wait for the page to come
    Given I am on "/node/add/howto"
    When I fill in "How-To Name" with "test howto1"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I wait for the options to come
    Then I click on the text "Flickr"
    Then I press button "Add another item"
    And I wait for the options to come
    When I fill in "edit-field-api-und-1-target-id" with "Eventful"
    And I wait for the options to come
    Then I click on the text "Eventful"
    And I select "Backend" from "Primary Category"
    And I select "Adobe" from "Secondary Category"
    When I fill in "Tags" with "2way"
    And I wait for the options to come
    Then I click on the text "2way"
    And I wait for the options to come
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "/content/test-howto1"
    Then I should see "created"
    Given I am on "/node/add/source-code"
    When I fill in "Source-Code Name" with "test source code1"
    When I fill in "edit-field-api-und-0-target-id" with "Flickr"
    And I wait for the options to come
    Then I click on the text "Flickr"
    Then I press button "Add another item"
    And I wait for the options to come
    When I fill in "edit-field-api-und-1-target-id" with "Eventful"
    And I wait for the options to come
    Then I click on the text "Eventful"
    And I select "Backend" from "Primary Category"
    And I select "Adobe" from "Secondary Category"
    When I fill in "Tags" with "2way"
    And I wait for the options to come
    Then I click on the text "2way"
    And I wait for the options to come
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "/content/test-source-code1"
    Then I should see "created"
    Then I click "Logout"
    And I wait for the page to come
    Then I should see "Login"
    Given I am on "/user/login"
    And I wait for the form to come
    When I fill in "Username" with "admin"
    When I fill in "Password" with "letmeindev"
    Then I press button "Log in"
    And I wait for the page to come
    Then I click "Reports"
    And I click "Recent log messages"
    Then I should see "vishal.khialani@gmail.com"
    Then I click "Logout"
