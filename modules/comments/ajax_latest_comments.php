<?php
//вывод комментов за последние 10 сек
$latest_comments = q("
   SELECT *
   FROM `comments`
   WHERE `date` > NOW() - INTERVAL 10 SECOND
");



/*$_SESSION['time'] > time();
while(){echo новые комментарии}*/
//wtf($_SESSION);
$pdo = new PDO('mysql:dbname=main;host=localhost', 'root', 'root');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$name = '50Новая книга 50';
$res = $pdo->query("
SELECT * FROM users WHERE id = 38
");
$row = $res->fetch(PDO::FETCH_ASSOC);
wtf($row);
//$pdo->beginTransaction();
/*$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
try{
	$name = 'Новая книга 50';
	$pdo->quote($name);
	$pdo->exec("
INSERT INTO product (id, title) VALUES (401, '$name')
");
}catch(PDOException $e){
	echo $e-> getCode() . ":". $e-> getMessage();
	exit();
}*/

//$pdo->commit();
//$pdo->rollBack();

/*
 * mysql> INSERT INTO test1 VALUES
-> (1), (3), (1), (7), (1), (8), (4), (4);
Query OK, 8 rows affected (0.01 sec)
Records: 8 Duplicates: 0 Warnings: 0


 * $res = $pdo->query("
   SELECT n.id AS 'newsId', g.id AS 'goodsId', n.name AS 'newsName', g.name AS 'goodName'
   	FROM news_cat n
    JOIN goods_cat g ON n.id = g.id

SELECT CONCAT(title, ', ',price) AS good FROM goods
");*/
/*$res = $pdo->query("
SELECT email, login FROM users
");
//$row = $res->fetchAll(PDO::FETCH_COLUMN|PDO::FETCH_GROUP);
function foo($login, $email){
	return $login. ': '. hc($email). "\n";
}
$row= $res->fetchAll(PDO::FETCH_FUNC, 'foo');*/
//$input = file_get_contents("php://input");

/*$pdo = new PDO('mysql:dbname=main;host=localhost', 'root', 'root');
$res = $pdo->query("
	SELECT COUNT(*) as `cnt`
	FROM news
");
$cnt = $res->fetch(PDO::FETCH_ASSOC)['cnt'];
echo $cnt;*/
/*$res = $pdo->prepare("
		SELECT *
		FROM `users`
		WHERE `id` > :id
		");
$res->execute(array('id' => 49));*/
/*$row = $res->fetchAll(PDO::FETCH_ASSOC);
wtf($row);*/
/*while($row = $res->fetch(PDO::FETCH_ASSOC)){
		$row['login'].'<br>';
}*/
/*
+? нум роуз, каунт, транзакция
*/
/*$res = q("
    SELECT COUNT(*) as `cnt`
    FROM `goods`
");
$count = $res->fetch_assoc()['cnt'];*/
