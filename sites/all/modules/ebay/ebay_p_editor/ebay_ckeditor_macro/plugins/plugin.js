CKEDITOR.plugins.add('macro', {
    icons: 'info',
    
    init: function(editor) {
    	// add the css for the plugin in edit area
    		editor.config.contentsCss.push(this.path + '../ebay_ckeditor_macro.css');

        editor.addCommand('macroCommand', new CKEDITOR.dialogCommand('macroDialog'));
        editor.addCommand('macroRemove', {
        	exec : function(editor) {
        		var selection = editor.getSelection();
				// get the entire element
      			var element = selection.getStartElement();
      			if (element) {
	        		var panelMacro = element.getAscendant('div', true);
	                if(panelMacro && panelMacro.hasClass('panelMacro')) {
	                    panelMacro.remove();
	                }
				}
        	}
        });

        editor.ui.addButton('macro', {
            label   : Drupal.t('Info, Note, Warning'),
            command : 'macroCommand',
            toolbar : 'macro',
            icon : this.path + "icons/info.png",
        });

        if (editor.contextMenu) {
            editor.addMenuGroup('macroGroup');
            editor.addMenuItem('macroItem', {
                label   : Drupal.t('Edit Info/Note/Warning'),
                icon    : this.path + "icons/info.png",
                command : 'macroCommand',
                group   : 'macroGroup'
            });
            editor.addMenuItem('macroItemRemove', {
                label   : Drupal.t('Remove Info/Note/Warning'),
                command : 'macroRemove',
                group   : 'macroGroup'
            });

            editor.contextMenu.addListener( function(element) {
            	var panelMacro = element.getAscendant('div', true);
                if(panelMacro && panelMacro.hasClass('panelMacro')) {
                    return { macroItem: CKEDITOR.TRISTATE_OFF };
                }
            });
            
            editor.contextMenu.addListener( function(element) {
            	var panelMacro = element.getAscendant('div', true);
                if(panelMacro && panelMacro.hasClass('panelMacro')) {
                    return { macroItemRemove: CKEDITOR.TRISTATE_OFF };
                }
            });
        }

        CKEDITOR.dialog.add('macroDialog', this.path + 'dialogs/macro_dialog.js' );
    }
});