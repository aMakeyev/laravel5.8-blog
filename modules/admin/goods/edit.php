<?php
$goods = q("
	SELECT *
	FROM `goods`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
if(!mysqli_num_rows($goods)){
	$_SESSION['info'] = 'Данного товара не существует!';
	header('Location: /admin/goods');
	exit;
}
$row = $goods->fetch_assoc();

$goods_cat = q("
	SELECT *
	FROM `goods_cat`
	ORDER BY `id`
");

$goods2goods_cat = q("
	SELECT *
	FROM `goods2goods_cat`
	WHERE `goods_id` = ".(int)$_GET['id']."
");
while($row3 = $goods2goods_cat->fetch_assoc()){
	$cat[] = $row3['cat_id'];
}

if(isset($_POST['ok'],$_POST['cat'],$_POST['price'], $_POST['avail'], $_POST['description'],$_POST['title'])) {
	$errors = [];
	if(empty($_POST['title'])) {
		$errors['title'] = 'Вы не заполнили название товара';
	}
	if(empty($_POST['cat'])) {
		$errors['cat'] = 'Вы не заполнили категорию товара';
	}
	if(empty($_POST['price'])){
		$errors['price'] = 'Вы не заполнили цену товара';
	}
	if(empty($_POST['avail'])) {
		$errors['avail'] = 'Вы не заполнили наличие товара';
	}
	if(empty($_POST['description'])) {
		$errors['description'] = 'Вы не заполнили описание товара';
	}
	//загрузка картинок
	if(!empty($_FILES['file']['name'])) {
		if($infoload = Uploader::upload($_FILES['file'])){
			$inforesize = Uploader::resize(200,200,'/uploaded/goods_200x200/');
			$_SESSION['file'] = Uploader::$filename;
		} else {
			$infoload = Uploader::$infoload;
		}
	}
	if(!count($errors)) {
		q("
			UPDATE `goods` SET 
			`title` 	  = '".es($_POST['title'])."',
			`price` 	  = ".(int)$_POST['price'].",
			`avail` 	  = '".es(($_POST['avail']))."',
			`description` = '".es(($_POST['description']))."',
			`deliv` 	  = '".es(($_POST['deliv']))."',
			`warr` 	      = '".es(($_POST['warr']))."',
			`date` 		  = NOW()
			WHERE `id` = ".(int)$_GET['id']."
		");
		q("
			DELETE FROM `goods2goods_cat`
			WHERE `goods_id` = ".(int)$_GET['id']."
		");
		foreach($_POST['cat'] as $v){
			q("
			INSERT INTO `goods2goods_cat` SET 
			`goods_id` 	  = ".(int)$_GET['id'].",
			`cat_id` 	  = ".(int)$v."
			") ;
		}
		if(isset($_SESSION['file'])){
			q("
				UPDATE `goods` SET 
				`img`		  = '".es($_SESSION['file'])."',
				`date` 		  = NOW()
				WHERE `id` = ".(int)$_GET['id']."
			");
			unset($_SESSION['file']);
		}
		$_SESSION['info'] = 'Товар отредактирован!<br>'.$infoload.'<br>'.$inforesize;
		header('Location: /admin/goods');
		exit;
	}
	if(isset($_POST['title'], $_POST['cat'], $_POST['price'], $_POST['avail'], $_POST['description'], $_POST['deliv'], $_POST['warr'])){
		$row['title'] = $_POST['title'];
		$row['cat'] = $_POST['cat'];
		$row['price'] = $_POST['price'];
		$row['avail'] = $_POST['avail'];
		$row['description'] = $_POST['description'];
		$row['deliv'] = $_POST['deliv'];
		$row['warr'] = $_POST['warr'];

	}
}
