<?php

class Db
{
    protected $host = 'localhost';
    protected $user = 'root';
    protected $password = '';
    protected $db_name = 'guestbook';

    public function getDb(){
        $dsn = "mysql:host={$this->host};dbname={$this->db_name};charset=utf8";
        return new PDO($dsn, $this->user, $this->password);
    }
    protected function clearString($string){
        return trim(strip_tags($string));
    }

    public function saveComment(){
        $db = $this->getDb();
        $user_name = $this->clearString($_POST['user_name']);
        $email = $this->clearString($_POST['email']);
        $homepage = $this->clearString($_POST['homepage']);
        $text = $this->clearString($_POST['text']);
        $tags = $this->clearString($_POST['tags']);
        $ip = $_SERVER['REMOTE_ADDR'];
        $browser = $_SERVER['HTTP_USER_AGENT'];

        $params = [
            ':user_name' => $user_name,
            ':user_email' => $email,
            ':user_homepage' => $homepage,
            ':user_ip' => $ip,
            ':user_browser' => $browser,
            ':review_tags' => $tags,
            ':review_text' => $text
        ];

            $db->prepare("INSERT INTO 
                              reviews (user_name,user_email,user_homepage,user_ip,user_browser,review_tags,review_text)
                              VALUES(:user_name,:user_email,:user_homepage,:user_ip,:user_browser,:review_tags,:review_text)")
                ->execute($params);
    }
    public function getComments($offset = null){
        $db = $this->getDb();

        $offset = $offset != null ? $offset.',' : '';
        $offset = $this->clearString($offset);

        $query = "SELECT * FROM reviews ORDER BY date DESC LIMIT $offset 4";
        $comments = $db->query($query)->fetchAll();
        return $comments;
    }
}