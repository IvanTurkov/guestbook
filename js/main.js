var offset = 4;
var tableBody = $('.comments_block tbody');

function reloadList() {
    $.ajax({
        url:'../core/inc/_comments.php',
        success: function (data) {
            tableBody.html(data);
            offset = 4;
            if(tableBody.children('#end_message').length !== 0){
                tableBody.removeChild('#end_message');
            }
        }
    });
}
function showMessage(message) {
    var messBlock = $('#message_block');
    messBlock.html(message);
    messBlock.show();
    setTimeout(function () {
        messBlock.hide();
    },2000);
}
function clearInputs() {
    $('.clearInput').val('');
}

$('#reviewsForm').on('submit',function () {
   var formData = $(this).serialize();
   $.ajax({
        data: formData,
        method:'POST',
        url:'../core/sendAjax.php',
       success: function (data) {
            clearInputs();
            showMessage(data);
            reloadList();
       }
   });
    return false;
});

function checkEndPage(){
    var wh = $(window).height();
    var dh = $(document).height();
    var sh = $(document).scrollTop();

    return (dh - (wh + sh) === 0) ? true : false;
}

$(window).on('scroll',function () {
    if(checkEndPage()) {
        $.ajax({
            data: {offset:offset},
            method:'GET',
            url:'../core/loadAjax.php',
            dataType:'html',
            success: function (data) {
                if(tableBody.children('#end_message').length === 0)
                    tableBody.append(data);
                    offset += 4;
                }
        });
   }
});