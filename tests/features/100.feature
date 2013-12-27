Feature: 100-Create features for Versioning project
  In order to check if Base Article point to the node that was just added
  As a various different roles
  I need to be able login and create content.

  @javascript @insulated
  Scenario: Authenticated User as admin role
    Then I log on as "admin"
    Then I should be redirected to "users/admin"
    Then I click "Add content"
    Then I should be redirected to "node/add/raptor-article"
    Then I fill in "title" as "Base Article pointing to self"
    Then I select "1.3.6" from "Min Version"
    Then I select "2.5.4" from "Max Version"
    Then I select "Raptor" from "Platform"
    Then I press button "Save"
    Then I click "Content summary"
    Then I should be redirected to "content-summary"
    Then I click "Base Article pointing to self"
    Then I should be redirected to "raptor/article/base-article-pointing-self"
    Then I should see "Base Article"
    Then I click "Base Article pointing to self"
    Then I should be redirected to "raptor/article/base-article-pointing-self"
    Then I click "Edit"
    Then I press button "Delete"
    Then I press button "Delete"
    Then I click "Log out"
   
