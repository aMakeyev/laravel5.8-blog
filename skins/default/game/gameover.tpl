<div class="page-conteiner clearfix">
	<?php
	if($_SESSION['user'] <= 0){
		echo '<h1>'.'Конец игры. Победил сервер!'.'</h1>';
	}
	else{
		echo '<h1>'.'Конец игры. Вы победили!'.'</h1>';
	}
	unset($_SESSION['user']);
	unset($_SESSION['server']);
	session_destroy();
	?>
</div>