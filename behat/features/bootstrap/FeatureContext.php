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
class FeatureContext extends MinkContext
{
    /**
     * Initializes context.
     * Every scenario gets it's own context object.
     *
     * @param   array   $parameters     context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
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
    public function iClick($link)
    {
        $link = $this->fixStepArgument($link);
        $this->getSession()->getPage()->clickLink($link);

    }


    /**
     * @Given /^I wait for the suggestions to come$/
     */
    public function iWaitForTheSuggestionsToCome()
    {
        $this->getSession();//->wait(5000);
    }


    /**
     * @Given /^I wait for the form to come$/
     */
    public function iWaitForTheFormToCome()
    {
        $this->getSession();//->wait(5000);
    }



    /**
     * @Given /^I wait for the page to come$/
     */
    public function iWaitForThePageToCome()
    {
        $this->getSession();//->wait(5000);
    }

    /**
     * @Given /^I wait for the page to come more$/
     */
    public function iWaitForThePageToComeMore()
    {
        $this->getSession();//->wait(15000);
    }

    /**
     * @Then /^I press button "([^"]*)"$/
     */
    public function iPressButton($button)
    {
        $button = $this->fixStepArgument($button);
        $this->getSession()->getPage()->pressButton($button);
    }

    /**
     * @Then /^I select option "([^"]*)"$/
     */
    public function iSelectOption($select, $option)
    {
        $select = $this->fixStepArgument($select);
        $option = $this->fixStepArgument($option);
        $this->getSession()->getPage()->selectFieldOption($select, $option);
    }

    /**
     * @Given /^I wait for the options to come$/
     */
    public function iWaitForTheOptionsToCome()
    {
        $this->getSession();//->wait(5000);
    }

    /**
     * @Then /^I should be redirected to "([^"]*)"$/
     */
    public function iShouldBeRedirectedTo($arg1)
    {
        $this->getSession();//->wait(10000);
        $this->assertPageAddress($arg1);
    }


