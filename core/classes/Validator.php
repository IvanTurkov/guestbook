<?php

session_start();
class Validator
{
    protected static $errors = [];

    protected static function generateCaptchaChars(){
        $arrChars = array_merge(range('A','Z'),range('a','z'),range('0','9'));
        $captchaChars = '';
        for($i = 0; $i < 5; $i++){
            $captchaChars .= $arrChars[rand(0,count($arrChars))];
        }

        return $captchaChars;
    }

    public  static function drawCaptcha(){
        $chars = self::generateCaptchaChars();
        $_SESSION['captcha'] = strtolower($chars);

        $image = imagecreate(240 , 80);
        $background = imagecolorallocate($image, 255, 255, 255);
        $color = imagecolorallocate($image, 0, 0, 0);
        $font = $_SERVER['DOCUMENT_ROOT'].'/fonts/Montserrat-Bold.ttf';

        imagefill($image, 0, 0, $background);
        imagettftext($image, 20, 0, 70, 50, $color, $font, $chars);
        header('Content-type: image/png');
        imagepng($image);
        imagedestroy($image);
    }

    protected  static function checkField($pattern,$string,$message,$field){
        if (!preg_match($pattern,$string)){
            self::$errors[$field] = $message;
        }
    }

    public  static function validate(){

        $user_name = trim($_POST['user_name']);
        $email = trim($_POST['email']);
        $homepage = trim($_POST['homepage']);
        $text = trim($_POST['text']);
        $captcha = strtolower(trim($_POST['captcha']));

        self::checkField('/[A-z-А-я]/ui',$user_name,'Имя не должно состоять из цифр','user_name');
        self::checkField("/^$|\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$homepage,'Несоответсвие url адресу','homepage');
        self::checkField('/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u',$email,'Не корректный E-mail','email');

        if($captcha != $_SESSION['captcha']){
            self::$errors['captcha'] = 'Код введен не верно';
        }

        $required = [
            'user_name' => $user_name,
            'email' => $email,
            'captcha' => $captcha,
            'text' => $text,
        ];

        foreach ($required as $key => $value){
            if($value == ''){
                self::$errors[$key] = 'Поле должно быть заполнено';
            }
        }

        return self::$errors;
    }
}