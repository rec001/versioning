<?php

/**
 * Created by PhpStorm.
 * User: neeravbm
 * Date: 12/26/13
 * Time: 8:10 AM
 */
class ArticleForm {

  private $form, $form_state;


  /**
   * Instantiates the ArticleForm object.
   */
  function __construct() {
    $arguments = func_get_args();
    switch (sizeof($arguments)) {
      case 2:
        $this->form_state = $arguments[1];
      case 1:
        $this->form = $arguments[0];
        break;
    }
  }


  /**
   * Returns the form array.
   *
   * @return array $form
   *   Form array.
   */
  public function getForm() {
    return $this->form;
  }


  /**
   * Returns the form state array.
   *
   * @return array $form_state
   *   Form state array.
   */
  public function getFormState() {
    return $this->form_state;
  }


  /**
   * Alters the form array.
   *
   * @param bool $clone
   *   Whether the article is being cloned or not.
   */
  public function alterArticleForm($clone = FALSE) {
    // set a custom flag for redirect to article
    //$this->setArticleRedirect();
    // Set the default version to be "defined" since this is a node clone.
    $this->setDefaultVersion('defined');
    if ($clone) {
      // Set the minimum version options.
      $new_min_options = $this->setMinVersionOptions();

      if (isset($this->form['field_max_version'])) {
        // Set the max version options.
        $new_max_options = $this->setMaxVersionOptions();

        // Set default value if Max Version number is not None.
        $this->setDefaultMinVersion($new_max_options, $new_min_options);
      }
    }
    $this->addArticleFormValidateHandlers($clone);
    $this->addArticleFormSubmitHandlers($clone);
  }


  /**
   * Get the version options that can be shown in the form.
   *
   * @param array $options
   *   Array of current options.
   * @return array $new_options
   *   Array of new options to be displayed.
   */
  private function getVersionOptions($options) {
    unset($options['_none']);

    $new_options = array();
    module_load_include('inc', 'versioning_article', 'Version.class');
    foreach ($options as $key => $value) {
      $versionClass = new Version($value);
      $value = $versionClass->getNumericVersion();
      $new_options[$key] = $value;
    }

    return $new_options;
  }


  /**
   * Validate the Article Clone form.
   *
   * @return array $errors
   *   Array of errors, if there is any error. A blank array if there is no error.
   */
  public function validateArticleCloneForm() {
    $version = $this->getSubmittedVersion();
    module_load_include('inc', 'versioning_article', 'Version.class');

    $min_version_class = new Version($this->getSubmittedMinVersion());
    $min_version = $min_version_class->getNumericVersion();

    $max_version_class = new Version($this->getSubmittedMaxVersion());
    $max_version = $max_version_class->getNumericVersion();

    $errors = array();
    if ($version == 'defined') {
      if ($min_version == '') {
        $errors[] = array('field_min_version', t('Min version cannot be None.'));
      }
      elseif (($min_version != '' && $max_version != '') && ($min_version > $max_version)) {
        $errors[] = array('field_min_version', t('Min version cannot be greater than Max version.'));
      }
      elseif (($min_version != '' && $max_version != '') && ($min_version == $max_version)) {
        $errors[] = array('field_min_version', t('Min version cannot be equal to Max version.'));
      }
    }
    else {
      if ($version == 'global') {

      }
    }

    return $errors;
  }

  /**
   * Sets the default version field.
   *
   * @param string $value
   *   Default value to be set.
   */
  private function setDefaultVersion($value) {
    $this->form['field_version'][LANGUAGE_NONE]['#default_value'] = $value;
  }

  /**
   * Sets article redirect.
   *
   * @param integer base_article_nid
   *   node nid of base article
   */
  private function setArticleRedirect($base_article_nid) {
    $this->form_state['globalredirect'] = array(
      '#type' => 'value',
      '#value' => $base_article_nid,
    );
    // Unpublish current node
    $this->form_state['values']['status'] = 0;
  }

