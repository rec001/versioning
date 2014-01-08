Feature: PW-228 Email Confirmation of Profile Update
  Whenever user updates his profile, sends the confirmation email to the user
  As a website admin
  I need to see if it really sends confirmation email Whenever someone updates his account

  @javascript @insulated @228
  Scenario: Login
    Then I log on as "vishaltest"
    And I click "Settings"
    Then I fill in "edit-field-user-url-und-0-url" with "http://www.mywebsite.com"
    Then I press button "edit-submit"
    Then I should see "The changes have been saved"
    Then I click "Logout"
    Then I log on as "admin"
    Then I click "Reports"
    And I click "Recent log messages"
    Then I should see "Successfully sent email to xxvishal.khialani@gmail.comzz"

