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
		$articleId = '';
		if(!empty($this->article->field_base_article[LANGUAGE_NONE][0])){
			$articleId = field_get_items('node', $this->article, 'field_base_article');
			$articleId = $articleId[0]['target_id'];
		}
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
		$version_field = '';
		if(!empty($this->article->field_version[LANGUAGE_NONE][0])){
      $version_field = field_get_items('node', $this->article, 'field_version');
      $version_field = $version_field[0]['value'];
	  }
    return $version_field;
  }


  /**
   * Returns the term id set in the Min Version field.
   *
   * @return integer $min_version_tid
   *   Min version term id.
   */
  public function getMinVersionTermId() {
		$min_version_tid = '';
    // Get the min version
    if(!empty($this->article->field_min_version[LANGUAGE_NONE][0])){
			$min_version_tid = field_get_items('node', $this->article, 'field_min_version');
			$min_version_tid = $min_version_tid[0]['tid'];
	  }
    return $min_version_tid;
  }


  /**
   * Set the term id in the min version field.
   *
   * @param integer $min_version_tid
   *   Term id to be set.
   */
  public function setMinVersionTermId($min_version_tid) {
    $this->article->field_min_version[LANGUAGE_NONE][0]['tid'] = $min_version_tid;
  }


  /**
   * Returns the term id set in the Max Version field.
   *
   * @return integer $max_version_tid
   *   Max version term id.
   */
  public function getMaxVersionTermId() {
		$max_version_tid = '';
		if(!empty($this->article->field_max_version[LANGUAGE_NONE][0])){
      $max_version_tid = field_get_items('node', $this->article, 'field_max_version');
      $max_version_tid = $max_version_tid[0]['tid'];
	  }
    return $max_version_tid;
  }


  /**
   * Set the term id in the max version field.
   *
   * @param integer $max_version_tid
   *   Term id to be set.
   */
  public function setMaxVersionTermId($max_version_tid) {
    $this->article->field_max_version[LANGUAGE_NONE][0]['tid'] = $max_version_tid;
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

  /**
   * Function to get a list of all node which have same base article.
   *
   * @return mixed $result
   *   an associative array contains nid, node_title, and field_field_version
   */
  public function getBaseArticleNodeList() {
    $nid = $this->article->nid;
    $view = views_get_view('versioned_articles');
    $view->set_display('block');
    $view->set_arguments(array($nid));
    $view->render();
    $view->pre_execute();
    $view->execute();
    return $result = $view->result;
  }
  
  /**
   * Function to get a check if there any node have global version.
   *
   * @return integar $nid 
   *   node is of base article
   */
  public function isGlobalVersion(){
		$base_article_list = $this->getBaseArticleNodeList();
		if (sizeof($base_article_list) > 0) {
			foreach ($base_article_list as $article_list) {
				if ($article_list->field_data_field_version_field_version_value == 'global') {
					return $article_list->nid;
				}
			}
    }
    return '';
	}
	
	/**
   * Function to get a check if there any node have defined version.
   *
   * @return integar $nid 
   *   node is of base article
   */
  public function isDefinedHasConflictVersion(){
		module_load_include('inc', 'versioning_article', 'Version.class');
		$article_min = '';
		$article_max = '';
		
		$current_min_version = $this->getVersionValueByTid($this->getMinVersionTermId());
		$version_class = new Version($current_min_version);
		$current_min = $version_class->getNumericVersion();
					
		$current_max_version = $this->getVersionValueByTid($this->getMaxVersionTermId());
		$version_class = new Version($current_max_version);
		$current_max = $version_class->getNumericVersion();
		
		$base_article_list = $this->getBaseArticleNodeList();
		if (sizeof($base_article_list) > 0) {
			foreach ($base_article_list as $article_list) {
				if ($article_list->field_data_field_version_field_version_value == 'defined') {
					
					if (!empty($article_list->field_field_min_version_1)) {
						$article_min_version = $article_list->field_field_min_version_1[0]['raw']['taxonomy_term']->name;
						$version_class = new Version($article_min_version);
						$article_min = $version_class->getNumericVersion();
				  }
					
					if (!empty($article_list->field_field_max_version_1)) {
						$article_max_version = $article_list->field_field_max_version_1[0]['raw']['taxonomy_term']->name;
						$version_class = new Version($article_max_version);
						$article_max = $version_class->getNumericVersion();
					}
					
					if ($current_min <= $article_max || $current_max <= $article_min) {
						return $article_list->nid;
					}
				}
			}
    }
    return '';
	}
	
  
 /**
   * Function to get version value from version tid.
   *
   * @return integar $version_value 
   *   version value;
   */
	public function getVersionValueByTid($version_tid){
		$version_value = '';
		$version_term = taxonomy_term_load($version_tid);
      if (is_object($version_term)) {
        $version_value = $version_term->name;
      }
    return $version_value;
	}
	
	
	/* 
	 * Function to get all versions a article applies
	 */
	public function getVersions(){
	  $version_applies = array();
	  module_load_include('inc', 'versioning_article', 'Version.class');
		
		$current_min_version = $this->getVersionValueByTid($this->getMinVersionTermId());
		$version_class = new Version($current_min_version);
		$current_min = $version_class->getNumericVersion();
					
		$current_max_version = $this->getVersionValueByTid($this->getMaxVersionTermId());
		$version_class = new Version($current_max_version);
		$current_max = $version_class->getNumericVersion();
		$vid = taxonomy_vocabulary_machine_name_load("raptor_versions")->vid;
    $terms = taxonomy_get_tree($vid);
    
    if (sizeof ($terms) > 0){
		  foreach ($terms as $term) {
				
				$versions_value = $term->name;
				$version_class = new Version($versions_value);
		    $versions = $version_class->getNumericVersion();
				
				if ($versions >= $current_min && $versions < $current_max) {
		      $version_applies[] = $term->tid;
		      $this->setVersions($version_applies);
		    }
			}	
		}
	}
	
	/**
   * Set the versions.
   *
   * @param integer $versions_tid
   *   Term id to be set.
   */
  public function setVersions($versions_tid) {
		if (sizeof ($versions_tid) > 0) {
		   foreach ($versions_tid as $key => $val) {
				 $this->article->field_versions[LANGUAGE_NONE][$key]['tid'] = $val;
			 }
		}
  }
  
  
  /* 
	 * Function to get all global version articles and find out which articles version range
	 */
  public function getGlobalVersions() {
		$global_versions = array();
		$defind_versions = array();
		$defind_versions = $this->getVersions();
		$base_article_list = $this->getBaseArticleNodeList();
		$article_min = '';
		$article_max = '';
		if (sizeof($base_article_list) > 0) {
			foreach ($base_article_list as $article_list) {
				if ($article_list->field_data_field_version_field_version_value == 'global') {
					if (sizeof ($article_list->field_field_versions) > 0){
						foreach ($article_list->field_field_versions as $term) {
							 $versions_tid = $term['raw']['tid'];
							 $global_versions[] = $versions_tid;
						  }
						}	
					}
				}
			}
			//figure out which versions are left out
			if (sizeof($defind_versions) > 0) {
				$versions = array_diff($defind_versions, $global_versions);
				$this->setVersions($versions);
			}
	}
	
	
	/* 
	 * Function to redirect to article based on session
	 * @para integar session_vars
	 *   session value as tid
	 */
  public function redirectBasedOnSession($session_vars) {
		$base_article_list = $this->getBaseArticleNodeList();
		module_load_include('inc', 'versioning_article', 'Version.class');
		
		if (sizeof($base_article_list) > 0) {
			foreach ($base_article_list as $article_list) {
				if ($article_list->field_data_field_version_field_version_value == 'defined') {
					 $vid = taxonomy_vocabulary_machine_name_load("raptor_versions")->vid;
						$terms = taxonomy_get_tree($vid);
					  if (sizeof ($terms) > 0){
							foreach ($terms as $term) {
								  $versionClass = new Version($term->name);
									$value = $versionClass->getNumericVersion();
									$versions[$term->key] = $value;
									$highest_version_number = max($versions);
									$lowest_version_number = min($versions);
							}
					  }
					  
					  $session_var = $versions[$session_vars];
					  
					  if (!empty($article_list->field_field_min_version_1)) {
							$article_min_version = $article_list->field_field_min_version_1[0]['raw']['taxonomy_term']->name;
							$version_class = new Version($article_min_version);
							$article_min = $version_class->getNumericVersion();
						}
						
						if (!empty($article_list->field_field_max_version_1)) {
							$article_max_version = $article_list->field_field_max_version_1[0]['raw']['taxonomy_term']->name;
							$version_class = new Version($article_max_version);
							$article_max = $version_class->getNumericVersion();
						}
						// Min Version <= $SESSION['version']['Raptor'] < Max Version.
					  if ($article_min <= $session_var && $session_var < $article_max) {
							return $article_list->nid;
						} 
						// If $SESSION['version']['Raptor'] is the highest version number, then select the node with Max Version set to None. 
						else if ($session_var == $highest_version_number && $article_max == '') {
							return $article_list->nid;
						} 
						//  If $SESSION['version']['Raptor'] is the lowest version number, then select the node with Min Version set to None. 
						else if ($session_var == $highest_version_number && $article_min == '') {
							return $article_list->nid;
						}
			  } 
			  else if ($article_list->field_data_field_version_field_version_value == 'global') { {
					return $article_list->nid;
				}
			}
    }
    return '';
	}
	
	
}
