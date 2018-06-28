<?php


class Validator
{
    protected static $errors;

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
        session_start();
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

    public  static function validate(){

        self::$errors = [];

        $user_name = trim($_POST['user_name']);
        $email = trim($_POST['email']);
        $homepage = trim($_POST['homepage']);
        $text = trim($_POST['text']);
        $tags = trim($_POST['tags']);
        $captcha = trim($_POST['captcha']);

        $required = [
            'user_name' => $user_name,
            'email' => $email,
            'captcha' => $captcha,
            'text' => $text,
        ];

        foreach ($required as $key => $value){
            if($value == ''){
                self::$errors[$key] = 'Необходимо заполнить поле';
            }
        }
        return self::$errors;
    }
}