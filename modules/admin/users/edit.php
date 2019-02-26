<?php

$users = q("
	SELECT *
	FROM `users`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
if(!mysqli_num_rows($users)){
	$_SESSION['info'] = 'Данного пользователя не существует!';
	header('Location: /admin/users');
	exit;
}
$row = mysqli_fetch_assoc($users);

if(isset($_POST['ok'],$_POST['login'],$_POST['email'])) {
	$errors = [];
	if(empty($_POST['login'])) {
		$errors['login'] = 'Вы не заполнили логин';
	}
	if(empty($_POST['email'])) {
		$errors['email'] = 'Вы не указали email';
	}
	//загрузка аватара
	if(!empty($_FILES['file']['name'])) {
		if($infoload = Uploader::upload($_FILES['file'])){
			$inforesize = Uploader::resize(45,45,'/uploaded/users_45x45/');
			$_SESSION['file'] = Uploader::$filename;
		} else {
			$infoload = Uploader::$infoload;
		}
	}
	if(isset($_POST['password']) && !empty($_POST['password'])) {
		$row['password'] = $_POST['password'];
		if(mb_strlen($_POST['password']) < 5) {
			$errors['password'] = 'Пароль должен быть длиннее 4-х символов';
		}
		else {
			q("
				UPDATE `users` SET 
					`password`  = '".es(myHash($_POST['password']))."'
				WHERE `id` = ".(int)$_GET['id']."
				");
		}
	}
	if(!count($errors)) {
		q("
		UPDATE `users` SET 
		`login` 	= '".es($_POST['login'])."',
		`email`     = '".es($_POST['email'])."',
		`age` 		= ".(int)$_POST['age'].",
		`active` 	= ".(int)$_POST['active'].",
		`access` 	= ".(int)$_POST['access']."
		WHERE `id` = ".(int)$_GET['id']."
		");
		if(isset($_SESSION['file'])){
			q("
				UPDATE `users` SET 
				`img`		  = '".es($_SESSION['file'])."'
				WHERE `id` = ".(int)$_GET['id']."
			");
			unset($_SESSION['file']);
		}
		$_SESSION['info'] = 'Данные пользователя были изменены!<br>'.$infoload.'<br>'.$inforesize;
		header('Location: /admin/users');
		exit;
	}

	if(isset($_POST['login'],$_POST['email'],$_POST['age'],$_POST['active'],$_POST['access'])){
		$row['login'] = $_POST['login'];
		$row['email'] = $_POST['email'];
		$row['age'] = $_POST['age'];
		$row['active'] = $_POST['active'];
		$row['access'] = $_POST['access'];
	}
}
