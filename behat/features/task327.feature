Feature: PW-327 Edit Framework/Library Form
  In order to edit and verify Framework/Library submissions made
  As a registered pw staff and Owner
  I need to be able review Framework/Library content submissions and change the values after I deem fit

  @javascript @insulated @327
  Scenario: One howto/sourcecode can have multiple authors.
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrary2"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "pwstaff1"
    Given I am on "resource/testframeworklibrary2"
    Then I click "Edit"
    When I fill in "edit-field-resource-ownerid-und-0-email" with "xxvishal.khialani@gmail.comzz"
    When I fill in "Changelog" with "testchangelog"
    Then I press button "Save"
    Then I click "Logout"
    Then I log on as "vishaltest"
    Given I am on "resource/testframeworklibrary2"
    Then I click "Edit"
    Then I should not see "OwnerID"
    Then I press button "Save"
    Then I should be redirected to "resource/testframeworklibrary2"

  @javascript @insulated @327
  Scenario: Try to change the howto/sourcecode name as pw staff
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "resource/testframeworklibrary2"
    Then I click "Edit"
    When I fill in "Framework/Library Name" with "testframeworklibraryauthor1"
    Then I press button "Save"
    Then I should be redirected to "resource/testframeworklibraryauthor1"
    Given I am on "resource/testframeworklibrary2"
    Then I should be redirected to "resource/testframeworklibraryauthor1"


  @javascript @insulated @327
  Scenario: Create a howto/sourcecode with more values than an anonymous user
    Given I am on "/"
    Then I log on as "pwstaff1"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrarypwstaff1" as pwstaff user
    Then I press button "Save"
    And I wait for the page to come
    Then I should see "Framework / Library testframeworklibrarypwstaff1 has been created"