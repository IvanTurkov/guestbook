<?
require_once 'core/classes/Db.php';

$db = new Db();
$comments = $db->getComments();
?>
<?if($comments){?>
    <table>
        <tr>
            <th>Имя</th>
            <th>E-mail</th>
            <th>Сообщение</th>
            <th>Дата</th>
        </tr>
        <?foreach ($comments as $comment):?>
            <tr>
                <td><?=$comment['user_name']?></td>
                <td><?=$comment['user_email']?></td>
                <td><?=$comment['review_text']?></td>
                <td><?=$comment['date']?></td>
            </tr>
        <?endforeach;?>
    </table>
<?}else{?>
    <p>Сообщений не найдено</p>
<?}?>