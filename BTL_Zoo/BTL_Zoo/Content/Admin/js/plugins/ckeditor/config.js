/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.language = 'vi';
    config.filebrowserBrowseUrl = '/Content/Admin//js/plugins/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Content/Admin//js/plugins/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Content/Admin//js/plugins/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Content/Admin//js/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/Data';
    config.filebrowserFlashUploadUrl = '/Content/Admin//js/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';

    CKFinder.setupCKEditor(null, '/Content/Admin//js/plugins/ckfinder/')
};
