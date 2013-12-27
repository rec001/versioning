<?php

/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/23/13
 * Time: 7:07 PM
 */
interface IArticle {

  public function getMinVersion();

  public function setMinVersion();

  public function getMaxVersion();

  public function setMaxVersion();

  public function getBaseArticleId();

  public function setBaseArticleId();

  public static function isArticle($obj);
} 