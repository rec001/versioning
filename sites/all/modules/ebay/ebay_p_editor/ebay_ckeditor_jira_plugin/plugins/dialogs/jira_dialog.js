CKEDITOR.dialog.add('jiraDialog', function(editor) {"use strict";

	var jql;
	var startAt;
	var maxResults;
	var showHeader;
	var pluginPath = CKEDITOR.plugins.getFilePath('jira');
	pluginPath = pluginPath.substring(0, pluginPath.lastIndexOf('/'));
	var headerFields = {
		'T' : true,
		'Key' : true,
		'P' : true,
		'Summary' : true,
		//'Assignee' : false,
		//'Reporter' : false,
		'Status' : true,
		'Created' : false,
		'Updated' : false
	};
	
	var date = new Date();
	var dateStr = date.getMonth() + '/' + date.getDate() + '/' + date.getFullYear();
	var dummyRow = {
		'T' : '<img src="' + pluginPath + '/icons/type_demo.png">',
		'Key' : 'CONTENT-1234',
		'P' : '<img src="' + pluginPath +'/icons/priority_demo.png">',
		'Summary' : 'This is a dummy issue',
		//'Assignee' : 'Bob',
		//'Reporter' : 'Alice',
		'Status' : '<img src="' + pluginPath +'/icons/status_demo">Open',
		'Created' : dateStr,
		'Updated' : dateStr
	};

	var dialog = {
		// Basic properties of the dialog window: title, minimum size.
		title : Drupal.t('Insert JIRA Issues'),
		minWidth : 400,
		minHeight : 300,
		// Dialog window contents definition.
		contents : [{
			id : 'tab-advance',
			label : Drupal.t('Insert Issues by JQL'),
			elements : [{
				type : 'text',
				id : 'jql',
				label : Drupal.t('JQL'),
				widths : ['20%', '80%'],
				labelLayout : 'horizontal',
				align : 'center',
				setup : function(element) {
					this.setValue(jql);
				},
				validate : function() {
					var key = this.getValue().trim();
					if (key == null || key.length <= 0) {
						alert('You must specify a JQL string');
						return false;
					}
				},
				commit : function(element) {
					jql = this.getValue();
				}
			}, {
				type : 'hbox',
				widths : ['45%', '55%'],
				children : [{
					type : 'text',
					id : 'start-at',
					label : Drupal.t('Start At'),
					widths : ['40%', '60%'],
					labelLayout : 'horizontal',
					align : 'center',
					setup : function(element) {
						this.setValue(startAt);
					},
					validate : function() {
						var intRegex = /^\d+$/;
						if (!intRegex.test(this.getValue().trim())) {
							alert('Start At must be an non-negtive integer');
							return false;
						}
					},
					commit : function(element) {
						startAt = this.getValue().trim();
					}
				}, {
					type : 'text',
					id : 'max-results',
					label : Drupal.t('Max Results'),
					widths : ['40%', '60%'],
					labelLayout : 'horizontal',
					align : 'center',
					setup : function(element) {
						this.setValue(maxResults);
					},
					validate : function() {
						var intRegex = /^\d+$/;
						if (!intRegex.test(this.getValue().trim())) {
							alert('Max Results must be an non-negtive integer');
							return false;
						}
					},
					commit : function(element) {
						maxResults = this.getValue().trim();
					}
				}]
			}]
		}],

		onShow : function() {
			// default settings
			jql = '';
			startAt = '0';
			maxResults = '10';
			showHeader = true;
			// get the selection
			var selection = editor.getSelection();
			// get the entire element
			var element = selection.getStartElement();

			// looking for the div parent tag
			if (element) {
				element = element.getAscendant('div', true);
			}
			// check the class
			if (!element || !element.hasClass('editor-inline-jira')) {
				// it is a addtion
				element = new CKEDITOR.dom.element('div');
				element.addClass('editor-inline-jira');
				this.insertMode = true;
			} else {
				jql = element.getText();
				var data = element.getAttribute('jql_options');
				var options = data.split(',');
				for (var i = 0; i < options.length; i++) {
					var pair = options[i].split('=');
					if (pair[0].trim() == 'startAt') {
						startAt = pair[1].trim();
					}
					if (pair[0].trim() == 'maxResults') {
						maxResults = pair[1].trim();
					}
				}
				
				data = element.getAttribute('table_options');
				options = data.split(',');
				for (var i = 0; i < options.length; i++) {
					var pair = options[i].split('=');
					var key = pair[0].trim();
					var value = pair[1].trim();
					if (key === 'showHeader') {
						showHeader = value === 'true';
					}else if (headerFields.hasOwnProperty(key)) {
						headerFields[key] = value === 'true';
					}
				}
				console.log(headerFields);
				console.log(showHeader);
				//console.log(maxResults);
				this.insertMode = false;
			}

			this.element = element;
			this.setupContent(this.element);
		},

		onOk : function() {
			var element = this.element;
			this.commitContent(element);
			//console.log(jql);
			//console.log(startAt);
			//console.log(maxResults);
			var imgPath = pluginPath + '/icons/jira.png';
			element.setHtml('<img src="' + imgPath + '"><span>' + jql + '</span>');
			element.setAttribute('jql_options', 'startAt=' + startAt + ',maxResults=' + maxResults);
			var fields = '';
			var keys = Object.keys(headerFields);
			for (var i = 0; i < keys.length; i++) {
				fields += ',' + keys[i] + '=' +  headerFields[keys[i]];
			}
			element.setAttribute('table_options', 'showHeader=' + showHeader + fields);
			for (var i = 0; i < element.getChildCount(); i++) {
				element.getChild(i).unselectable();
			}
			if (this.insertMode) {
				editor.insertElement(element);
			}
		}
	};
	
	var generateDummyTable = function (sHeader) {
		var table = '<table style="border: 1px solid #BEBFB9; font-size: 0.9em; margin: 0 0 10px; width: 100%">';
		var header = '';
		var row = '';
		var keys = Object.keys(headerFields);
		for (var i = 0; i < keys.length; i++) {
			if (headerFields[keys[i]]) {
				header += '<th style="background: none-rpeat scroll 0 0 #E1E2DC; border: 1px solid #BEBFB9;">' + keys[i] + '</th>';
				row += '<td style="border: 1px solid #BEBFB9;">' + dummyRow[keys[i]] + '</td>';
			}
		}
		if (sHeader) {
			table += '<tr>' + header + '</tr>';
		}
		table += '<tr>' + row + '</tr>';
		table += '</table>';
		return table;
	};
	
	var createChboxLabel = function() {
		var obj = {};
		obj.type = 'html';
		obj.id = 'instruction-html';
		obj.html = '<p>Check the blow checkboxes to include the columns in table.</p>';
		return obj;
	};
	
	var createChboxForHeaderFields = function (label, val) {
		var obj = {};
		obj.type = 'checkbox';
		obj.id = 'header-' + label;
		if (label === 'T') {
			obj.label = Drupal.t(label + '(Issue Type)');
		}else if (label === 'P'){
			obj.label = Drupal.t(label + '(Priority)');
		}else {
			obj.label = Drupal.t(label);
		}
		obj.setup = function (element) {
			this.setValue(headerFields[label]);
		};
		obj.onClick = function (element) {
			headerFields[label] = this.getValue();
			var demoTable = document.getElementById('demo-table');
			if (demoTable) {
				demoTable.innerHTML = generateDummyTable(showHeader);
			}
		};
		
		return obj;
	};
	
	var createHtmlInDialog = function () {
		var htmlObj = {};
		htmlObj.type = 'html';
		htmlObj.id = 'demo-table';
		htmlObj.html = '<div id="demo-table">' + generateDummyTable(true) + '</div>';
		htmlObj.onShow = function (element) {
			var newHTML = generateDummyTable(showHeader);
			document.getElementById('demo-table').innerHTML = newHTML;
			this.html = '<div id="demo-table">' + newHTML + '</div>';
		};
		
		return htmlObj;
	};
	
	var createShowHeaderChbox = function () {
		var obj = {};
		obj.type = 'checkbox';
		obj.id = 'show-header';
		obj.label = Drupal.t('Show Table Header');
		obj.setup = function (element) {
			this.setValue(showHeader);
		};
		obj.onClick = function (element) {
			showHeader = this.getValue();
			var demoTable = document.getElementById('demo-table');
			if (demoTable) {
				demoTable.innerHTML = generateDummyTable(showHeader);
			}
		};
		
		return obj;
	};
	
	var showHeaderChbox = createShowHeaderChbox();
	dialog.contents[0].elements.push(createShowHeaderChbox());
	dialog.contents[0].elements.push(createHtmlInDialog());
	dialog.contents[0].elements.push(createChboxLabel());
	var labels = Object.keys(headerFields);
	for (var i = 0; i < labels.length; i++) {
		if (labels[i] !== 'Key' && labels[i] !== 'Summary') {
			dialog.contents[0].elements.push(createChboxForHeaderFields(labels[i], headerFields[labels[i]]));
		}
	}

	return dialog;
}); 