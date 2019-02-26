<?php

$news = q("
	SELECT *
	FROM `news`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
if(!mysqli_num_rows($news)){
	$_SESSION['info'] = 'Данной новости не существует!';
	header('Location: /admin/news');
	exit;
}
$row = mysqli_fetch_assoc($news);

$news_cat = q("
	SELECT *
	FROM `news_cat`
	ORDER BY `id`
");
while($row1 = $news_cat->fetch_assoc()){
	$cat [$row1['name']] = $row1['name'];
}


if(isset($_POST['ok'],$_POST['text'],$_POST['cat'],$_POST['description'],$_POST['title'])) {
	$errors = [];
	if(empty($_POST['title'])) {
		$errors['title'] = 'Вы не заполнили заголовок';
	}
	if(empty($_POST['cat'])) {
		$errors['cat'] = 'Вы не заполнили категорию новости';
	}
	if(empty($_POST['description'])) {
		$errors['description'] = 'Вы не заполнили описание новости';
	}
	if(empty($_POST['text'])) {
		$errors['text'] = 'Вы не заполнили текст новости';
	}
	//загрузка картинок
	if(!empty($_FILES['file']['name'])) {
		if($infoload = Uploader::upload($_FILES['file'])){
			$inforesize = Uploader::resize(200,200,'/uploaded/news_200x200/');
			$_SESSION['file'] = Uploader::$filename;
		} else {
			$infoload = Uploader::$infoload;
		}
	}
	if(!count($errors)) {
		q("
		UPDATE `news` SET 
		`cat` 		  = '".es(($_POST['cat']))."',
		`title` 	  = '".es($_POST['title'])."',
		`text` 	  	  = '".es(($_POST['text']))."',
		`description` = '".es(($_POST['description']))."',
		`img`		  = '".es($_SESSION['file'])."',
		`date` 		  = NOW()
		WHERE `id` = ".(int)$_GET['id']."
	");
		if(isset($_SESSION['file'])){
			q("
				UPDATE `news` SET 
				`img`		  = '".es($_SESSION['file'])."'
				WHERE `id` = ".(int)$_GET['id']."
			");
			unset($_SESSION['file']);
		}
		$_SESSION['info'] = 'Запись была изменена!<br>'.$infoload.'<br>'.$inforesize;
		header('Location: /admin/news');
		exit;
	}
	if(isset($_POST['title'],$_POST['text'],$_POST['cat'],$_POST['description'])){
		$row['title'] = $_POST['title'];
		$row['cat'] = $_POST['cat'];
		$row['description'] = $_POST['description'];
		$row['text'] = $_POST['text'];

	}
}
