CKEDITOR.plugins.add('toc', {
	icons : 'toc',

	init : function(editor) {

		// Adding as an editor command.
		editor.addCommand('toc', {
			exec : function(editor) {
      			var element = new CKEDITOR.dom.element('div');
      			element.addClass('editor-inline-toc');
      			var pluginPath = CKEDITOR.plugins.getFilePath('toc');
    			var imgPath = pluginPath.substring(0, pluginPath.lastIndexOf('/')) + '/icons/toc_inline.png';
      			element.setHtml('<img src="' + imgPath + '"><!--tableofcontents-->');
      			element.getChild(0).unselectable();
				editor.insertElement(element);
			}
		});
		
		editor.addCommand('tocRemove', {
        	exec : function(editor) {
        		var selection = editor.getSelection();
				// get the entire element
      			var element = selection.getStartElement();
      			if (element) {
	        		var toc = element.getAscendant('div', true);
	                if(toc && toc.hasClass('editor-inline-toc')) {
	                    toc.remove();
	                }
				}
        	}
        });
        
        if (editor.contextMenu) {
            editor.addMenuGroup('tocGroup');
            
            editor.addMenuItem('tocItemRemove', {
                label   : Drupal.t('Remove Table of Contents'),
                command : 'tocRemove',
                group   : 'tocGroup'
            });

            editor.contextMenu.addListener( function(element) {
            	var toc = element.getAscendant('div', true);
                if(toc && toc.hasClass('editor-inline-toc')) {
                    return { tocItemRemove: CKEDITOR.TRISTATE_OFF };
                }
            });
        }

		// Registering the button UI.
		editor.ui.addButton('toc', {
			label : Drupal.t('Table of Contents'),
			command : 'toc',
			toolbar : 'toc',
			icon : this.path + "icons/toc.png",
		});
	}
});
