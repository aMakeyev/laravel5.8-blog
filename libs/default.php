<?php

//mysqli_set_charset();на процедурке
//DB::$mysqli[0]->set_charset(""); тоже самое на ООП

// DB::_(0); - соединение с БД
// DB::$mysqli(0)->query(); - запрос к БД
// DB::_($key)->query(); - - трюк = 'ступенька в ООП' сразу соединение и запрос - потому как в функции написали ретерн - и ключ автоматически подставится + соединение будет открываться с первым запросом, а не как было открыто и пока не появится первый запрос
// закрывать соединение функцией клоз DB::close(); Закрывать, чтобы освободить память с от предыдущего запроса +нужно, когда идёт обр.фото - много времени - чтобы др.могли лучше пользоваться - закрыть.
//переделываем под класс функции q и es

/*
ALIAS: - это расширенный функционал
q(); Запрос
es(); mysqli_real_escape_string

РАБОТА С ОБЪЕКТОМ ВЫБОРКИ
$res = q(); // Запрос с возвратом результата
$res->num_rows; // Количество возвращенных строк - mysqli_num_rows();
$res->fetch_assoc(); // достаём запись - mysqli_fetch_assoc();
$res->close(); // Очищаем результат выборки

РАБОТА С ПОДКЛЮЧЕННОЙ MYSQL
DB::_()->affected_rows; // Количество изменённых записей
DB::_()->insert_id; // Последний ID вставки
DB::_()->real_escape_string(); // аналог es();
DB::_()->query(); // аналог q
DB::_()->multi_ query(); // Множественные запросы

DB::close(); // Закрываем соединение с БД
*/

class DB {
	static public $mysqli = array();
	static public $connect = array();

	static public function _($key = 0) {
		if(!isset(self::$mysqli[$key])) {
			if(!isset(self::$connect['server']))
				self::$connect['server'] = Core::$DB_LOCAL;
			if(!isset(self::$connect['user']))
				self::$connect['user'] = Core::$DB_LOGIN;
			if(!isset(self::$connect['pass']))
				self::$connect['pass'] = Core::$DB_PASS;
			if(!isset(self::$connect['db']))
				self::$connect['db'] = Core::$DB_NAME;

			self::$mysqli[$key] = @new mysqli(self::$connect['server'],self::$connect['user'],self::$connect['pass'],self::$connect['db']); // @ чтобы WARNING не выводил
			if (mysqli_connect_errno()) {
				echo 'Не удалось подключиться к Базе Данных';
				exit;
			}
			if(!self::$mysqli[$key]->set_charset("utf8")) {
				echo 'Ошибка при загрузке набора символов utf8:'.self::$mysqli[$key]->error;
				exit;
			}
		}
		return self::$mysqli[$key];
	}
	static public function close($key = 0) {
		self::$mysqli[$key]->close();
		unset(self::$mysqli[$key]);
	}
}

function q($query,$key = 0) {
	$res = DB::_($key)->query($query);
	if($res === false) {
		$info = debug_backtrace();
		$error = "QUERY: ".$query."<br>\n".DB::_($key)->error."<br>\n".
			"file: ".$info[0]['file']."<br>\n".
			"line: ".$info[0]['line']."<br>\n".
			"date: ".date("Y-m-d H:i:s")."<br>\n".
			"===================================";

		file_put_contents('./logs/mysql.log',strip_tags($error)."\n\n",FILE_APPEND);
		echo $error;
		exit();
	}
	return $res;
}

function es($el,$key = 0) {
	return DB::_($key)->real_escape_string($el);
}

function wtf($array, $stop = false) {
	echo '<pre>'.print_r($array,1).'</pre>';
	if(!$stop) {
		exit();
	}
}
function trimAll($el) {
	if(!is_array($el)) {
		$el = trim($el);
	} else {
		$el = array_map('trimAll',$el);
	}
	return $el;
}

function intAll($el) {
	if(!is_array($el)) {
		$el = (int)($el);
	} else {
		$el = array_map('intAll',$el);
	}
	return $el;
}

function floatAll($el) {
	if(!is_array($el)) {
		$el = (float)($el);
	} else {
		$el = array_map('floatAll',$el);
	}
	return $el;
}

function hc($el) {
	if(!is_array($el)) {
		$el = htmlspecialchars($el);
	} else {
		$el = array_map('hc',$el);
	}
	return $el;
}

