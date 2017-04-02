
$('td > a').on('click', function() {
  var clicked_item = $(this)
  $('<div id="confirmation-box"></div>').appendTo('body')
    .html('<div><h6>Are you sure?</h6></div>')
    .dialog({
        modal: true,
        title: 'Delete message',
        zIndex: 10000,
        autoOpen: true,
        width: 'auto',
        resizable: false,
        buttons: {
            Yes: function () {
                clicked_item.parent().parent().fadeOut(800);

                $(this).dialog("close");
            },
            No: function () {
                $(this).dialog("close");
            }
        },
        close: function (event, ui) {
            $(this).remove();
        }
    });
})
