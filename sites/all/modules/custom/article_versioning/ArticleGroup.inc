<?php
/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/23/13
 * Time: 7:21 PM
 */

class ArticleGroup implements IArticleGroup {

  private $versionArticleMap = array();

  public function getBaseArticleId();


  /**
   * Set Base Article Id for the Article Group.
   *
   * @param $article_id
   */
  public function setBaseArticleId($article_id) {
    foreach ($this->versionArticleMap as $version => $iArticle) {
      $iArticle->setBaseArticleId($article_id);
    }
  }

  public function getIArticles();
  public function setIArticles();

}