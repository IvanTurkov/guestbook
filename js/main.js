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
       }
   });
    return false;
});