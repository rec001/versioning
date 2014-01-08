Feature: PW-271 - API Profile Page / Mashups Tab
If any user views the API Mashup tab
As any user
I need to check whether related mashup is listed

  @javascript @insulated @271
  Scenario: Fields displayed on the API mashups tab
    Given I am on "/"
    Then I log on as "manager"
    Given I am on "node/add/api"
    Then I should see "Create API"
    Then I fill api values with "testapipwstaff271" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "api/testapipwstaff271"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashuppwstaff271" as pwstaff user
    When I fill in "edit-field-api-und-0-target-id" with "testapipwstaff271"
    Given I wait for "3" secs
    When I click on the text "testapipwstaff271"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "mashup/testmashuppwstaff271"
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Mashup Workflow state"
    Then I should see "PENDING"
    When I click on the element with css selector "#edit-workflow-18"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should see "Change Mashup Workflow state"
    Then I should see "APPROVED"
    When I click on the element with css selector "#edit-workflow-19"
    Then I press button "Save"
    And I wait for the page to come
    Given I am on "api/testapipwstaff271/mashups"
    Then I should see "testmashuppwstaff271"