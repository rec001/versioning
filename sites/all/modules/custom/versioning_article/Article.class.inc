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
   * @sortby 
   *   version (asc) and Min version (asc)
   * @Contextual_filters integar $nid
   *   current node's nid
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
   * @return integer $nid 
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
   * @return integer $nid 
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
   * @return integer $version_value 
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
	public function getVersionsForDefined(){
	  $version_applies = array();
	  module_load_include('inc', 'versioning_article', 'Version.class');
		// get current node min version numeric value
		$current_min_version = $this->getVersionValueByTid($this->getMinVersionTermId());
		$version_class = new Version($current_min_version);
		$current_min = $version_class->getNumericVersion();
		
		// get current node max version numeric value			
		$current_max_version = $this->getVersionValueByTid($this->getMaxVersionTermId());
		$version_class = new Version($current_max_version);
		$current_max = $version_class->getNumericVersion();
		
		//load all versions
		$vid = taxonomy_vocabulary_machine_name_load("raptor_versions")->vid;
    $terms = taxonomy_get_tree($vid);
    
    if (sizeof ($terms) > 0){
		  foreach ($terms as $term) {
				
				$versions_value = $term->name;
				$version_class = new Version($versions_value);
		    $versions = $version_class->getNumericVersion();
				
				if ($versions >= $current_min && $versions < $current_max) {
		      $version_applies[] = $term->tid;
		      // set version to current node
		      $version_applies = array_unique($version_applies);
		    }
			}
			
			if (sizeof($version_applies)) {
			  $this->setVersions($version_applies);
			}
		}
		return $version_applies;
	}
	
	
	/**
   * Set the versions.
   *
   * @param integer $versions_tid
   *   Term id to be set.
   */
  public function setVersions($versions_tid) {
		if (sizeof($versions_tid) > 0) {
		   foreach ($versions_tid as $key => $val) {
				 $this->article->field_versions[LANGUAGE_NONE][$key]['tid'] = $val;
			 }
		}
  }
  
  /* 
	 * Function to get all applied versions from articles
	 * @return array $versions
	 *   array contains key and value as tid for versions
	 */
  public function getAllAppliedVersions() {
		$versions = array();
		$version = array('defined', 'global');
		$base_article_list = $this->getBaseArticleNodeList();
		if (sizeof($base_article_list) > 0) {
			foreach ($base_article_list as $article_list) {
				if (in_array($article_list->field_data_field_version_field_version_value, $version)) {
					if (sizeof ($article_list->field_field_versions) > 0){
						foreach ($article_list->field_field_versions as $term) {
							 $tid = $term['raw']['tid'];
							 $versions[$tid] = $tid;
						  }
						}	
					}
				}
			}
		  return $versions;
		}
  
  /* 
	 * Figure out which versions are left out from defined version
	 * 
	 * Get all applied versions and get all versions terms.
	 * Figure out which version terms are left using array_diff
	 * Now setVersions if there any result from array_diff
	 * 
	 * @return array $versions
	 *   array contains key and value as versions tid
	 */
  public function getVersionsForGlobal() {
		$applied_versions = $this->getAllAppliedVersions();
		$versions = array();
		
		//load all versions
		$vid = taxonomy_vocabulary_machine_name_load("raptor_versions")->vid;
    $terms = taxonomy_get_tree($vid);
    
    if (sizeof ($terms) > 0){
		  foreach ($terms as $term) {
			  $versions[$term->tid] = $term->tid;
		  }
	  }
	  
	  //figure out which versions are left out for current global version
		if (sizeof($applied_versions) > 0) {
			$versions = array_diff($versions, $applied_versions);
			$this->setVersions($versions);
		}
		
		return $versions;
	}
	/* 
	 * Function to redirect to article based on session
	 * @para integer session_vars
	 *   session value as version tid
	 */
  public function redirectBasedOnSession($session_vars) {
		// get a list of all published nodes that have the same Base Article Id
		$base_article_list = $this->getBaseArticleNodeList();
		
		module_load_include('inc', 'versioning_article', 'Version.class');
		// default values
		$article_min = '';
		$article_max = '';
		
		if (sizeof($base_article_list) > 0) {
			foreach ($base_article_list as $article_list) {
				if ($article_list->field_data_field_version_field_version_value == 'defined') {
					  // load all version
					  $vid = taxonomy_vocabulary_machine_name_load("raptor_versions")->vid;
						$terms = taxonomy_get_tree($vid);
					  
					  if (sizeof ($terms) > 0){
							foreach ($terms as $term) {
								  $versionClass = new Version($term->name);
									$value = $versionClass->getNumericVersion();
									$versions[$term->tid] = $value;
							}
							$highest_version_number = max($versions);
							$lowest_version_number = min($versions);
					  }
					  // get version numeric value using tid from $versions
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
						else if ($session_var == $lowest_version_number && $article_min == '') {
							return $article_list->nid;
						}
			  } 
			  else if ($article_list->field_data_field_version_field_version_value == 'global') { {
					return $article_list->nid;
				}
			}
    }
    
	 }
	 return '';
 }
	/**
	 * Function to validate article access
	 * If min version is set to None, then check all the version from the lowest to one less than the max version. 
	 * If max version is set to None, then check all version from min version to the highest version. 
	 * If field_published of any version is checked, then return NODE_ACCESS_ALLOW. Otherwise return NODE_ACCESS_DENY.
	 */
	public function accessRaptorArticle(){
	  $version_applies = array();
	  module_load_include('inc', 'versioning_article', 'Version.class');
		
		//load all versions
		$vid = taxonomy_vocabulary_machine_name_load("raptor_versions")->vid;
    $terms = taxonomy_get_tree($vid);
    
    //get version highest and lowest numeric values
    if (sizeof ($terms) > 0){
			$version = array();
			foreach ($terms as $term) {
					$versionClass = new Version($term->name);
					$value = $versionClass->getNumericVersion();
					$version[$term->tid] = $value;
			}
			$highest_version_number = max($version);
			$lowest_version_number = min($version);
		}
		
		// get current node min version numeric value
		$current_min_version = $this->getVersionValueByTid($this->getMinVersionTermId());
		$version_class = new Version($current_min_version);
		$current_min = $version_class->getNumericVersion();
		
		
		// get current node max version numeric value			
		$current_max_version = $this->getVersionValueByTid($this->getMaxVersionTermId());
		$version_class = new Version($current_max_version);
		$current_max = $version_class->getNumericVersion();
		
		//one less than the max version
		$current_max_old_version = $versionClass->getOlderVersion($version);
		$current_max_by_one = $version[$current_max_old_version];
					  
    //get All Published Terms
    $getAllPublishedTerms = $this->getAllPublishedTerms();
    
    if (sizeof ($terms) > 0){
		  foreach ($terms as $term) {
				$versions_value = $term->name;
				$versions_tid = $term->tid;
				$version_class = new Version($versions_value);
		    $versions = $version_class->getNumericVersion();
		    
				// if version is greater than or equal to min version and less than max version.
				if ($versions >= $current_min && $versions < $current_max) {
		      if (in_array($versions_tid, $getAllPublishedTerms)) {
		        return TRUE;
				  } 
		    } 
		    // If min version is set to None, then check all the version from the lowest to one less than the max version. 
		    else if ( ( $current_min == '') && ( $versions >= $lowest_version_number && $versions < $current_max_by_one)) {
					if (in_array($versions_tid, $getAllPublishedTerms)) {
		        return TRUE;
				  } 
				} 
				// If max version is set to None, then check all version from min version to the highest version. 
				else if ( ( $current_max == '' ) && ( $versions >= $current_min && $versions < $highest_version_number) ) {
					if (in_array($versions_tid, $getAllPublishedTerms)) {
		        return TRUE;
				  } 
				} 
			}	
		}
		return $version_applies;
	}
	/**
	 * Function get all published term
	 * @return array $taxonomy_terms
	 */
	function getAllPublishedTerms() {
		$taxonomy_terms = array();
	  $query = new EntityFieldQuery();
		$entities = $query->entityCondition('entity_type', 'taxonomy_term')
			->entityCondition('bundle', 'raptor_versions')
			->fieldCondition('field_published', 'value', 1, '=')
			->execute();
		if (!empty($entities['taxonomy_term'])) {
			$taxonomy_terms = array_keys($entities['taxonomy_term']);
		}
	  return $taxonomy_terms;
	}
	
}
