/*
 * jQuery File Upload Plugin JS Example 6.7
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/*jslint nomen: true, unparam: true, regexp: true */
/*global $, window, document */

$(function () {
    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload();

        // Demo settings:
        $('#fileupload').fileupload('option', {
            url: 'http://localhost:3000/admin/assets.json',
            maxFileSize: 5000000,
            //acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
            uploadTemplateId: null,
            downloadTemplateId: null,
            uploadTemplate: function (o) {
                var rows = $();
                $.each(o.files, function (index, file) {
                    var row = $('<tr class="template-upload fade">' +
                        '<td class="preview"><span class="fade"></span></td>' +
                        '<td class="name"></td>' +
                        '<td class="size"></td>' +
                        (file.error ? '<td class="error" colspan="2"></td>' :
                                '<td><div class="progress">' +
                                    '<div class="bar" style="width:0%;"></div></div></td>' +
                                    '<td class="start"><button>Start</button></td>'
                        ) + '<td class="cancel"><button>Cancel</button></td></tr>');
                    row.find('.name').text(file.name);
                    row.find('.size').text(o.formatFileSize(file.size));
                    if (file.error) {
                        row.find('.error').text(
                            locale.fileupload.errors[file.error] || file.error
                        );
                    }
                    rows = rows.add(row);
                });
                return rows;
            },
            downloadTemplate: function (o) {
                var rows = $();
                $.each(o.files, function (index, file) {
                    var row = $('<tr class="template-download fade">' +
                        (file.error ? '<td></td><td class="name"></td>' +
                            '<td class="size"></td><td class="error" colspan="2"></td>' :
                                '<td class="preview"></td>' +
                                    '<td class="name"><a></a></td>' +
                                    '<td class="size"></td><td colspan="2"></td>'
                        ) + '<td class="delete"><button>Delete</button> ' +
                            '<input type="checkbox" name="delete" value="1"></td></tr>');
                    row.find('.size').text(o.formatFileSize(file.size));
                    if (file.error) {
                        row.find('.name').text(file.name);
                        row.find('.error').text(
                            locale.fileupload.errors[file.error] || file.error
                        );
                    } else {
                        row.find('.name a').text(file.name);
                        if (file.thumbnail_url) {
                            row.find('.preview').append('<a><img></a>')
                                .find('img').prop('src', file.thumbnail_url);
                            row.find('a').prop('rel', 'gallery');
                        }
                        row.find('a').prop('href', file.url);
                        row.find('.delete button')
                            .attr('data-type', file.delete_type)
                            .attr('data-url', file.delete_url);
                    }
                    rows = rows.add(row);
                });
                return rows;
            }
        });
        // Upload server status check for browsers with CORS support:
        if ($.support.cors) {
            $.ajax({
                url: '//localhost:3000/',
                type: 'HEAD'
            }).fail(function () {
                $('<span class="alert alert-error"/>')
                    .text('Upload server currently unavailable - ' +
                            new Date())
                    .appendTo('#fileupload');
            });
        }
});