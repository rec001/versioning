Feature: 101-Create features for Versioning project
  In order to check the Min Version number to be the version number just smaller than Max Version number
  As a various different roles
  I need to be able login and create node clone.

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
    Then I click "Clone this raptor article"
    Then I should be redirected to "node/67/clone/confirm"
    Then I select "000100200" from "Max Version"
    Then I press button "Save"
    Then I should see " Min version cannot be greater than Max version."
    Then I select "- None -" from "Min Version"
    Then I press button "Save"
    Then I should see " Min version cannot be None."
    Then I select "000100200" from "Max Version"
    Then I select "000100200" from "Min Version"
    Then I press button "Save"
    Then I should see " Min version cannot be equal to Max version."
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
    Then I click "Base Article pointing to self"
    Then I should be redirected to "raptor/article/base-article-pointing-self"
    Then I click "Clone this raptor article"
    Then I should be redirected to "node/67/clone/confirm"
    Then I select "000100200" from "Max Version"
    Then I press button "Save"
    Then I should see " Min version cannot be greater than Max version."
    Then I select "- None -" from "Min Version"
    Then I press button "Save"
    Then I should see " Min version cannot be None."
    Then I select "000100200" from "Max Version"
    Then I select "000100200" from "Min Version"
    Then I press button "Save"
    Then I should see " Min version cannot be equal to Max version."
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
    Then I click "Base Article pointing to self"
    Then I should be redirected to "raptor/article/base-article-pointing-self"
    Then I click "Clone this raptor article"
    Then I should be redirected to "node/67/clone/confirm"
    Then I select "000100200" from "Max Version"
    Then I press button "Save"
    Then I should see " Min version cannot be greater than Max version."
    Then I select "- None -" from "Min Version"
    Then I press button "Save"
    Then I should see " Min version cannot be None."
    Then I select "000100200" from "Max Version"
    Then I select "000100200" from "Min Version"
    Then I press button "Save"
    Then I should see " Min version cannot be equal to Max version."
    Then I click "Edit"
    Then I press button "Delete"
    Then I press button "Delete"
    Then I click "Log out"
