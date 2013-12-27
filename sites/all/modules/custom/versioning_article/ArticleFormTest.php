<?php
/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/26/13
 * Time: 9:50 AM
 */

require_once 'PHPUnit/Autoload.php';
define('DRUPAL_ROOT', getcwd());
require_once DRUPAL_ROOT . '/includes/bootstrap.inc';
require_once DRUPAL_ROOT .'/sites/all/modules/custom/versioning_article/ArticleForm.class.inc';
drupal_override_server_variables();
drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

class ArticleFormTest extends PHPUnit_Framework_TestCase {

  public function testEmptyArticleCloneFormAlter() {
    $form = array();
    $formClass = new ArticleForm($form);
    $formClass->alterArticleForm();
    $form = $formClass->getForm();
    $this->assertEquals($form['field_version'][LANGUAGE_NONE]['#default_value'], 'defined');
    $this->assertEquals($form['#validate'][0], 'versioning_article_validate');
  }
}