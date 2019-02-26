<?php
$goods = q("
	SELECT *
	FROM `goods`
	ORDER BY `id` DESC 
");

if(isset($_POST['search_cat'])) {
	$cats = $_POST['search_cat'];
	$cats = implode(',', $_POST['search_cat']);
	$goods2goods_cat = q("
		SELECT *
		FROM `goods2goods_cat`
		WHERE `cat_id` IN (".$cats.")
	");
	if(!empty($goods2goods_cat->num_rows)){
		while($row1 = $goods2goods_cat->fetch_assoc()) {
			$ids [$row1['id']] = $row1['goods_id'];
		}
		$ids = array_unique($ids);
		$ids = implode(',', $ids);

		$search_cat = q("
			SELECT *
			FROM `goods`
			WHERE `id` IN (".$ids.")
			ORDER BY `id` 
		");
	}else{
		$errorGoods = 'Товаров в данной категории пока нет';
	}
}

$goods_cat = q("
	SELECT *
	FROM `goods_cat`
	ORDER BY `id`
");

if(isset($_POST['delete'])){
	/*
	foreach($_POST['ids'] as $k=>$v){
		mysqli_query($link,"
		DELETE FROM `news`
		WHERE `id` = ".(int)$v."
	");
	}
	*/
	foreach($_POST['ids'] as $k=>$v){
		$_POST['ids'][$k] = (int)$v;
	}
	$ids = implode(',', $_POST['ids']);
	q("
		DELETE FROM `goods`
		WHERE `id` IN (".$ids.")
	");
	q("
		DELETE FROM `goods2goods_cat`
		WHERE `goods_id` IN (".$ids.")
	");
	$_SESSION['info'] = 'Товары были удалены';
	header("Location: /admin/goods");
	exit();
}

if(isset($_GET['action']) && $_GET['action'] == 'delete') {
	q("
		DELETE FROM `goods`
		WHERE `id` = ".(int)$_GET['id']."
	");
	q("
		DELETE FROM `goods2goods_cat`
		WHERE `goods_id` = ".(int)$_GET['id']."
	");
	$_SESSION['info'] = 'Товар был удален';
	header("Location: /admin/goods");
	exit();
}



if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}
if(isset($_SESSION['file'])){
	unset($_SESSION['file']);
}