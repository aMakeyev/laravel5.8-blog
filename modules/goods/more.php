<?php
$goods = q("
	SELECT *
	FROM `goods`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
if(!mysqli_num_rows($goods)){
	$_SESSION['info'] = 'Данного товара не существует!';
	header('Location: /goods');
	exit;
}
$row = $goods->fetch_assoc();

$goods2goods_cat = q("
			SELECT * 
			FROM `goods2goods_cat`
			WHERE `goods_id` = ".(int)$_GET['id']."
		");
$goods_cat = q("
	SELECT *
	FROM `goods_cat`
");

while($row3 = $goods2goods_cat->fetch_assoc()) {
	while($row4 = $goods_cat->fetch_assoc()) {
		if($row4['id'] == $row3['cat_id']) {
			$cat[] = $row4['name'];
		}
	}
	mysqli_data_seek($goods_cat, 0);
}
