$(function () {
    $('#fileupload').fileupload({
        // config
        dataType: 'json',
        maxFileSize: 5000000
    }) // events
    .bind('fileuploadalways', function(e, data) {
        if (data.files.length == 1) {
            $('#progress').hide();
        }
        
        //$('<li/>').text('<a rel="nofollow" data-method="delete" data-confirm="Are you sure?" href="/admin/items/' + file.asset_id + '">' + file.name + '</a>').appendTo($('.uploading'));
        
    })
    .bind('fileuploadadd', function(e, data) {

    })
    .bind('fileuploadprogressall', function(e, data) {
        $('#progress').show();
        $('.bar').css('width', parseInt(data.loaded / data.total * 100, 10) + '%');
    })
    .bind('fileuploaddone', function(e, data) {
        $.each(data.files, function (index, file) {
          $('<li/>').text('<a rel="nofollow" data-method="delete" data-confirm="Are you sure?" href="/admin/items/' + file.asset_id + '">' + file.name + '</a>').appendTo($('.assets'));
        });
    });
});