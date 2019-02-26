<div class="page-conteiner clearfix">
	<div class="auth">
		<h3>Регистрация в магазине</h3>
		<div class="auth-wrapper">
				<?php if(!isset($_SESSION ['regok'])){ ?>
				<form class="reg-box" action="" method="post" enctype="multipart/form-data" >
					<label>Логин *</label><br>
					<input type="text" name="login" value="<?php if(isset($_POST['login'])) {echo htmlspecialchars($_POST['login']);}?>"> <!--Чтобы запоминалось значение поля при неправильном вводе другого + От XSS-иньекций (т.е.чтобы теги не выводились на экран в форме) - так для всего, что выводим-->
						<?php if(isset($errors['login'])) {echo $errors['login'];} ?><br><br>
						<!--тоже что и if(isset... echo $errors['login'];-->
					<label>Пароль *</label><br>
					<input type="password" name="password" value="<?php if(isset($_POST['password'])) {echo htmlspecialchars($_POST['password']);}?>">
					<?php if(isset($errors['password'])) {echo $errors['password'];} ?><br><br>
					<label>E-mail *</label><br>
					<input type="email" name="email" value="<?php if(isset($_POST['email'])) {echo htmlspecialchars($_POST['email']);}?>">
					<?php if(isset($errors['email'])) {echo $errors['email'];} ?><br><br>
					<label>Возраст</label><br>
					<input type="text" name="age" value="<?php if(isset($_POST['age'])) {echo htmlspecialchars($_POST['age']);} ?>"><br><br>
					<p><b>Аватар:<br></b></p>
					<?php  if(isset($_SESSION['file'])) {?><img src="<?php echo '/uploaded/users_45x45/'.hc($_SESSION['file']) ?>"><?php } ?><br>
					<?php if(isset($infoload)){ echo $infoload;} ?><br>
					<input type="file" accept="image/gif, image/jpeg, image/png" name="file"><br>
					<p>* - обязательно для заполнения</p>
					<button type="submit" name="sendreg">Зарегистрироваться</button>

				</form>
			<?php } else {
			unset($_SESSION ['regok']);
			?>
			<div class="reg-ok">Для завершения регистрации проверьте почту.</div><br><br>
			<?php }?>
		</div>
		<div class="reg-info">
		<?php
		if (mysqli_num_rows($res)){
			echo 'Всего у нас на сайте зарегистрировано '.mysqli_num_rows($res).' пользователей:<br>
			<ul class="reg-list">
				';
				$i = 0;
				while($row = mysqli_fetch_assoc($res)){
				echo '<li>'.++$i.'. '.hc($row['login']).'</li>';
				}
				echo '</ul>';
			} else {
				echo 'Нет записей';
			}?>
		</div>
	</div>
</div>


<!-- чтобы каждый раз не выскакивало это сообщение удалили сессию-->
<!--
<select name="sex">
	<?php foreach($sex as $v) { ?>
	<option value="<?php echo $v; ?>"><?php echo $v; ?></option>
	<?php } ?>
</select>
exit();
-->