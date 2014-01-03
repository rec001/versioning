CKEDITOR.dialog.add('macroDialog', function(editor) {"use strict";

	var types = [
		['Info', 'info'],
		['Note', 'note'],
		['Warning', 'warning'],
	];
	
	var showIcon;
	var macroType;
	var macroTitle;
	var macroBody;
	
	var dialog = {
		// Basic properties of the dialog window: title, minimum size.
    title : Drupal.t('Insert Macro'),
    minWidth : 300,
    minHeight : 100,
    // Dialog window contents definition.
    contents :
    [{
    	id : 'macro-container',
    	label : Drupal.t('Insert Macro'),
    	elements : [
	    	{
	    		type : 'hbox',
	    		widths : ['40%', '60%'],
	    		align : 'center',
	    		children : [
	    			{
	    				type : 'select',
	    				id : 'type-select',
	    				items : types,
	    				'default' : types[0][1],
	    				setup : function(element) {
	    					this.setValue(macroType);
	    				},
	    				commit : function(element) {
	    					macroType = this.getValue();
	    				}
	    			},
	    			/*{
	    				type : 'text',
	    				id : 'macro-title',
	    				label : Drupal.t('Title'),
	    				widths : ['20%', '80%'],
	    				labelLayout	: 'horizontal',
	    				align : 'center',
	    				setup	: function(element) {
	            	this.setValue(macroTitle);
	            },
	            commit : function(element) {
	            	macroTitle = this.getValue();
	            }
	    			},*/
	    			{
	    				type : 'checkbox',
	    				id : 'show-icon',
	    				label : Drupal.t('Show icon'),
	    				setup	: function(element) {
	            	this.setValue(showIcon);
	            },
	            commit : function(element) {
	            	showIcon = this.getValue();
	            }
	    			}
	    		]
	    	}/*,
	    	{
	    		type : 'textarea',
	    		id	: 'body',
	    		label : Drupal.t('Body'),
	    		rows : 10,
	    		setup	: function(element) {
	    			this.setValue(macroBody);
	        },
	        commit : function(element) {
	        	macroBody = this.getValue();
	        	//macroBody = htmlEscape(this.getValue());
	        }
	    	}*/
    	]
    }],
    
    onShow : function() {
    	// default settings
    	showIcon = true;
			macroType = types[0][1];
			macroBody = '';
			
			// get the selection
			var selection = editor.getSelection();
			// get the entire element
      var element = selection.getStartElement();

			// looking for the div parent tag
      if(element) {
      	element = element.getAscendant('div', true);
      }
      // check the class
      if (!element || !element.hasClass('ebay-ckeditor-macro')) {
      	// it is a addtion
      	element = new CKEDITOR.dom.element('div');
      	element.addClass('ebay-ckeditor-macro');
      	this.insertMode = true;
      }else {
      	// get macro type
      	var table = element.getChild(0);
      	//console.log(element.getHtml());
      	var clsName = table.getAttribute('class');
      	macroType = clsName.substring(0, clsName.indexOf('Macro'));
      	//console.log('get type: ' + macroType);
      	// get show icon
      	var colgroup = table.getElementsByTag('colgroup');
      	if (colgroup && colgroup.count() > 0) {
      		showIcon = true;
      	}else {
      		showIcon = false;
      	}
      	//console.log('show icon: ' + showIcon);
      	// get title
      	var tds = table.getElementsByTag('td');
      	var title;
      	if (showIcon) {
      		title = tds.getItem(1);
      	}else {
      		title = tds.getItem(0);
      	}
      	//console.log(title.getHtml());
      	/*if (title.getChild(0).getName() == 'b') {
      		macroTitle = title.getChild(0).getText();
      	}*/
      	//console.log('get title: ' + macroTitle);
      	// get body
      	macroBody = title.getHtml();
      	//console.log(macroBody);
      	/*if (macroTitle.length > 0) {
      		macroBody = body.substring(('<b>' + macroTitle + '</b><br>').length);
      	}else {
      		macroBody = body;
      	}*/
      	//console.log(macroBody);
      	this.insertMode = false;
      }
      
      this.element = element;
      this.setupContent(this.element);
    },
    
    onOk : function() {
    	var element = this.element;
    	this.commitContent(element);
    	//console.log(macroBody);
    	//console.log(macroType);
    	//console.log(macroTitle);
    	//console.log(showIcon);
    	// clear the inner html
    	element.setHtml('');
    	// set up new child elements
    	var table = new CKEDITOR.dom.element('table');
    	//table.unselectable();
    	table.addClass(macroType + 'Macro');
    	element.append(table);
    	if (showIcon) {
    		table.setHtml('<colgroup><col width=\'24\'><col></colgroup>');
    	}
    	var tr = new CKEDITOR.dom.element('tr');
    	table.append(tr);
    	if (showIcon) {
    		var pluginPath = CKEDITOR.plugins.getFilePath('macro');
    		var imgPath = pluginPath.substring(0, pluginPath.lastIndexOf('/')) + '/icons/' + macroType + '.png';
    		tr.setHtml('<td valign=\'top\'><img src="' + imgPath +'" width="16" height="16" align="absmiddle" alt="" border="0"></td>');
    		// do not let users select the icon field
    		//tr.getChild(0).unselectable();
    	}
    	var td = new CKEDITOR.dom.element('td');
    	tr.append(td);
    	/*if (macroTitle.length > 0) {
    		td.append(CKEDITOR.dom.element.createFromHtml('<b>' + macroTitle + '</b>'));
    		// do not let users select the title field
    		td.getChild(0).unselectable(0);
    		td.append(new CKEDITOR.dom.element('br'));
    	}*/
    	/*var lines = macroBody.split('\n');
    	for (var i = 0; i < lines.length; i++) {
    		td.append(CKEDITOR.dom.element.createFromHtml('<p>' + lines[i] + '</p>'));
    	}*/
    	//console.log(macroBody);
    	td.appendHtml(macroBody);
    	
    	if(this.insertMode) {
    		editor.insertElement(element);
      }
    }
	};

	return dialog;

});

/*function htmlEscape(str) {
    return String(str)
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
}*/