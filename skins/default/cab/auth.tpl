<div class="page-conteiner clearfix">
	<div class="auth">
		<?php if(!isset($_SESSION ['authok'])){ //echo wtf($_COOKIE,1);?>
		<h4>Авторизация</h4>
		<div class="auth-wrapper">
			<form action="" method="post" class="auth-box">
				<label>Логин</label><br>
				<input class="inpt" type="text" name="login" value="<?php if(isset($_POST['login'])) {echo htmlspecialchars($_POST['login']);} ?>">
				<?php if(isset($errors['login'])) {echo $errors['login'];} ?><br><br>
				<label>Пароль</label><br>
				<input class="inpt" type="password" name="password" value="<?php if(isset($_POST['password'])) {echo htmlspecialchars($_POST['password']);} ?>">
				<?php if(isset($errors['password'])) {echo $errors['password'];} ?><br>
				<?php if(isset($_SESSION['autherror'])) {echo $_SESSION['autherror'];} ?><br>
				<label><input class="chbox" type="checkbox" name="autoauth">Запомнить</label><br><br>
				<button type="submit" name="sendreg">Войти</button>
			</form>
		</div>
		<?php } else {
			unset($_SESSION ['authok']);
			?>
			<div class="reg-ok">Вы успешно авторизовались на сайте!</div><br><br>
		<?php }?>
	</div>
</div>