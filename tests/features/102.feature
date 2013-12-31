Feature: 102-Create features for Versioning project
  In order to check if Max version number that is None, set Min version number field to the highest possible version number
  As a various different roles
  I need to be able login and create node clone.

  @javascript @insulated
  Scenario: Authenticated User as admin role
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
    Then I should be redirected to "raptor/article/base-article-max-null"
    Then I click "Clone this raptor article"
    Then I should be redirected to "node/69/clone/confirm"
    Then I should see "Min Version"
    Then I click "Log out"
  @javascript @insulated
  Scenario: Authenticated User as raptor editor role
    Given I am on "user/login"
    Then I fill in "username" as "raptor.editor"
    Then I fill in password "password" as "1234"
    Then I press button "Log in"
    Then I should be redirected to "users/raptoreditor"
    Then I click "Content summary"
    Then I should be redirected to "content-summary"
    Then I click "Base Article Max is Null"
    Then I should be redirected to "raptor/article/base-article-max-null"
    Then I click "Clone this raptor article"
    Then I should be redirected to "node/69/clone/confirm"
    Then I should see "Min Version"
    Then I click "Log out"
  @javascript @insulated
  Scenario: Authenticated User as raptor admin role
    Given I am on "user/login"
    Then I fill in "username" as "raptor.admin"
    Then I fill in password "password" as "1234"
    Then I press button "Log in"
    Then I should be redirected to "users/raptoradmin"
    Then I click "Content summary"
    Then I should be redirected to "content-summary"
    Then I click "Base Article Max is Null"
    Then I should be redirected to "raptor/article/base-article-max-null"
    Then I click "Clone this raptor article"
    Then I should be redirected to "node/69/clone/confirm"
    Then I should see "Min Version"
    Then I click "Edit"
    Then I press button "Delete"
    Then I press button "Delete"
    Then I click "Log out"
    
   
