<?
include_once $_SERVER['DOCUMENT_ROOT'].'/core/classes/Db.php';
$db = new Db();
$offset = $_GET['offset'];
$comments = $db->getComments($offset);

if($comments){
   foreach ($comments as $comment):?>
    <tr>
        <td><?=$comment['user_name']?></td>
        <td><?=$comment['user_email']?></td>
        <td><?=$comment['review_text']?></td>
        <td><?=$comment['date']?></td>
    </tr>

<?endforeach;

}else{?>
    <tr id='end_message'>
       <td colspan='4'>Комментариев больше не найдено!</td>
    </tr>
<?}?>