  /**
   * Returns the minimum version options.
   *
   * @return array $new_min_options
   *   Minimum version options.
   */
  private function setMinVersionOptions() {
    if (isset($this->form['field_min_version'])) {
      $options = $this->getVersionOptions($this->form['field_min_version'][LANGUAGE_NONE]['#options']);
      if (sizeof($options)) {
        $new_min_options = $options;
        $this->form['field_min_version'][LANGUAGE_NONE]['#options'] = array('_none' => '- None -') + $new_min_options;
        return $new_min_options;
      }
    }
    return array('_none' => '- None -');
  }

  /**
   * Returns the maximum version options.
   *
   * @return array $new_max_options
   *   Maximum version options.
   */
  private function setMaxVersionOptions() {
    $options = $this->getVersionOptions($this->form['field_max_version'][LANGUAGE_NONE]['#options']);
    if (sizeof($options)) {
      $new_max_options = $options;
      $this->form['field_max_version'][LANGUAGE_NONE]['#options'] = array('_none' => '- None -') + $new_max_options;
      return $new_max_options;
    }
    return array('_none' => '- None -');
  }

  /**
   * Sets the default minimum version.
   *
   * @param array $new_max_options
   *   Minimum version options array.
   * @param array $new_min_options
   *   Maximum version options array.
   */
  private function setDefaultMinVersion($new_max_options, $new_min_options) {
    if (!empty($this->form['field_max_version'][LANGUAGE_NONE]['#default_value'])) {
      $max_default = $this->form['field_max_version'][LANGUAGE_NONE]['#default_value'][0];
      $max_version_term = taxonomy_term_load($max_default);
      $max_default_value = $new_max_options[$max_default];

      $versionClass = new Version($max_default_value);
      $min_default = $versionClass->getOlderVersion($new_min_options);

      $this->form['field_min_version'][LANGUAGE_NONE]['#default_value'][0] = $min_default;
    } // Max version number that is None, Set Min version number field to the highest possible version number.
    else {
      $max_in_min = max($new_min_options);
      $max_in_min_key = array_search($max_in_min, $new_min_options);
      $this->form['field_min_version'][LANGUAGE_NONE]['#default_value'][0] = $max_in_min_key;
    }
  }

  /**
   * Returns the version checkbox selected by the user.
   *
   * @return integer $version
   *   Version checkbox selected by the user.
   */
  private function getSubmittedVersion() {
    if (isset($this->form_state['values']['field_version'])) {
      $version = $this->form_state['values']['field_version'][LANGUAGE_NONE][0]['value'];
      return $version;
    }
    return '';
  }

  /**
   * Returns the minimum version selected by the user.
   *
   * @return integer $min_version
   *   Minimum version selected by the user. Blank if user did not select anything.
   */
  private function getSubmittedMinVersion() {
    return $this->getVersionMinMax('field_min_version');
  }

  /**
   * Returns the maximum version selected by the user.
   *
   * @return integer $max_version
   *   Maximum version selected by the user. Blank if user did not select anything.
   */
  private function getSubmittedMaxVersion() {
    return $this->getVersionMinMax('field_max_version');
  }

  /**
   * Add custom validate handlers to Article Clone form.
   *
   * @param bool $clone
   *   TRUE if the article is being cloned and FALSE otherwise.
   */
  private function addArticleFormValidateHandlers($clone) {
    if ($clone) {
      $this->form['#validate'][] = 'versioning_article_validate';
    }
  }

  /**
   * Add custom submit handlers to Article Clone form.
   *
   * @param bool $clone
   *   TRUE if the article is being cloned and FALSE otherwise.
   */
  private function addArticleFormSubmitHandlers($clone) {
    $this->form['actions']['submit']['#submit'][] = 'versioning_article_submithandler';
  }

  /**
   * Returns min or max version field value.
   *
   * @param string $field_name
   *   Name of the field: field_min_version or field_max_version.
   * @return string $version
   *   Value of the min or max version field. If it's not set, an empty string is returned.
   */
  private function getVersionMinMax($field_name) {
    $version = '';
    if (isset($this->form_state['values'][$field_name]) && !empty($this->form_state['values'][$field_name][LANGUAGE_NONE][0])) {
      $version_tid = $this->form_state['values'][$field_name][LANGUAGE_NONE][0]['tid'];
      $version_term = taxonomy_term_load($version_tid);
      if (is_object($version_term)) {
        $version = $version_term->name;
      }
    }
    return $version;
  }
}
