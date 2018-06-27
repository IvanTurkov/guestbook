<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/core/classes/Db.php';
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $db = new Db();
    $db->saveComment();
    print 'Ваш комментарий успешно добавлен';
}