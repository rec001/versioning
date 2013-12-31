Feature: 100-Create features for Versioning project
  In order to check if Base Article point to the node that was just added
  As a various different roles
  I need to be able login and create content.

  @javascript @insulated
  Scenario: Authenticated User as admin, raptor admin and raptor editor role
    Then I log on as "admin"
    Then I should be redirected to "users/admin"
    Then I click "Content summary"
    Then I should be redirected to "content-summary"
    #Then I click on the element with xpath "/html/body/div/div/div[2]/div/div[3]/div/div/div/div/table[2]/tbody/tr/td[2]/a"
    Then I click on the element with css selector "#block-system-main .sticky-enabled table tbody tr td a"
    Then I click "Log out"
   
