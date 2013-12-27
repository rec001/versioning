<?php

use Behat\Behat\Context\ClosuredContextInterface,
  Behat\Behat\Context\TranslatedContextInterface,
  Behat\Behat\Context\BehatContext,
  Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
  Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;

//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//

/**
 * Features context.
 */
class FeatureContext extends MinkContext {
  /**
   * Initializes context.
   * Every scenario gets it's own context object.
   *
   * @param   array $parameters context parameters (set them up through behat.yml)
   */
  public function __construct(array $parameters) {
    // Initialize your context here
  }

//
// Place your definition and hook methods here:
//
//    /**
//     * @Given /^I have done something with "([^"]*)"$/
//     */
//    public function iHaveDoneSomethingWith($argument)
//    {
//        doSomethingWith($argument);
//    }
//


  /**
   * @Then /^I click "([^"]*)"$/
   */
  public function iClick($link) {
    $link = $this->fixStepArgument($link);
    $this->getSession()->getPage()->clickLink($link);

  }


  /**
   * @Given /^I wait for the suggestions to come$/
   */
  public function iWaitForTheSuggestionsToCome() {
    $this->getSession();
  }

  /**
   * @Then /^I fill in "([^"]*)" as "([^"]*)"$/
   */
  public function iFillInAs($arg1, $arg2) {
    if ($arg1 == 'username') {
      $this->fillField('name', $arg2);
    }

    if ($arg1 == 'title') {
      $this->fillField('title', $arg2);
    }

  }

  /**
   * @Then /^I select option "([^"]*)"$/
   */
  public function iSelectOption($select, $option) {
    $select = $this->fixStepArgument($select);
    $option = $this->fixStepArgument($option);
    $this->getSession()->getPage()->selectFieldOption($select, $option);
  }

  /**
   * @Then /^I fill in password "([^"]*)" as "([^"]*)"$/
   */
  public function iFillInPasswordAs($arg1, $arg2) {
    if ($arg1 == 'password') {
      $this->fillField('pass', $arg2);
    }
  }

  /**
   * @Then /^I press button "([^"]*)"$/
   */
  public function iPressButton($button) {
    $button = $this->fixStepArgument($button);
    $this->getSession()->getPage()->pressButton($button);
  }

  /**
   * @Then /^I should be redirected to "([^"]*)"$/
   */
  public function iShouldBeRedirectedTo($arg1) {
    $this->assertPageAddress($arg1);
  }


  /**
   * @Then /^I log on as "([^"]*)"$/
   */
  public function iLogOnAs($arg1) {
    $this->visit('/user/login');
    $username = $arg1;
    $password = '';
    switch ($arg1) {
      case 'admin':
        $password = '1234';
        break;
    }

    $this->fillField('edit-name', $username);
    $this->fillField('edit-pass', $password);

    $this->pressButton('Log in');
  }

}
