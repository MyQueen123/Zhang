$(function () {
    $('#searchInput').on('input propertychange', function () {
        var si = $(this).val();
        $('#sr').empty();
        if (si != undefined && si != "") {

            $.post('/Home/Ashx/BookDetails.ashx', { zi: si,count:2 }, function (msg) {

                $.each(msg, function (i, v) {
                    $('<div><a href="/Home/Page/BookDetails_' + v.Id + '.aspx">' + v.Title + '</a></div>').appendTo($('#sr'));
                });
            }, 'json');
        }
    });
});