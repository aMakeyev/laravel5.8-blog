<?php
if (isset($_POST['login'],$_POST['password'])) {
	$errors = array();
	if(empty($_POST['login'])) {
		$errors['login'] = 'Вы не заполнили логин';
	}
	if(empty($_POST['password'])) {
		$errors['password'] = 'Вы не заполнили пароль';
	}
	if(!count($errors)) {
		$res = q( "
			SELECT * 
			FROM `users` 
			WHERE `login`= '".es($_POST['login'])."'
			   AND `password` = '".es(myHash($_POST['password']))."'
			   AND `active` = 1
			   AND `access` != 0
			LIMIT 1   	
		");
		if(mysqli_num_rows($res)) {
			//Если авторизировались, присваеиваем сессии id:
			$_SESSION ['authok'] = 'OK';
			$_SESSION['user'] = mysqli_fetch_assoc($res);
			//setcookie("login", $_POST['login'], time() + 3600);
			if(isset($_POST['autoauth'])){
				$autoauthhash = myHash($_SESSION['user']['id']).myHash($_SESSION['user']['login']).myHash($_SESSION['user']['email']);
				$res = q("
				UPDATE `users` SET 
					`hash` = '".es($autoauthhash)."',
					`httpuseragent` = '".es($_SERVER['HTTP_USER_AGENT'])."'
				WHERE `id` = ".(int)$_SESSION['user']['id']."
				");
				setcookie('autoauthhash',$autoauthhash, time() + (365*24*3600),'/');
				setcookie('autoauthid',$_SESSION['user']['id'], time() + (365*24*3600),'/' );
				setcookie('HTTP_USER_AGENT',$_SERVER['HTTP_USER_AGENT'], time() + (365*24*3600),'/' );
			}
		}else {
			$_SESSION ['autherror'] = 'Неверный логин или пароль';
		}
	}
}
