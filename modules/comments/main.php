<?php
$res = q("
	SELECT * 
	FROM `comments` 
	ORDER BY `id`
");
if (isset($_POST['name'],$_POST['comment'],$_POST['email'])){
	$errors = array();
	if(empty($_POST['name'])){
	$errors['name'] = 'Вы не заполнили имя';
	}
	if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
		$errors['email'] = 'Вы не заполнили email';
	}
	if(empty($_POST['comment'])){
		$errors['comment'] = 'Вы не заполнили комментарий';
	}
	if(!count($errors)){
		q("
			INSERT INTO `comments` SET
			`name` = '".es($_POST['name'])."',
			`email` = '".es($_POST['email'])."',
			`comment` = '".es($_POST['comment'])."'
  		");
		$_SESSION ['commentok'] = 'OK';
		header("Location: /comments");
		exit;
	}
}


