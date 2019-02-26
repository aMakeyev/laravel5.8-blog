<?php
Core::$META['title'] = 'Новый параметр';
Core::$CSS[] = '<link href="/css/style.css" rel="stylesheet"/>';

$limit = 5;
$neighbours = 3;
if(isset($_GET['num'])){
	$num = (int)$_GET['num'];
} else {
	$num = 1;
}

/*
 * было без класса:
 * $limit = 3;
if(isset($_GET['num'])){
	$num = (int)$_GET['num'];
} else {
	$num = 1;
}
$startIndex = $num*$limit - $limit;

if(isset($_GET['search_cat'])) {
	$search_cat = q("
	SELECT *
	FROM `news`
	WHERE `cat` = '".es($_GET['search_cat'])."'
	ORDER BY `id` DESC
	LIMIT $startIndex, $limit
");
	$allNews = q("
	SELECT *
	FROM `news`
	WHERE `cat` = '".es($_GET['search_cat'])."'
");

} else {
$news = q("
	SELECT *
	FROM `news`
	ORDER BY `id` DESC
	LIMIT $startIndex, $limit
");
$allNews = q("
	SELECT *
	FROM `news`
");
}

$lastPage = mysqli_num_rows($allNews)/$limit;
$neighbours = 3;
$left_neighbour = $num - $neighbours;
if ($left_neighbour < 1) $left_neighbour = 1;
$right_neighbour = $num + $neighbours;
if ($right_neighbour > $lastPage) $right_neighbour = $lastPage;




 */

if(isset($_GET['search_cat'])) {
	$allNews = q("
		SELECT COUNT(*) as `cnt`
		FROM `news`
		WHERE `cat` = '".es($_GET['search_cat'])."'
	");
	$lastPage = ceil($allNews->fetch_assoc()['cnt']/$limit);
	$paginator = new Paginator($num, $limit, $neighbours, $lastPage);
	$search_cat = q("
		SELECT *
		FROM `news`
		WHERE `cat` = '".es($_GET['search_cat'])."'
		LIMIT $paginator->startIndex, $limit
	");

} else {

	$allNews = q("
		SELECT COUNT(*) as `cnt`
		FROM `news`
	");

	$lastPage = ceil($allNews->fetch_assoc()['cnt']/$limit);
	$paginator = new Paginator($num, $limit, $neighbours, $lastPage);
	$news = q("
		SELECT *
		FROM `news`
		ORDER BY `id` DESC 
		LIMIT $paginator->startIndex, $limit
	");
}

$news_cat = q("
	SELECT *
	FROM `news_cat`
");


if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}