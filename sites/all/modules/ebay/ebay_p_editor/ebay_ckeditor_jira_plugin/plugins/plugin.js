CKEDITOR.plugins.add('jira', {
    icons: 'jira',
    
    init: function(editor) {
    	
    	// add the css for the plugin in edit area
    	editor.config.contentsCss.push(this.path + 'css/editor_inline_style.css');

        editor.addCommand('jiraCommand', new CKEDITOR.dialogCommand('jiraDialog'));
        editor.addCommand('jiraRemove', {
        	exec : function(editor) {
        		var selection = editor.getSelection();
				// get the entire element
      			var element = selection.getStartElement();
      			if (element) {
	        		var jira = element.getAscendant('div', true);
	                if(jira && jira.hasClass('editor-inline-jira')) {
	                    jira.remove();
	                }
				}
        	}
        });

        editor.ui.addButton('jira', {
            label   : Drupal.t('Insert JIRA Issue'),
            command : 'jiraCommand',
            toolbar : 'jira',
            icon : this.path + "icons/jira.png",
        });

        if (editor.contextMenu) {
            editor.addMenuGroup('jiraGroup');
            editor.addMenuItem('jiraItem', {
                label   : Drupal.t('Edit JIRA Issue'),
                icon    : this.path + "icons/jira.png",
                command : 'jiraCommand',
                group   : 'jiraGroup'
            });
            
            editor.addMenuItem('jiraItemRemove', {
                label   : Drupal.t('Remove JIRA Issue'),
                command : 'jiraRemove',
                group   : 'jiraGroup'
            });

            editor.contextMenu.addListener( function(element) {
            	var jiraContainer = element.getAscendant('div', true);
                if(jiraContainer && jiraContainer.hasClass('editor-inline-jira')) {
                    return { jiraItem: CKEDITOR.TRISTATE_OFF };
                }
            });
            
            editor.contextMenu.addListener( function(element) {
            	var jiraContainer = element.getAscendant('div', true);
                if(jiraContainer && jiraContainer.hasClass('editor-inline-jira')) {
                    return { jiraItemRemove: CKEDITOR.TRISTATE_OFF };
                }
            });
        }

        CKEDITOR.dialog.add('jiraDialog', this.path + 'dialogs/jira_dialog.js' );
    }
});