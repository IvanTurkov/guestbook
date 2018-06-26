<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guest Book</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="inner">
    <h1 class="site_header">Гостевая книга</h1>
    <div class="form_wrapper">
        <form method="post" id="reviewsForm">
            <div class="inputs_wrapper">
                <input type="text" name="user_name" placeholder="Ваше имя" class="site_input">
                <input type="text" name="email" placeholder="E-mail" class="site_input">
                <input type="text" name="homepage" placeholder="Адрес сайта" class="site_input">
            </div>
            <textarea name="text" placeholder="Текст сообщения" class="site_input site_ta"></textarea>
            <input type="text" name="tags" placeholder="Добавить тэги" class="site_input tags_input">
            <div class="form_bottom_side">
                <div class="captcha_wrapper">
                    <img src="images.png" alt="captcha">
                    <input type="text" name="captcha" placeholder="Введите символы с картинки" class="site_input captcha_input">
                </div>
                <input type="submit" value="Отправить" class="site_submit site_input">
            </div>
        </form>
    </div>
</div>
    <script src="js/main.js"></script>
</body>
</html>