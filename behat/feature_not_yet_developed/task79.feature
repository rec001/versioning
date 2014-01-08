Feature: PW-79 New User Registration Flow
When ever a user registers into the system
as anonymous user
I want to be able to register on the site to use its features

  @javascript @insulated @79
  Scenario: New user should not be allowed to register without accepting the terms
    Then I go to /users/register
    Then I fill username, email,password,confirm password
    And I don't check "yes, I have read and agree to the terms of service"
    Then I fill captcha
    And I submit "sign up"
    Then I should see message "Please read the Terms of Service. Thanks."

  @javascript @insulated @79
  Scenario: New user should be allowed to register with accepting the terms.
    Then I go to /users/register
    Then I fill username, email,password,confirm password
    And I check "yes, I have read and agree to the terms of service"
    Then I fill captcha
    And I submit "sign up"
    And then I should be redirected to "/"
    Then I should see message "Registration successful. You are now logged in."