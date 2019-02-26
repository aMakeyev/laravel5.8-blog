<?php
$goods_cat = q("
	SELECT *
	FROM `goods_cat`
	ORDER BY `id`
");

if(isset($_POST['ok'], $_POST['title'], $_POST['cat'],$_POST['price'], $_POST['avail'],$_POST['description'])){
	$errors = array();
	if(empty($_POST['title'])){
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
	if(empty($_POST['description'])){
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

	if(!count($errors)){
		$goods_insert = q("
			INSERT INTO `goods` SET 
			`title` 	  = '".es($_POST['title'])."',
			`price` 	  = ".(int)$_POST['price'].",
			`avail` 	  = '".es(($_POST['avail']))."',
			`description` = '".es(($_POST['description']))."',
			`deliv` 	  = '".es(($_POST['deliv']))."',
			`warr` 	      = '".es(($_POST['warr']))."',
			`date` 		  = NOW() 
		") ;
		$id = DB::_()->insert_id;
		foreach($_POST['cat'] as $v){
		q("
			INSERT INTO `goods2goods_cat` SET 
			`goods_id` 	  = ".(int)$id.",
			`cat_id` 	  = ".(int)$v."
		") ;
		}
		if(isset($_SESSION['file'])){
			q("
				UPDATE `goods` SET 
				`img`  = '".es($_SESSION['file'])."'
				WHERE `id` = $id
			");
			unset($_SESSION['file']);
		}
		$_SESSION['info'] = 'Товар был добавлен!<br>'.$infoload.'<br>'.$inforesize;

		header('Location: /admin/goods');
		exit;
	}
}



