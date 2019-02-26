<?php
class Core{
	static $CREATED = 2017;
	static $CONT = 'modules'; //т.е. controller
	static $SKIN = 'default';
	static $DB_LOCAL = 'localhost';
	static $DB_LOGIN = 'root';
	static $DB_PASS = 'root';
	static $DB_NAME = 'main';
	static $DOMAIN = 'http://teashop/';
	static $JS = array();
	static $CSS = array();
	static $META = array(
		'title'=>'стандартный TITLE',
		'description'=>'d',
		'keywords'=>'k'
	);
}

/* было через константы
define('SKIN','default');
define('DB_LOCAL','localhost');
define('DB_LOGIN','root');
define('DB_PASS','root');
define('DB_NAME', 'main');
define ('ADMINLOGIN','alex');
define('ADMINPASS','3519');

$res = q("
	SELECT *
	FROM `meta`
	WHERE '".es($_GET['modules'])."_".es($_GET['page'])."'
");
$row = mysqli_fetch_assoc($res);
Core::$META = $row;
*/