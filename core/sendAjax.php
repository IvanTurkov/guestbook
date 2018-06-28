<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/core/classes/Db.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/core/classes/Validator.php';
if($_SERVER['REQUEST_METHOD'] == 'POST'){

    $errors = Validator::validate();

    if(!$errors) {
        $db = new Db();
        $db->saveComment();
        print json_encode('Ваш комментарий успешно добавлен');
    }else{
        print json_encode(['errors' => $errors]);
    }
}