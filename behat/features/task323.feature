Feature: PW-323 Edit Mashup Form
  In order to edit and verify mashup submissions made
  As a registered pw staff and Owner
  I need to be able review mashup content submissions and change the values after I deem fit

  @javascript @insulated @323
  Scenario: One mashup can have multiple authors.
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashup2"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I log on as "pwstaff1"
    Given I am on "mashup/testmashup2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "edit-field-mashup-ownerid-und-2-email" with "xxvishal.khialani@gmail.comzz"
    When I fill in "Changelog" with "testchangelog"
    Then I press button "Save"
    And I wait for the page to come
    Then I click "Logout"
    And I wait for the page to come
    Then I log on as "vishaltest"
    Given I am on "mashup/testmashup2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    Then I should not see "OwnerID"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "mashup/testmashup2"

  @javascript @insulated @323
  Scenario: Try to change the mashup name as pw staff
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "mashup/testmashup2"
    And I wait for the page to come
    Then I click "Edit"
    And I wait for the page to come
    When I fill in "Mashup Name" with "testmashupauthor1"
    Then I press button "Save"
    And I wait for the page to come
    Then I should be redirected to "mashup/testmashupauthor1"
    Given I am on "mashup/testmashup2"
    Then I should be redirected to "mashup/testmashupauthor1"


  @javascript @insulated @323
  Scenario: Create a mashup with more values than an anonymous user
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/mashup"
    Then I should see "Create Mashup"
    Then I fill mashup values with "testmashuppwstaff1" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Given I wait for "1" secs
    Then I should be redirected to "mashup/testmashuppwstaff1"