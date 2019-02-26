<div class="page-conteiner clearfix">
	<div class="new-comment">
		<h4>Редактирование пользователя</h4>
		<form action="" method="post" enctype="multipart/form-data">
			<p><b>Логин: *</b></p>
			<p><input type="text" name="login" value="<?php echo hc($row['login']); ?>">
				<?php if(isset($errors['login'])) {echo $errors['login'];} ?></p>
			<p><b>Пароль: </b></p>
			<input type="text" name="password" value="<?php if(isset($_POST['password'])) {echo hc($_POST['password']);}?>">
			<?php if(isset($errors['password'])) {echo $errors['password'];} ?><br><br>
			<p><b>Email: *<br></b></p>
			<p><input type="text" name="email" value="<?php echo hc($row['email']); ?>">
				<?php if(isset($errors['email'])) {echo $errors['email'];} ?></p>
			<p><b>Возраст: <br></b></p>
			<p><input type="text" name="age" value="<?php echo hc($row['age']); ?>">
				<?php if(isset($errors['age'])) {echo $errors['age'];} ?></p>
			<p><b>Регистрация: <br></b></p>
			<input type="radio" name="active" <?php if($row['active'] == 1){ echo 'checked';} ?> value=1> Авторизован
			<input type="radio" name="active" <?php if($row['active'] == 0){ echo 'checked';} ?> value=0> Неавторизован<br>
			<p><b>Доступ: <br></b></p>
			<input type="radio" name="access" <?php if($row['access'] == 1){ echo 'checked';} ?> value=1> Пользователь
			<input type="radio" name="access"  <?php if($row['access'] == 5){ echo 'checked';} ?> value=5> Админ
			<input type="radio" name="access"  <?php if($row['access'] == 0){ echo 'checked';} ?> value=0> Забанить<br>
			<p><b>Аватар:<br></b></p>
			<?php  if(isset($_SESSION['file'])) {?>
				<img src="<?php echo '/uploaded/users_45x45/'.hc($_SESSION['file']) ?>">
			<?php } else {?> <img src="<?php echo '/uploaded/users_45x45/'.hc($row['img']) ?>"> <?php }?> <br>
			<?php if(isset($infoload)){ echo $infoload;} ?><br>
			<input type="file" accept="image/gif, image/jpeg, image/png" name="file"><br>
			<p>* - обязательно для заполнения</p>
			<input type="submit" name="ok" value="Сохранить изменения">
		</form>
	</div>
</div>
