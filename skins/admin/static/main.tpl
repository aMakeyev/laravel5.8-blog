<?php
if(!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5) {
	include './skins/default/cab/auth.tpl';
} else {?>
	<div class="page-conteiner clearfix">
		<h1>Админка</h1>
	</div>
<?php } ?>