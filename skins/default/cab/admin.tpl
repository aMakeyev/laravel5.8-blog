<div class="page-conteiner">
	<?php
	if($_SERVER['REMOTE_ADDR'] != '127.0.0.1'){
		echo '<h2>'.'Вход только для админов!'.'</h2>';
	}
	?>
</div>
