<?php
if(isset($_SESSION['user'])){
	$res = q("
		SELECT *
		FROM `users`
		WHERE `id` = ".$_SESSION['user']['id']."
		LIMIT 1
	");
	$_SESSION['user'] = mysqli_fetch_assoc($res);
	if($_SESSION['user']['active'] != 1 && $_GET['page'] != 'exit'){
		header("Location: /cab/exit");
		exit();
	}
} elseif (isset($_COOKIE['autoauthhash'],$_COOKIE['autoauthid'])) {

	$res = q("
		SELECT *
		FROM `users`
		WHERE `id` = '".es($_COOKIE['autoauthid'])."'
		AND `hash` = '".es($_COOKIE['autoauthhash'])."'
		AND `httpuseragent` = '".es($_COOKIE['HTTP_USER_AGENT'])."'
		LIMIT 1
	");
	if(!mysqli_num_rows($res)) {
		include './modules/cab/exit.php';
	}elseif($_SERVER['HTTP_USER_AGENT'] == $_COOKIE['HTTP_USER_AGENT']){
			$_SESSION['user'] = mysqli_fetch_assoc($res);
	}
}

