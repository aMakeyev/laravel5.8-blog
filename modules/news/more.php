<?php

$news = q("
	SELECT *
	FROM `news`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
if(!$news->num_rows){
	$_SESSION['info'] = 'Данной новости не существует!';
	header('Location: index.php?module=news');
	exit;
}
$row = $news->fetch_assoc();


