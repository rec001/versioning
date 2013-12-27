Feature: 101-Create features for Versioning project
  In order to check the Min Version number to be the version number just smaller than Max Version number
  As a various different roles
  I need to be able login and create node clone.

  @javascript @insulated
  Scenario: Authenticated User as admin role
    Then I log on as "admin"
    Then I should be redirected to "users/admin"
    Then I click "Content summary"
    Then I should be redirected to "content-summary"
    Then I click "Clone of Base Article point to the node"
    Then I should be redirected to "node/22/view"
    Then I click "Clone"
    Then I should be redirected to "node/22/clone/confirm"
    Then I select "000100200" from "Max Version"
    Then I press button "Save"
    Then I should see " Min version cannot be greater than Max version."
    Then I select "- None -" from "Min Version"
    Then I press button "Save"
    Then I should see " Min version cannot be null."
   
