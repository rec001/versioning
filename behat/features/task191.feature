Feature: PW-191 Require Captcha For Registration
  In order to register you need enter captcha
  As anonymous user
  I need to be able register on the website only after entering CAPTCHA

  @javascript @insulated @191
  Scenario: Anonymous users should be able to fill the registration form but not submit if they don't enter the captcha
    When I run "drush --y en captcha image_captcha"
    Given I am on "/"
    Then I should see "Login"
    Given I am on "user/register"
    Then I should see "Create new account"
    When I fill in "Username" with "testusername191"
    When I fill in "E-mail address" with "xxtest191@test.comzz"
    When I fill in "Password" with "test191test"
    When I fill in "Confirm password" with "test191test"
    When I check "edit-field-terms-of-service-und-1"
    Then I press button "Sign Up"
    And I wait for the page to come
    Then I should see "What code is in the image? field is required"
    When I run "drush --y dis captcha image_captcha"