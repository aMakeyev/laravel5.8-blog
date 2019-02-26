<?php

$users = array(//создаем массив
	'login' => 'alexey',
	'age' => '33',
	'status' => 'ok'
);
echo json_encode($users);// js o - объект. Функция возвращает массив в виде объекта

