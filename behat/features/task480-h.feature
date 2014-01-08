Feature: PW-480 h Article Entry Form and Fields
  In order to add content type News, Brief, Analysis, Review , How-To,
  Advertorial, Elsewhere on The Web, Interview,Off-Hours, Press Release,
  Research, Whitepaper, Newsletter, Webcast
  As a pw_staff user
  I need to be able create different types of content for different use cases


  @javascript @insulated @480
  Scenario: Registered User should not create articles
    Then I log on as "vishaltest"
    And I am on "node/add/off-hours"
    Then I should see "Access Denied"
    Then I click "Logout"


  @javascript @insulated @480
  Scenario: PW staff should be able to create content Off-Hours and schedule a publish date
    Then I log on as "pwstaff1"
    And I am on "node/add/off-hours"
    When I fill in "Headline" with "offhourstest1"
    Then I fill article values
    And I check "edit-field-article-contributed-conten-und-yes"
    And I check "edit-field-article-includes-video-emb-und-yes"
    And I check "edit-field-article-includes-audio-emb-und-yes"
    And I select "General" from "Secondary category"
    And I select "8tracks" from "Related Companies"
    And I select "ActionScript" from "Related Languages"
    And I select "Dobango" from "Product"
    Then I check "edit-field-article-featured-und-yes"
    And I attach the file "download.png" to "edit-field-article-featured-graphic-und-0-upload"
    Then I press button "edit-field-article-featured-graphic-und-0-upload-button"
    When I set date in "edit-publish-on-datepicker-popup-0" and "edit-publish-on-timeEntry-popup-1" with + "30" seconds
    Then I press button "Save as draft"
    Then I press button "Save as draft"
    Then I should be redirected to article page "/news/offhourstest1/hours/" + current day
    Then I click "Logout"

    Then I log on as "pwstaff1"
    And I am on "node/add/off-hours"
    When I fill in "Headline" with "offhourstest2"
    Then I fill article values
    When I press button "Save as draft"
    # When I press button "Save as draft"
    Then I should be redirected to article page "/news/offhourstest2/hours/" + current day
    Then I click "Logout"
    And go to "/news/offhourstest2/hours/" + current day
    Then I should see "Access Denied"
    Then I log on as "pwstaff1"
    And go to "/news/offhourstest2/hours/" + current day
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"
    Then I click "Logout"


    # And I wait for "35" secs
    And go to "/news/offhourstest1/hours/" + current day
    Then I should see "test body 1"
    Then I log on as "pwstaff1"
    And go to "/news/offhourstest1/hours/" + current day
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"


# @javascript @insulated @480
# Scenario: PW staff should create content Off-Hours but leave published date empty



  @javascript @insulated @480
  Scenario: PW staff should create content Off-Hours but leave published date empty but press publish
  button and the content should get published
    Then I log on as "pwstaff1"
    And I am on "node/add/off-hours"
    When I fill in "Headline" with "offhourstest3"
    Then I fill article values
    When I press button "Publish"
    # When I press button "Publish"
    Then I should be redirected to article page "/news/offhourstest3/hours/" + current day
    Then I click "Logout"
    And go to "/news/offhourstest3/hours/" + current day
    And I should see "test body 1"
    Then I log on as "pwstaff1"
    And go to "/news/offhourstest3/hours/" + current day
    And I click "Edit"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"


  @javascript @insulated @480
  Scenario: Manager should be able to see all fields in off-hours edit form
    Then I log on as "manager"
    And I am on "node/add/off-hours"
    When I fill in "Headline" with "offhourstest3"
    Then I fill article values
    When I press button "Publish"
      # When I press button "Publish"
    Then I should be redirected to article page "/news/offhourstest3/hours/" + current day
    Then I click "Edit"
    And I should see "Summary"
    And I should see "Body"
    And I should see "Super Short Hed"
    And I should see "Thumbnail Graphic"
    And I should see "Featured Graphic"
    And I should see "Primary Target Audience"
    And I should see "Primary Channel"
    And I should see "Primary category"
    And I should see "Secondary category"
    And I should see "Contributed Content"
    And I should see "Includes Video Embed"
    And I should see "Includes Audio Embed"
    And I should see "Related Companies"
    And I should see "Related APIs"
    And I should see "Related Languages"
    And I should see "Featured"
    And I should see "Product"
    Then I press button "Delete"
    And I press button "Delete"
    Then I should see "deleted"



  @javascript @insulated @480
  Scenario: The Publish on date should be per the time zone selected in drupal.
    Then I log on as "pwstaff1"
    And I am on "node/add/off-hours"
    Then I should check time with "America/New_York"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "admin/config/regional/settings"
    And I select "America/Regina" from "Default time zone"
    And I press button "edit-submit"
    Then I click "Log out"
    Then I log on as "pwstaff1"
    And I am on "node/add/off-hours"
    Then I should check time with "America/Regina"
    Then I click "Logout"
    Then I log on as "admin"
    And I am on "admin/config/regional/settings"
    And I select "America/New_York" from "Default time zone"
    And I press button "edit-submit"
    Then I should see "saved"