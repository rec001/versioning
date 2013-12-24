<?php
/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/23/13
 * Time: 7:11 PM
 */

interface IArticleGroup {

  public function getBaseArticleId();
  public function setBaseArticleId($article_id);

  public function getIArticles();
  public function setIArticles();

} 