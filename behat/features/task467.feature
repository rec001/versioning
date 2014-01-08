Feature: PW-467 Framework/Library Profile Page: Design
  Check the node view page of Framework/Library content
  As a registered user
  I need to be able view all the fields filled up while creating Framework/Library content

  @javascript @insulated @467
  Scenario: One howto/sourcecode can have multiple authors.
    Given I am on "/"
    Then I log on as "nijotest"
    Given I am on "node/add/resource"
    Then I should see "Create Framework / Library"
    Then I fill framework-library values with "testframeworklibrary467"
    Then I press button "Save"
    Given I am on "resource/testframeworklibrary467"
    Then I should see "testframeworklibrary467"
    Then I should see "Description"
    Then I should see "Type"
    Then I should see "APIs"
    Then I should see "Languages"
    Then I should see "Primary Category"
    Then I should see "Secondary Category"
    Then I should see "Added"
    Then I should see "Updated"
    Then I should see "Created by"
    Then I should see "Submitted by"
    Then I should see "URL"