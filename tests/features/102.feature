Feature: 102-Create features for Versioning project
  In order to check if Max version number that is None, set Min version number field to the highest possible version number
  As a various different roles
  I need to be able login and create node clone.

  @javascript @insulated
  Scenario: Authenticated User as admin role
    Given I am on "/"
    Then I log on as "admin"
    Then I should be redirected to "users/admin"
    Then I click "Add content"
    Then I should be redirected to "node/add/raptor-article"
    Then I fill in "title" as "Base Article Max is Null"
    Then I select "1.3.6" from "Min Version"
    Then I select "Raptor" from "Platform"
    Then I press button "Save"
    Then I click "Content summary"
    Then I should be redirected to "content-summary"
    Then I click "Base Article Max is Null"
    Then I should be redirected to "node/30/view"
    Then I click "Clone"
    Then I should be redirected to "node/30/clone/confirm"
    Then I should see "Min Version"
    
   