    /**
     * Click some text
     *
     * @When /^I click on the text "([^"]*)"$/
     */
    public function iClickOnTheText($text)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', '*//*[text()="'. $text .'"]')
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Cannot find text: "%s"', $text));
        }

        $element->click();

    }

    /**
     * @Then /^I click button "([^"]*)"$/
     */
    public function iClickButton($button)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', '//input[@value="'. $button .'"]')
        );
        $element->doubleclick();
    }

    /**
     * @Then /^I wait for some time/
     */
    public function iWaitForSomeTime()
    {
        $this->getSession();//->wait(2000);
    }


    /**
     * @Then /^I log on as "([^"]*)"$/
     */
    public function iLogOnAs($arg1)
    {
        $this->visit('/user/login');
        $username = $arg1;
        $password = '';
        switch ($arg1) {
            case 'vishaltest':
                $password = 'sarla';
                break;
            case 'pwstaff1':
                $password = 'sarla';
                break;
            case 'pwtempuser':
                $password = 'pwtempuser';
                break;
            case 'admin':
                $password = 'letmeindev';
                break;
            case 'nijotest':
              $password = 'nijotest';
              break;
            case 'manager':
              $password = 'manager123';
              break;
          case 'profiletester':
            $password = 'test';
            break;
        }

        $this->fillField('edit-name', $username);
        $this->fillField('edit-pass', $password);

        $this->pressButton('Log in');
    }


    /**
     * @Then /^I fill article values$/
     */
    public function iFillArticleValues2()
    {
        $this->iClickOnTheText('Disable rich-text');
        $this->fillField('Summary', 'test summary');
        $this->iClickOnTheText('Disable rich-text');
        $this->fillField('Body', 'test body 1');
        $this->fillField('Super Short Hed', 'test head 1');
        $this->attachFileToField('edit-field-article-thumbnail-graphic-und-0-upload','download.png');
        $this->pressButton('edit-field-article-thumbnail-graphic-und-0-upload-button');
        //$this->attachFileToField('edit-field-article-featured-graphic-und-0-upload','download.jpg');
        //$this->pressButton('edit-field-article-featured-graphic-und-0-upload-button');
        //$this->iWaitForSomeTime();
        $this->checkOption('edit-field-article-primary-target-aud-und-13010');
        $this->checkOption('edit-field-article-primary-channel-und-13011');
        $this->selectOption('Primary category','News');
        //$this->selectOption('Secondary category','General');
        //$this->checkOption('edit-field-article-contributed-conten-und-yes');
        //$this->checkOption('edit-field-article-includes-video-emb-und-yes');
        //$this->checkOption('edit-field-article-includes-audio-emb-und-yes');
        //$this->selectOption('Related Companies','8tracks','Actian');
        //$this->selectOption('Related Languages','ActionScript');
        //$this->checkOption('edit-field-article-featured-und-yes');
        //$this->selectOption('Product','Dobango');
    }


    /**
     * @When /^I set date in "([^"]*)" with \+ "([^"]*)" minutes$/
     */
    public function iSetDateInWithMinutes2($field, $value)
    {
        $date = new Datetime('now + '.$value.' minutes', new DateTimeZone("America/New_York"));
        $field = $this->fixStepArgument($field);
        $this->getSession()->getPage()->fillField($field, $date->format('Y-m-d'));

    }



    /**
     * @When /^I set date in "([^"]*)" with \+ "([^"]*)" seconds$/
     */
    public function iSetDateInWithSeconds($field, $value)
    {
        $field = $this->fixStepArgument($field);
        $date = new Datetime('now + '.$value.' seconds', new DateTimeZone("America/New_York"));
        $this->getSession()->getPage()->fillField($field, $date->format('Y-m-d H:i:s'));
    }

    /**
     * @When /^I set date in "([^"]*)" and "([^"]*)" with \+ "([^"]*)" seconds$/
     */
    public function iSetDateInAndWithSeconds($arg1, $arg2, $arg3)
    {
      $arg1 = $this->fixStepArgument($arg1);
      $arg2 = $this->fixStepArgument($arg2);
      $date = new Datetime('now + '.$arg3.' seconds', new DateTimeZone("America/New_York"));
      $this->getSession()->getPage()->fillField($arg1, $date->format('Y-m-d'));
      $this->getSession()->getPage()->fillField($arg2, $date->format('H:i:s'));
    }

    /**
     * @Then /^I should be redirected to article page "([^"]*)" \+ current day$/
     */
    public function iShouldBeRedirectedToArticlePageCurrentDay($arg1)
    {
        $this->getSession();//->wait(10000);
        $date = new Datetime('now', new DateTimeZone("America/New_York"));
        $path = $arg1.$date->format('Y/m/d');
        $this->assertPageAddress($path);
    }


    /**
     * @Given /^go to "([^"]*)" \+ current day$/
     */
    public function goToCurrentDay($arg1)
    {
        $date = new Datetime('now', new DateTimeZone("America/New_York"));
        $path = $arg1.$date->format('Y/m/d');
        $this->getSession()->visit($this->locatePath($path));
    }


    /**
     * @Given /^I wait for "([^"]*)" mins$/
     */
    public function iWaitForMins($arg1)
    {
        $this->getSession()->wait($arg1*60*1000);
    }


    /**
     * @Given /^I wait for "([^"]*)" secs$/
     */
    public function iWaitForSecs($arg1)
    {
        $this->getSession()->wait($arg1*1000);
    }

    /**
     * @Then /^I fill api values with "([^"]*)"$/
     */
    public function iFillApiValuesWith($title)
    {
      $this->fillField('API Name', $title);
      $this->fillField('API Provider', 'testapiprovider1');
      $this->fillField('API Endpoint', 'testapiendpoint1');
      $this->fillField('edit-field-api-home-page-und-0-url', 'http://testapihomepage1.com');
      $this->selectOption('Primary Category','Action');
      $this->selectOption('Secondary Categories','Accidents');
      $this->fillField('API Description', 'testapidescription1');
      $this->selectOption('Data Marshaling','AMF3');
      $this->checkOption('edit-field-other-data-marshaling-und');
      $this->fillField('Other options', 'testotheroption1');
      $this->fillField('Related to?', 'testrelatedtobox1');
      $this->fillField('Differentiators', 'testdifferentiators1');
      $this->checkOption('edit-field-are-you-the-owner-und-yes');
    }


    /**
     * Click on the element with the provided CSS Selector
     *
     * @When /^I click on the element with css selector "([^"]*)"$/
     */
    public function iClickOnTheElementWithCSSSelector($cssSelector)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('css', $cssSelector) // just changed xpath to css
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS Selector: "%s"', $cssSelector));
        }

        $element->click();

    }


    /**
     * Click on the element with the provided xpath query
     *
     * @When /^I click on the element with xpath "([^"]*)"$/
     */
    public function iClickOnTheElementWithXPath($xpath)
    {
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        // ok, let's click on it
        $element->click();

    }

    /*
     *
     * @Then /^Delete node with url "([^"]*)" \+ current day$/
     */
    public function deleteNodeWithUrl($arg1) {
        $date = new Datetime('now', new DateTimeZone("America/New_York"));
        $path = $arg1.$date->format('Y/m/d');

        $this->iLogOnAs("admin");
        $this->visit($path);
        $this->iClick("Edit");
        $this->iPressButton("Delete");
        $this->assertPageContainsText("This action cannot be undone.");
        $this->iPressButton("Delete");
        $this->assertPageContainsText('has been deleted.');
        $this->iClick("Logout");
    }

    /**
     * @Then /^I fill api values with "([^"]*)" as pwstaff user$/
     */
    public function iFillApiValuesWithAsPwstaffUser($title)
    {
      $this->fillField('API Name', $title);
      $this->fillField('API Provider', 'testapiprovider1');
      $this->fillField('API Endpoint', 'testapiendpoint1');
      $this->fillField('edit-field-api-home-page-und-0-url', 'http://testapihomepage1.com');
      $this->selectOption('Primary Category','Action');
      $this->selectOption('Secondary Categories','Accidents');
      $this->fillField('API Description', 'testapidescription1');
      $this->selectOption('Data Marshaling','AMF3');
      $this->checkOption('edit-field-other-data-marshaling-und');
      $this->fillField('Other options', 'testotheroption1');
      $this->fillField('Related to?', 'testrelatedtobox1');
      $this->fillField('Differentiators', 'testdifferentiators1');
      $this->checkOption('edit-field-are-you-the-owner-und-yes');
      $this->selectOption('Actual API Provider', 'Accenture');
      $this->checkOption('edit-field-deadpool-checkbox-und-1');
      $this->fillField('Admin Comments', 'test admin comments');
      $this->fillField('edit-field-apihub-url-und-0-url', 'http://testapihomepage1.com');
      $this->attachFileToField('edit-field-image-upload-und-0-upload','download.png');
      $this->pressButton('edit-field-image-upload-und-0-upload-button');
      $this->fillField('Top Match Search Text', 'test top match search text');
      $this->selectOption('SSL Support','Yes');
      $this->fillField('Twitter Url', 'testtwitterurl');
      $this->fillField('Changelog', 'testchangelog');
    }

    /**
     * @Then /^I fill mashup values with "([^"]*)"$/
     */
    public function iFillMashupValuesWith($title)
    {
      $this->fillField('Mashup Name', $title);
      $this->fillField('Company', 'testcompany');
      $this->fillField('URL', 'http://www.google.com');
      $this->checkOption('edit-field-mashup-app-type-und-mobile');
      $this->fillField('edit-field-api-und-0-target-id', 'Nokia Maps (33774)');
//      $this->iWaitForSecs(3);
//      $this->iClickOnTheText('Nokia Maps');
      $this->selectOption('Primary Category','Actors');
      $this->selectOption('Secondary Category','Adventure');
      $this->fillField('Mashup Description', 'test mashup description');
      $this->attachFileToField('edit-field-mashup-image-und-0-upload','download.png');
      $this->pressButton('edit-field-mashup-image-und-0-upload-button');
      $this->checkOption('edit-field-mashup-yours-und');
    }
    /**
     * @Then /^I fill mashup values with "([^"]*)" as pwstaff user$/
     */
    public function iFillMashupValuesWithAsPwstaffUser($title)
    {
      $this->fillField('Mashup Name', $title);
      $this->fillField('Company', 'testcompany');
      $this->fillField('URL', 'http://www.google.com');
      $this->checkOption('edit-field-mashup-app-type-und-mobile');
      $this->fillField('edit-field-api-und-0-target-id', 'Nokia Maps (33774)');
//      $this->iWaitForSecs(3);
//      $this->iClickOnTheText('Nokia Maps');
      $this->selectOption('Primary Category','Actors');
      $this->selectOption('Secondary Category','Adventure');
      $this->fillField('Mashup Description', 'test mashup description');
      $this->attachFileToField('edit-field-mashup-image-und-0-upload','download.png');
      $this->pressButton('edit-field-mashup-image-und-0-upload-button');
      $this->checkOption('edit-field-mashup-yours-und');
      $this->checkOption('edit-field-mashup-deadpool-und');
      $this->fillField('Admin Comments', 'test admin comment');
      $this->checkOption('edit-field-mashup-minor-edit-und');
      $this->fillField('Changelog', 'test changelog text');
    }
    /**
     * @Then /^I fill howto-sourcecode values with "([^"]*)"$/
     */
    public function iFillHowtoSourcecodeValuesWith($title)
    {
      $this->fillField('How-To/Source-Code Name', $title);
      $this->fillField('URL', 'http://www.google.com');
      $this->fillField('edit-field-api-und-0-target-id', 'Nokia Maps (33774)');
//      $this->iWaitForSecs(3);
//      $this->iClickOnTheText('Nokia Maps');
      $this->selectOption('Language/Platform','Ajax');
      $this->selectOption('Primary Category','Actors');
      $this->selectOption('Secondary Category','Adventure');
      $this->fillField('Description', 'testdescription');
      $this->attachFileToField('edit-field-howto-image-und-0-upload','download.png');
      $this->pressButton('edit-field-howto-image-und-0-upload-button');
      $this->checkOption('edit-field-howto-source-yours-und');
    }
    /**
     * @Then /^I fill howto-sourcecode values with "([^"]*)" as pwstaff user$/
     */
    public function iFillHowtoSourcecodeValuesWithAsPwstaffUser($title)
    {
      $this->iFillHowtoSourcecodeValuesWith($title);
      $this->checkOption('edit-field-howto-deadpool-und');
      $this->checkOption('edit-field-source-code-included-und');
      $this->fillField('Admin Comments', 'test admin comment');
      $this->checkOption('edit-field-howto-minor-edit-und');
      $this->fillField('Changelog', 'test changelog text');
    }

    /**
     * @Then /^I should check time with "([^"]*)"$/
     */
    public function iShouldCheckTimeWith($arg1)
    {
      $date = new Datetime('now', new DateTimeZone($arg1));
      $date_value = $date->format('Y-m-d');
      $time_value = $date->format('H:i');
      $date_in_field = 'E.g., '.$date->format('Y-m-d');
      $time_in_field = 'E.g., '.$date->format('H:i');
      $text = 'The current local time is '.$date_value.' '.$time_value;
      $this->assertSession()->pageTextContains($this->fixStepArgument($text));
      $this->assertSession()->pageTextContains($this->fixStepArgument($arg1));
      $this->assertSession()->pageTextContains($this->fixStepArgument($date_in_field));
      $this->assertSession()->pageTextContains($this->fixStepArgument($time_in_field));
    }

    /**
     * @Then /^I fill framework-library values with "([^"]*)"$/
     */
    public function iFillFrameworkLibraryValuesWith($title)
    {
      $this->fillField('Framework/Library Name', $title);
      $this->selectOption('Framework/Library Provider','Telenor');
      $this->fillField('URL', 'http://www.google.com');
      $this->fillField('edit-field-api-und-0-target-id', 'Nokia Maps (33774)');
      $this->selectOption('Languages','EMML');
      $this->selectOption('Framework/Library Provider','Telenor');
      $this->selectOption('Resource Type','Library');
      $this->selectOption('Primary Category','Actors');
      $this->selectOption('Secondary Category','Adventure');
      $this->fillField('Framework/Library Description', 'test description');
      $this->attachFileToField('edit-field-resource-image-und-0-upload','download.png');
      $this->pressButton('edit-field-resource-image-und-0-upload-button');
      $this->checkOption('edit-field-resource-yours-und');
    }

    /**
     * @Then /^I fill framework-library values with "([^"]*)" as pwstaff user$/
     */
    public function iFillFrameworkLibraryValuesWithAsPwstaffUser($title)
    {
      $this->iFillFrameworkLibraryValuesWith($title);
      $this->checkOption('edit-field-resource-deadpool-und');
      $this->fillField('Admin Comments', 'test admin comment');
      $this->checkOption('edit-field-resource-minor-edit-und');
      $this->fillField('Changelog', 'test changelog text');
    }

    /**
     * @When /^I run "([^"]*)"$/
     */
    public function iRun($command)
    {
      exec($command, $output);
      $this->output = trim(implode("\n", $output));
    }

}


