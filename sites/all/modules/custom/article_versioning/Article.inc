<?php
/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/23/13
 * Time: 7:17 PM
 */

class Article implements IArticle {

  public function getMinVersion() {
    return '';
  }

  public function setMinVersion() {
  }

  public function getMaxVersion() {
    return '';
  }

  public function setMaxVersion() {
  }

  public function getBaseArticleId() {
    return '';
  }

  public function setBaseArticleId() {

  }

  /**
   * Returns TRUE if the input object is an article.
   *
   * @param $obj
   * @return bool
   */
  public static function isArticle($obj) {
    if (!empty($obj->type) && in_array($obj->type, array('raptor_article'))) {
      return TRUE;
    }

    return FALSE;
  }
} 