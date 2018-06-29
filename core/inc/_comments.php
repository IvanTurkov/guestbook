<?
require_once $_SERVER['DOCUMENT_ROOT'].'/core/classes/Db.php';

$db = new Db();
$comments = $db->getComments();
?>
<?if($comments){?>
    <table>
        <thead>
            <tr>
                <th>Имя</th>
                <th>E-mail</th>
                <th>Тэги</th>
                <th>Дата</th>
                <th>Сообщение</th>
            </tr>
            <tr>
                <td><input type="text" id="user_name" placeholder="Искать..." class="search_input"></td>
                <td><input type="text" id="user_email" placeholder="Искать..." class="search_input"></td>
                <td><input type="text" id="review_tags" placeholder="Искать..." class="search_input"></td>
                <td><input type="text" id="date" placeholder="Искать..." class="search_input"></td>
                <td></td>
            </tr>
        </thead>
        <tbody>
        <?foreach ($comments as $comment):?>
            <tr>
                <td><?=$comment['user_name']?></td>
                <td><?=$comment['user_email']?></td>
                <td><?=$comment['review_tags']?></td>
                <td><?=$comment['date']?></td>
                <td><?=$comment['review_text']?></td>
            </tr>
        <?endforeach;?>
        </tbody>
    </table>
<?}else{?>
    <p>Сообщений не найдено</p>
<?}?>