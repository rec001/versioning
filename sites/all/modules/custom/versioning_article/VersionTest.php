<?php
/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/26/13
 * Time: 5:26 PM
 */

require_once 'PHPUnit/Autoload.php';
define('DRUPAL_ROOT', getcwd());
require_once DRUPAL_ROOT . '/includes/bootstrap.inc';
require_once DRUPAL_ROOT .'/sites/all/modules/custom/versioning_article/Version.class.inc';
drupal_override_server_variables();
drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

class VersionTest extends PHPUnit_Framework_TestCase {

  public function testNumericVersionConversion() {
    $version = new Version('1.3.2');
    $this->assertEquals($version->getNumericVersion(), '100300200');
    $this->assertEquals($version->getNumericVersion(5), '100003000020000');
    $this->assertEquals($version->getNumericVersion(1), '132');

    $version = new Version('0.23.498');
    $this->assertEquals($version->getNumericVersion(), '000230498');
    $this->assertEquals($version->getNumericVersion(5), '000002300049800');
  }

}
 