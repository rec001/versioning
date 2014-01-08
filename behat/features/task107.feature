Feature: PW-107 Recreate Blog RSS Feed and URL
  As a website user
  I need to see if it creates rss feed for newly created news posts

  @javascript @insulated @107
  Scenario: create content News
    Then I log on as "pwstaff1"
    And I am on "node/add/news"
    When I fill in "Headline" with "newstest3"
    Then I fill article values
    When I press button "Publish"
    Then I should be redirected to article page "/news/newstest3/" + current day
    Then I click "Logout"
    Given I am on "/rss_blog"
    Then I should see "newstest3"