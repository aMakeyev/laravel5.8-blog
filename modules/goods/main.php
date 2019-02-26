<?php
Core::$META['title'] = 'Новый параметр';
Core::$CSS[] = '<link href="/css/style.css" rel="stylesheet"/>';

$goods_cat = q("
	SELECT *
	FROM `goods_cat`
");

$limit = 3;
$neighbours = 3;
if(isset($_GET['num'])){
	$num = (int)$_GET['num'];
} else {
	$num = 1;
}

if(isset($_GET['search_cat'])) {
	$cats = $_GET['search_cat'];
	$cats = implode(',', $_GET['search_cat']);
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
		$res = q("
			SELECT COUNT(*) as `cnt`
			FROM `goods`
			WHERE `id` IN (".$ids.")
		");
		$count = $res->fetch_assoc()['cnt'];
		$lastPage = ceil($count/$limit);
		$paginator = new Paginator($num, $limit, $neighbours, $lastPage);
		$search_cat = q("
		SELECT *
		FROM `goods`
		WHERE `id` IN (".$ids.")
		LIMIT $paginator->startIndex, $limit
	");

	}else{
		$errorGoods = 'Товаров в данной категории пока нет';
	}
} else{
$goods2goods_cat = q("
	SELECT *
	FROM `goods2goods_cat`
");
$res = q("
    SELECT COUNT(*) as `cnt`
    FROM `goods`
");
$count = $res->fetch_assoc()['cnt'];
$lastPage = ceil($count/$limit);
$paginator = new Paginator($num, $limit, $neighbours, $lastPage);
$goods = q("
	SELECT *
	FROM `goods`
	LIMIT $paginator->startIndex, $limit
");
}
if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}
