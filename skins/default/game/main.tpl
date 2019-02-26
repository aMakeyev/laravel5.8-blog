<div class="page-conteiner clearfix">
	<h1>Игра "Битва с сервером"</h1><br>
	<p class="hit"><?php echo $hit;?></p>
	<h2>Текущий счёт:</h2>
	<h3>У сервера - <?php echo $_SESSION['server'];?> хп</h3>
	<h3>У вас - <?php echo $_SESSION['user'];?> хп</h3>
	<form class="game" action="" method="post">
		<h2>Ударьте сервер цифрой от 1 до 3</h2>
		<input type="text" name="num">
		<span><?php echo @$errornum; ?></span><br><br>
		<button type="submit">Удар</button>
	</form>
</div>

