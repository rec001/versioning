Insert a table of JIRA issues according to JQL in CKEditor in Drupal

## Dependencies
* [CKEditor](https://drupal.org/project/ckeditor)

## Screenshots

### User Interface
![Interface tag](_md/jira_ui.PNG)

### Display in the Editor
![InEditorDisplay tag](_md/jira_editor_display.PNG)

### Actual Display
![ActualDisplay tag](_md/jira_actural_display.PNG)

## Usage

Go to "/admin/config/content/ckeditor/edit/Basic" to change the profile configuration of CKEditor to use this plugin module.

In "Editor appearance" section, check the "CKEditor Plugin -- Jira Link v0.1" in ***Plugin*** and add "jira" in ***Toolbar***.
![Configuration  tag](_md/plugin_config.PNG)
![Configuration  tag](_md/toolbar_config.PNG)

Go to "/admin/config/content/formats" add the filter "eBay CKEditor JIRA Plugin Filter" to a designated Text Format.
![Configuration  tag](_md/filter_config.PNG)

The result of the JQL will be displayed as a table while rendering the page. The table has the class name with "jira-table". If you want to have a specific display of a JIRA table, you can set the styles in the theme css to apply to the "jira-table" class.
