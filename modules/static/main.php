<?php
/*$link = mysqli_connect('localhost', 'root', 'root', 'main');
$res = mysqli_query($link, "SELECT * FROM `users` ORDER BY `id`") or exit(mysqli_error());
// проверяем существует ли такая запись и сколько их
if (mysqli_num_rows($res)){
	echo 'Всего у нас на сайте '.mysqli_num_rows($res).' пользователей зарегистрировано<br>
	А именно:<ul>
	';
	$i = 0;
	while($row = mysqli_fetch_assoc($res)){
		echo '<li>'.++$i.'. '.htmlspecialchars($row['login']).'</li>';
	}
	echo '</ul>';
} else {
	'Нет записей';
}

exit();
*/