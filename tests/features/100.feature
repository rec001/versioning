Feature: 100-Create features for Versioning project
  In order to check if Base Article point to the node that was just added
  As a various different roles
  I need to be able login and create content.

  @javascript @insulated
  Scenario: Authenticated User as admin role
    Given I am on "/"
    Then I fill in "username" as "admin"
    Then I fill in password "password" as "1234"
    Then I press button "Log in"
    Then I should be redirected to "node"
    Then I click "Add content"
    Then I should be redirected to "node/add/raptor-article"
    Then I fill in "title" as "Base Article point to the node"
    Then I select "1.3.6" from "Min Version"
    Then I select "2.5.4" from "Max Version"
    Then I select "Raptor" from "Platform"
    Then I press button "Save"
    Then I click "Content summary"
    Then I should be redirected to "content-summary"
    Then I click "Base Article point to the node"
    Then I should be redirected to "node/21/view"
    Then I should see "Base Article"
   
