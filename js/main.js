var offset = 4;
var tableBody = $('.comments_block tbody');
var search = {
    user_name:'',
    user_email:'',
    review_tags:'',
    date:''
};

function reloadList() {
    $.ajax({
        url:'../core/loadAjax.php',
        success: function (data) {
            tableBody.html(data);
            offset = 4;
        }
    });
}

function reloadCaptcha() {
    $.ajax({
        url:'../core/inc/_captcha.php',
        success:function () {
            $('#captcha_img').attr('src','core/inc/_captcha.php');
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

function showErrors(errors) {
    $.each(errors,function (index, value) {
        var input = $('.site_input[name='+ index +']');
        input.addClass('hasError');
        input.siblings('.error_text').html(value);
    })
}

function removeErrors() {
    if($(this).hasClass('hasError')){
        $(this).removeClass('hasError');
        $(this).siblings('.error_text').html('');
    }
}

function clearInputs(inputClass) {
    $(inputClass).val('');
}

function checkEndPage(){
    var wh = $(window).height();
    var dh = $(document).height();
    var sh = $(document).scrollTop();

    return (dh - (wh + sh) === 0) ? true : false;
}

function searchMessage() {
    var field = $(this).attr('id');
    value = $(this).val();
    search[field] = value;

    $.ajax({
        method:'GET',
        data:{search:JSON.stringify(search)},
        url:'../core/loadAjax.php',
        success:function (data) {
            tableBody.html(data);
            offset = 4;
        }
    })
}

$('.site_input').focus(removeErrors);

$('#reviewsForm').on('submit',function () {
   var formData = $(this).serialize();
   $.ajax({
        data: formData,
        method:'POST',
        dataType:'json',
        url:'../core/sendAjax.php',
        success: function (data) {
            if(data.errors !== undefined){
                showErrors(data.errors);
                clearInputs('.captcha_input');
            }else{
                clearInputs('.clearInput');
                showMessage(data);
                reloadList();
            }
            reloadCaptcha();
        }
   });
    return false;
});

$(window).on('scroll',function () {
    if(checkEndPage()) {
        $.ajax({
            data: {
                offset:offset,
                search:JSON.stringify(search)
            },
            method:'GET',
            url:'../core/loadAjax.php',
            dataType:'html',
            success: function (data) {
                console.log(tableBody.children('#end_message').length);
                if($('#end_message').length === 0)
                    tableBody.append(data);
                    offset += 4;
                }
        });
   }
});

$('.search_input').on('input',searchMessage);