<?php

/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/26/13
 * Time: 8:39 AM
 */
class Version {

  private $version = '';

  function __construct($version) {
    $this->version = $version;
  }

  /**
   * Function to convert number format like 1.2.4 or 12.54.04 to 100200400 or 1200540040.
   *
   * Each place should have 3 digit after conversion, like 1 in 1.2.4 should has 100 and 2 should has 200 and so on.
   * First place digit will be always multiply by 100.
   * Except first, if strlen of digit is 1 then multiply it by 100, if strlen is 2 then multiply it by 10.
   *
   * @param integer $MAX_CHARS
   *   Maximum number of characters between dots in versions.
   * @return string $str_number
   *   Numeric version number.
   */
  public function getNumericVersion($MAX_CHARS = 3) {
    $num_arr = array();
    $str_number = '';
    $string_length = strlen($this->version);
    $numbers = explode(".", $this->version);

    if ($string_length >= 5 && $string_length < 9) {
      foreach ($numbers as $key => $num) {
        if ($key == 0) {
          $version = $num * pow(10, $MAX_CHARS - 1);
        }
        else {
          $version = $num * pow(10, $MAX_CHARS - strlen($num));
        }
        $prefix = str_repeat('0', ($MAX_CHARS - strlen($version) > 0 ? $MAX_CHARS - strlen($version) : 0));
        $num_arr[] = (string) ($prefix . $version);
      }
    }
    if (sizeof($num_arr) > 0) {
      $str_number = implode("", $num_arr);
    }
    return $str_number;
  }


  /**
   * Function to get closest min number.
   *
   * @param array $min_array
   *   min version array
   * @return integer $key
   *   array key as $key
   */
  public function getOlderVersion($min_array) {
    arsort($min_array);
    foreach ($min_array as $key => $min) {
      if ($min < $this->version) {
        return $key;
      }
    }
    return $key;
  }


  /**
   * Function to get closest max number
   *
   * @param array $max_array
   *   max version array
   * @return integer $key
   *   array key as $key
   */
  public function getNewerVersion($max_array) {
    asort($max_array);
    foreach ($max_array as $key => $max) {
      if ($max > $this->version) {
        return $max;
      }
    }
    return $key;
  }
} 