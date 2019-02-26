<?php
$hit='';
if(!isset($_SESSION['user'])){
	$_SESSION['user'] = 10;
	$_SESSION['server'] = 10;
}
if($_SESSION['user'] > 0 && $_SESSION['server'] > 0) {
	if(isset($_POST['num'])) {
		if($_POST['num'] == 1 || $_POST['num'] == 2 || $_POST['num'] == 3) {
			if($_POST['num'] == rand(1, 3)) {
				$_SESSION['user'] -= rand(1, 4);
				$hit= 'Вы промахнулись!';
			}
			else {
				$_SESSION['server'] -= rand(1, 4);
				$hit= 'Ваш удар попал точно в цель!';
			}
			if($_SESSION['user'] <= 0 || $_SESSION['server'] <= 0) {

				header("Location: index.php?module=game&page=gameover");
				exit();
			}
		}
		else{
			$errornum = 'Вы ввели неверное значение. Введите цифру от 1 до 3.';
		}

	}
}

