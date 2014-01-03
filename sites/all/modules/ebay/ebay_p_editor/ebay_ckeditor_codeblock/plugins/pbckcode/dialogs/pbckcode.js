CKEDITOR.dialog.add('pbckcodeDialog', function ( editor ) {
    "use strict";

    // if there is no user settings
    // create an empty object
    if(editor.config.pbckcode === undefined) {
        editor.config.pbckcode = {};
    }

    // default settings object
    var DEFAULT_SETTINGS = {
        cls   : '',
				modes : [
					['Text', 'text'],
					['C/C++', 'c_cpp'],
					['C#', 'csharp'],
					['CSS', 'css'],
					['HTML', 'html'],
					['Java', 'java'],
					['Javascript', 'javascript'],
					['Perl', 'perl'],
					['PHP', 'php'],
					['Python', 'python'],
					['Ruby', 'ruby'],
					['Scala', 'scala'],
					['Bash', 'sh'],
					['SQL', 'sql'],
					['XML', 'xml'],
			],
    	theme : 'clouds',
    	highlighter : "SYNTAX_HIGHLIGHTER"
    };

    // merge user settings with default settings
    var settings = merge_settings(DEFAULT_SETTINGS, editor.config.pbckcode);

    // init vars
    var AceEditor,
        shighlighter = new PBSyntaxHighlighter(settings.highlighter);
        
    var startLineNum;
	var highlight;
	var collapse;
	var showLineNum;

    // dialog code
    return {
        // Basic properties of the dialog window: title, minimum size.
        title: editor.lang.pbckcode.title,
        minWidth: 600,
        minHeight: 400,
        // Dialog window contents definition.
        contents:
        [{
            id       : 'code-container',
            label    : editor.lang.pbckcode.title,
            elements :
            [{
            	type		: 'hbox',
            	widths		: ['20%', '20%', '20%', '30%'],
            	align		: 'left',
            	children	: [{
                	type      : 'select',
                	id        : 'code-select',
                	items     : settings.modes,
                	'default' : settings.modes[0][1],
                	setup     : function(element) {
                    	if(element) {
                        	element = element.getAscendant('pre', true);
                        	this.setValue(element.getAttribute("data-pbcklang"));
                    	}
                	},
                	commit    : function(element) {
                    	if(element) {
                        	element = element.getAscendant('pre', true);
                        	element.setAttribute("data-pbcklang", this.getValue());
                    	}
                	},
                	onChange  : function(element) {
                    	AceEditor.getSession().setMode("ace/mode/" + this.getValue());
                	}
            	},
            	{
            		type		: 'checkbox',
            		id			: 'collapse',
            		label		: 'Collapse',
            		setup		: function(element) {
            			this.setValue(collapse);
            		},
            		commit		: function(element) {
            			collapse = this.getValue();
            		}
            	},
            	{
            		type		: 'checkbox',
            		id			: 'show-line-num',
            		label		: 'Show Line Number',
            		setup		: function(element) {
            			this.setValue(showLineNum);
            		},
            		commit		: function(element) {
            			showLineNum = this.getValue();
            		}
            	},
            	{
            		type		: 'text',
            		id			: 'first-line',
            		label		: 'First Line Number',
            		labelLayout	: 'horizontal',
            		widths		: [50, 50],
            		align		: 'left',
            		'default'	: '1',
            		setup		: function(element) {
            			this.setValue(startLineNum);
            		},
            		validate	: function() {
            				var intRegex = /^\d+$/;
            				if(!intRegex.test(this.getValue().trim())) {
            					alert('First Line Number should be a integer');
            					return false;
            				}
            		},
            		commit		: function(element) {
            			startLineNum = this.getValue().trim();
            		}
            	}]
            },
            {
            	type		: 'text',
            	id			: 'highlight',
            	label		: 'Highlight Line Numbers (Comma seperated, i.e. 1,2,3)',
            	labelLayout	: 'horizontal',
            	setup		: function(element) {
            		this.setValue(highlight);
            	},
            	validate	:function(element) {
            		var regex = /^\d+(,?\s*\d+)*$/;
            		if(this.getValue().length > 0 && !regex.test(this.getValue().trim())) {
            			alert('Malformed line numbers');
            			return false;
            		}
            	},
            	commit		: function(element) {
            		var val = this.getValue().trim();
            		if (val != null && val.length > 0) {
            			highlight = '[' + val + ']';
            		}else {
            			highlight = '';
            		}
            	}
            },
            {
                type  : 'html',
                html  : '<div id="code_' + editor.codeId + '"></div>',
                id    : 'code-textarea',
                style : 'position: absolute; top: 120px; left: 10px; right: 10px; bottom: 50px;',
                setup : function(element) {
                    // get the value of the editor
                    var code = element.getHtml();

                    // replace some regexp
                    code = code.replace(new RegExp('<br/>', 'g'), '\n');
                    code = code.replace(new RegExp('<br>', 'g'), '\n');
                    code = code.replace(new RegExp('&lt;', 'g'), '<');
                    code = code.replace(new RegExp('&gt;', 'g'), '>');
                    code = code.replace(new RegExp('&amp;', 'g'), '&');

                    AceEditor.setValue(code);
                },
                commit : function(element) {
                    element.setText(AceEditor.getValue());
                }
            }]
        }],
        onLoad : function() {
            // we load the ACE plugin to our div
            AceEditor = ace.edit("code_" + editor.codeId);
            AceEditor.getSession().setMode("ace/mode/" + settings.modes[0][1]);
            AceEditor.setTheme("ace/theme/" + settings.theme);

            // save the AceEditor into the editor object for the resize event
            editor.aceEditor = AceEditor;
        },
        onShow : function() {
        	// clean the settings
        	startLineNum = '1';
			highlight = '';
			collapse = false;
			showLineNum = true;
            // get the selection
            var selection = editor.getSelection();
            // get the entire element
            var element = selection.getStartElement();

            // looking for the pre parent tag
            if(element) {
                element = element.getAscendant('pre', true);
            }
            // if there is no pre tag, it is an addition. Therefore, it is an edition
            if(!element || element.getName() !== 'pre') {
                element = new CKEDITOR.dom.element('pre');

                if(shighlighter.getTag() !== 'pre') {
                    element.append(new CKEDITOR.dom.element('code'));
                }
                this.insertMode = true;
            }
            else {
            	// get the setting params for each block
            	var params = extract_params(element);
            	
            	if ('first-line' in params) {
            		startLineNum = params['first-line'];
            	}
            	if ('collapse' in params) {
            		collapse = params['collapse'] == 'true';
            		//alert(collapse);
            	}
            	if ('highlight' in params) {
            		//alert(params['highlight']);
            		highlight = params['highlight'];
            		// eliminate the '[' ']'
            		highlight = highlight.substr(1, highlight.length - 2);
            	}
            	if ('gutter' in  params) {
            		showLineNum = params['gutter'] == 'true';
            	}
                if(shighlighter.getTag() !== 'pre') {
                    element = element.getChild(0);
                }
                this.insertMode = false;
            }
            // get the element to fill the inputs
            this.element = element;

            // we empty the editor
            AceEditor.setValue('');

            // we fill the inputs
            //if(!this.insertMode) {
                this.setupContent(this.element);
            //}
        },
        // This method is invoked once a user clicks the OK button, confirming the dialog.
        onOk : function() {
            var pre, element;
            pre = element = this.element;

            if(this.insertMode) {
                if(shighlighter.getTag()  !== 'pre') {
                    element = this.element.getChild(0);
                }
            } else {
                pre = element.getAscendant('pre', true);
            }

            this.commitContent(element);

            // set the full class to the code tag
            // hack to make it compatible to syntaxhighlighter
			var brush = pre.getAttribute("data-pbcklang");
			if (brush == 'text') {
				brush = 'plain';
			}
			if (brush == 'sh') {
				brush = 'bash';
			}
			if (brush == 'c_cpp') {
				brush = 'cpp';
			}
			if (brush == 'javascript') {
				brush = 'jscript';
			}
            //shighlighter.setCls(pre.getAttribute("data-pbcklang") + " " + settings.cls);
            shighlighter.setCls(brush + " " + settings.cls);

			// get additional settings
			var clsName = shighlighter.getCls();
			if (startLineNum != 1) {
				clsName += ';first-line:' + startLineNum;
			}
			if (highlight.length > 0) {
				clsName += ';highlight:' + highlight;
			}
			clsName += ';collapse:' + collapse;
			clsName += ';gutter:' + showLineNum;
            element.setAttribute('class', clsName);

            // we add a new code tag into ckeditor editor
            if(this.insertMode) {
                editor.insertElement(pre);
            }
        }
    };
});

/*
 * Resize the ACE Editor
 */
CKEDITOR.dialog.on('resize', function(evt) {
    var AceEditor = evt.editor.aceEditor;
    if(AceEditor !== undefined) {
        AceEditor.resize();
    }
});

/**
 * Merge defaults settings with user settings
 * @param  {Object} dft the default object
 * @param  {Object} usr the user object
 * @return {Object} the merged object
 */
function merge_settings(dft, usr){
    "use strict";

    var obj3 = {};
    for (var attrname in dft) { obj3[attrname] = dft[attrname]; }
    for (var attrname in usr) { obj3[attrname] = usr[attrname]; }
    return obj3;
}

/**
 * Extract the parameter from class name
 * @param {Object} the DOM element of the code block
 */
function extract_params(element) {
	var params = new Object;
	var clsName = element.getAttribute('class');
	var settings = clsName.split(';');
	for (var i=0; i<settings.length; i++) {
		settings[i] = settings[i].trim();
		if (settings[i].length > 0) {
			var tmp = settings[i].split(':');
			if (tmp[0] != null && tmp[0].trim().length > 0 && tmp[1] != null && tmp[1].trim().length > 0) {
				params[tmp[0].trim()] = tmp[1].trim();
			}
		}
	}
	return params;
}
