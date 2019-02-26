<?php

$res = q("
	SELECT * 
	FROM `users` 
	ORDER BY `id`
");
if (isset($_POST['login'],$_POST['password'],$_POST['email'])){
	$errors = array();
	if(empty($_POST['login'])){
		$errors['login'] = 'Вы не заполнили логин';
	}elseif(mb_strlen($_POST['login']) < 2){
		$errors['login'] = 'Логин слишком короткий';
	}elseif(mb_strlen($_POST['login']) > 16){
		$errors['login'] = 'Логин слишком длинный';
	}

	if(mb_strlen($_POST['password']) < 5){
		$errors['password'] = 'Пароль должен быть длиннее 4-х символов';
	}
	if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
		$errors['email'] = 'Вы не заполнили email';
	}
	//загрузка картинок
	if(!empty($_FILES['file']['name'])) {
		if($infoload = Uploader::upload($_FILES['file'])){
			$inforesize = Uploader::resize(45,45,'/uploaded/users_45x45/');
			$_SESSION['file'] = Uploader::$filename;
		} else {
			$infoload = Uploader::$infoload;
		}
	}
	if(!count($errors)){
		$res = q("
			SELECT `id`
			FROM `users`
			WHERE `login` = '".es($_POST['login'])."'
			LIMIT 1
		");
		if($res->num_rows){
			$errors['login'] = 'Такой логин уже занят';
		}
	}
	if(!count($errors)){
		$res = q("
			SELECT `id`
			FROM `users`
			WHERE `email` = '".es($_POST['email'])."'
			LIMIT 1
		");
		if($res->num_rows){
			$errors['email'] = 'Такой email уже занят';
		}
	}

	if(!count($errors)){
		q("
			INSERT INTO `users` SET
			`login` 	= '".es($_POST['login'])."',
			`password`  = '".es(myHash($_POST['password']))."',
			`email`     = '".es($_POST['email'])."',
			`age` 		= ".(int)$_POST['age'].",
			`hash`		= '".es(myHash($_POST['login'].$_POST['age']))."',
			`img`		  = '".es($_SESSION['file'])."'
		");
		$id = DB::_()->insert_id;

		$_SESSION ['regok'] = 'OK';
		unset($_SESSION['file']);

		Mail::$to = $_POST['email'];
		Mail::$subject = 'Вы зарегистрировались на сайте';
		Mail::$text = 'Вы успешно зарегистрировались на сайте. Для активации вашего акаунта пройдите по 
		<a href="'.Core::$DOMAIN.'cab/activate?id='.$id.'&hash='.
			myHash($_POST['login'].$_POST['age']).'">ссылке</a>';
		Mail::send();

		header("Location: /cab/registration");
		exit;
	}
}
