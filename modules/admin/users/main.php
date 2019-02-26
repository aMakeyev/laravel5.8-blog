<?php
Core::$META['title'] = 'Новый параметр';
Core::$CSS[] = '<link href="skins/admin/css/style.css" rel="stylesheet"/>';

if(isset($_POST['searchusers'])) {
	$searchusers = q("
	SELECT *
	FROM `users`
	WHERE `login` LIKE '%".es($_POST['searchusers'])."%'
	ORDER BY `id` DESC 
");
}

if(isset($_POST['delete'])){
	foreach($_POST['ids'] as $k=>$v){
		$_POST['ids'][$k] = (int)$v;
	}
	$ids = implode(',', $_POST['ids']);
	q("
		DELETE FROM `users`
		WHERE `id` IN (".$ids.")
	");
	$_SESSION['info'] = 'Пользователи были удалены';
	header("Location: /admin/users");
	exit();
}

if(isset($_SESSION['user'], $_GET['action']) && $_SESSION['user']['access'] == 5 && $_GET['action'] == 'delete'){
	q("
		DELETE FROM `users`
		WHERE `id` = ".(int)$_GET['id']."
	");
	$_SESSION['info'] = 'Пользователь был удален';
	header("Location: /admin/users");
	exit();
}

$users = q("
	SELECT *
	FROM `users`
	ORDER BY `id` DESC 
");

if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}
if(isset($_SESSION['file'])){
	unset($_SESSION['file']);
}