//подключаем классы
spl_autoload_register(function ($class) {
	include './libs/class_'.$class.'.php';
});
/*устраевшая функция
function __autoload($class) {
	include './libs/class_'.$class.'.php';
}
*/

function myHash($var) {
	$salt = 'ABC';
	$salt2 = 'CBA';
	$var = crypt(md5($var.$salt),$salt2);
	return $var;
}

/*
 было у меня до того:

class DB{
	static public $mysqli = array();
	static public $connect = array();

	static public function _($key = 0){
		if(!isset(self::$mysqli[$key])){
			if(!isset(self::$connect['server']))
				self::$connect['server'] = Core::$DB_LOCAL;
			if(!isset(self::$connect['user']))
				self::$connect['user'] = Core::$DB_LOGIN;
			if(!isset(self::$connect['pass']))
				self::$connect['pass'] = Core::$DB_PASS;
			if(!isset(self::$connect['db']))
				self::$connect['db'] = Core::$DB_NAME;

			self::$mysqli[$key] = @new mysqli(self::$connect['server'],self::$connect['user'],self::$connect['pass'],self::$connect['db']); //@ чтобы ворнинг не выводил. есть и др.способ
			if(mysqli_connect_errno()){
				echo 'Не удалось подключиться к Базе Данных';
				exit();
			}
			if(!self::$mysqli[$key]->set_charset("utf-8")){
				echo 'Ошибка при загрузке набора символов utf8:'.self::$mysqli[$key]->error;
				exit();
			}
		}
		return self::$mysqli[$key];
	}
	static public function close($key){
		self::$mysqli[$key]->close();
		unset(self::$mysqli[$key]);
	}
}


function wtf($array, $stop = false) {
	echo '<pre>'.print_r($array,1).'</pre>';
	if(!$stop) {
		exit;
	}
}
/* function q($link, $query){
	$res = mysqli_query($link,$query);
	if($res === false){
		//$info = debug_backtrace();
		//wtf($info);
		echo "Запрос: ".$query.'<br>'.mysqli_error($link);
		// Можно отправить уведомление на почту
		// Логировать ошибки в в файл file_put_contents('./log/mysql.log', strip_tags($query)."\n\n", FILE_APPEND);
		exit;
	}else{
		return $res;
	}
}
Тогда запрос можно писать так:
$res = q($link, "SELECT * FROM `users`
WHERE `id` = '11'
ORDER BY `id`
");
Также, чтобы не писать всякий раз $link:
$link = $GLOBALS('link');
global $link;
Тогда запрос можно писать так:
$res = q("SELECT * FROM `users`
WHERE `id` = '11'
ORDER BY `id`
");
Итог:

function q($query){
	global $link;
	$res = mysqli_query($link,$query);
	if($res === false){
		$info = debug_backtrace();
		//wtf($info);
		$error = date("Y-m-d H:i:s")." Запрос: ".$query."<br>\n"."В файле: ".$info[0]['file']."<br>\n"."На строке: ".$info[1]['line'];
		// Можно отправить уведомление на почту
		file_put_contents('./logs/mysql.log', strip_tags($error)."\n\n", FILE_APPEND);
		echo $error;
		exit;
	}else{
		return $res;
	}
}

function trimAll($el){
	if(!is_array($el)){
		$el = trim($el);
	} else {
		$el = array_map('trimAll', $el);
	}
	return $el;
}
/* Использовать так:
$array = trimAll($array);
$_POST = trimAll($_POST);
без функции делал так:
foreach($_POST as $k => $v) {
			$_POST[$k] = trim($v);
		}


function intAll($el){
	if(!is_array($el)){
		$el = (int)$el;
	} else {
		$el = array_map('intAll', $el);
	}
	return $el;
}
function floatAll($el){
	if(!is_array($el)){
		$el = (float)$el;
	} else {
		$el = array_map('floatAll', $el);
	}
	return $el;
}
function hc($el){
	if(!is_array($el)){
		$el = htmlspecialchars($el);
	} else {
		$el = array_map('hc', $el);
	}
	return $el;
}
function es($el,$key = 0){
	return DB::_($key)->real_escape_string($el);
}

//подключаем классы
spl_autoload_register(function ($class) {
	include './libs/class_'.$class.'.php';
});

function myHash($var){
	$salt = 'abc';
	$salt2 = 'cba';
	$var = crypt(md5($var.$salt), $salt2);
	return $var;
}
*/

