/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbar = 'Basic'; //default
	config.extraPlugins = 'confighelper';
	config.placeholder = 'Type here...';

	//======== load ck finder for upload=========
	config.filebrowserBrowseUrl = '/static/third_party/ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl = '/static/third_party/ckfinder/ckfinder.html?type=Images';
	config.filebrowserFlashBrowseUrl = '/static/third_party/ckfinder/ckfinder.html?type=Flash';
	config.filebrowserUploadUrl = '/static/third_party/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = '/static/third_party/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = '/static/third_party/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
	
	//=======end load ck finder =========
	config.toolbar_UserOOO = [
            { name: 'basicstyles', items: [ 'Font','FontSize','TextColor', 'Bold','Italic','Underline' ] },'/',
            { name: 'document', items: [ 'Strike', 'BulletedList','NumberedList','Outdent','Indent','JustifyLeft','JustifyCenter','JustifyRight','Link','Unlink','Smiley', 'Image'] }         
       ];
	   
	config.toolbar_Full =
	[
		{ name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
		{ name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 
			'HiddenField' ] },
		'/',
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
		'-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
		{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
		{ name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
		'/',
		{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
		{ name: 'colors', items : [ 'TextColor','BGColor' ] },
		{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
	];
	 
	config.toolbar_Basic =
	[
		['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']
	];
        
        config.toolbar_Minimum =
	[
		['Bold', 'Italic', '-', 'NumberedList', 'BulletedList']
	];
        config.toolbar_UserTextStyle =
	[
		['Font','FontSize','TextColor','-','Bold', 'Italic', 'Underline','-','JustifyLeft','JustifyCenter','JustifyRight']
	];
        config.toolbar_HumanagerTextStyle =
	[
		['Font','FontSize','TextColor','-','Bold', 'Italic', 'Underline','-','JustifyLeft','JustifyCenter','JustifyRight','-','Strike', 'BulletedList','NumberedList','-','Outdent','Indent','-','JustifyLeft','JustifyCenter','JustifyRight','-','Cut','Copy','Paste','-','Image','Smiley']
	];
    config.toolbar_MessageCenter = [
        ["Font", "FontSize", "TextColor", "BGColor", "-",
         "Bold", "Italic", "Underline", "Strike",
         "BulletedList", "NumberedList", "-",
         "Outdent", "Indent", "-",
         "JustifyLeft", "JustifyCenter", "JustifyRight", "-",
         "Link", "Unlink", "Smiley"]
    ];
};
