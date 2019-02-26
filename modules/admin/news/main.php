<?php
/*
Вывод принцип
$limit = 10;
1=0,9; $_GET['num']*$limit-$limit = LIMIT 0,$limit
1=9,19; $_GET['num']*$limit-$limit = LIMIT 10,$limit
1=19,29; $_GET['num']*$limit-$limit = LIMIT 20,$limit
LIMIT 10,10
вывод пятой стр $_GET['num'] = 5; в строке: /news/main?cat=politic&num=3

Вывод навигации принцип
вывести в цикле большую строчку-проверку:
 $_GET['num'] - стр сейчас - три назад и три вперед. если за три ещё что-то есть выводим ... и последнюю или первую страницу
предыдущая $_GET['num']-1
следующая $_GET['num']+1
 */

Core::$META['title'] = 'Новый параметр';
Core::$CSS[] = '<link href="skins/admin/css/style.css" rel="stylesheet"/>';
//Core::$JS[] = '<script src="/skins/default/js/javascript_v1.js"></script>';


$limit = 5;
$neighbours = 3;
if(isset($_GET['num'])){
	$num = (int)$_GET['num'];
} else {
	$num = 1;
}

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
	LIMIT $paginator->startIndex, $limit
");
}

$news_cat = q("
	SELECT *
	FROM `news_cat`
");


if(isset($_POST['delete'])){
	foreach($_POST['ids'] as $k=>$v){
		$_POST['ids'][$k] = (int)$v;
	}
	$ids = implode(',', $_POST['ids']);
	q("
		DELETE FROM `news`
		WHERE `id` IN (".$ids.")
	");
	$_SESSION['info'] = 'Новости были удалены';
	header("Location: /admin/news");
	exit();
}
if(isset($_GET['action']) && $_GET['action'] == 'delete') {
	q("
		DELETE FROM `news`
		WHERE `id` = ".(int)$_GET['id']."
	");
	$_SESSION['info'] = 'Новость была удалена';
	header("Location: /admin/news");
	exit();
}

if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}
if(isset($_SESSION['file'])){
	unset($_SESSION['file']);
}