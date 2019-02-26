<?php

if (isset($_SESSION['user'], $_POST['comment'])){
	$msg = array();
	if(!$_SESSION['user']){
		$msg['err-session'] = 'Ваша сессия истекла';
	}
	if(empty($_POST['comment'])){
		$msg['err-comment'] = 'Вы не заполнили комментарий';
	}
	if(!count($msg)){
		q("
			INSERT INTO `comments` SET
			`name` = '".es($_SESSION['user']['login'])."',
			`email` = '".es($_SESSION['user']['email'])."',
			`comment` = '".es($_POST['comment'])."'
  		");
	}
}
