<?php
/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/26/13
 * Time: 10:31 AM
 */

class Article {

  /**
   * @var stdClass $article
   *   Node object.
   */
  private $article;

  /**
   * Instantiate the article object.
   *
   * @param stdClass $article
   *   Node object.
   */
  function __construct($article) {
    $this->article = $article;
  }

  /**
   * Returns base article id.
   *
   * @return integer $nid
   *   Base article id.
   */
  public function getBaseArticleId() {
    $articleId = field_get_items('node', $this->article, 'field_base_article');
    $articleId = $articleId[0]['target_id'];
    return $articleId;
  }

  /**
   * Sets the base article id.
   *
   * @param integer $articleId
   *   Set the base article id.
   */
  public function setBaseArticleId($articleId) {
    $this->article->field_base_article[LANGUAGE_NONE][0]['target_id'] = $articleId;
  }


  /**
   * Returns the node object.
   *
   * @return stdClass $article
   *   Node object.
   */
  public function getArticle() {
    return $this->article;
  }


  /**
   * Returns whether the article is published.
   *
   * @return bool $published
   *   1 if published, 0 if not.
   */
  public function isPublished() {
    return $this->article->status;
  }


  /**
   * Returns the value set in field_version.
   *
   * @return string $version
   *   Value set in field_version.
   */
  public function getVersionField() {
    $version_field = field_get_items('node', $this->article, 'field_version');
    $version_field = $version_field[0]['value'];
    return $version_field;
  }


  /**
   * Returns the term id set in the Min Version field.
   *
   * @return integer $min_version_tid
   *   Min version term id.
   */
  public function getMinVersionTermId() {
    // Get the min version
    $min_version_tid = field_get_items('node', $this->article, 'field_min_version');
    $min_version_tid = $min_version_tid[0]['tid'];
    return $min_version_tid;
  }


  /**
   * Set the term id in the min version field.
   *
   * @param integer $min_version_tid
   *   Term id to be set.
   */
  public function setMinVersionTermId($min_version_tid) {
    $this->article[LANGUAGE_NONE][0]['tid'] = $min_version_tid;
  }


  /**
   * Returns the term id set in the Max Version field.
   *
   * @return integer $max_version_tid
   *   Max version term id.
   */
  public function getMaxVersionTermId() {
    $max_version_tid = field_get_items('node', $this->article, 'field_max_version');
    $max_version_tid = $max_version_tid[0]['tid'];
    return $max_version_tid;
  }


  /**
   * Set the term id in the max version field.
   *
   * @param integer $max_version_tid
   *   Term id to be set.
   */
  public function setMaxVersionTermId($max_version_tid) {
    $this->article[LANGUAGE_NONE][0]['tid'] = $max_version_tid;
  }


  /**
   * Returns the article id from which the current article has been cloned.
   *
   * @return mixed $original_nid
   *   Returns id of the original article from which the current article is cloned. Returns blank if the article is not
   *   being cloned.
   */
  public function getCloneFromOriginalArticleId() {
    return (isset($this->article->clone_from_original_nid) ? $this->article->clone_from_original_nid : '');
  }
}