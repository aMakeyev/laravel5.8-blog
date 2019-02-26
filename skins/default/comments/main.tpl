
<div class="page-conteiner clearfix">
	<?php
	if (mysqli_num_rows($res)){ ?>
	<h1>Всего у нас на сайте оставлено <?php echo mysqli_num_rows($res) ?> отзывов:</h1><br>
		<div class="comments-block">
		<?php
			$j = 0;
			while($row = mysqli_fetch_assoc($res)){ ?>
			<div class="comments">
				<div class="comment">
					<div class="comment-title"> <?php echo htmlspecialchars($row['name'])?> <span class="comment-title-date">написал:</span></div>
					<div class="comment-body"><?php echo htmlspecialchars(nl2br($row['comment']))?></div>
				</div>
			</div>
			<?php }?>
		</div>
			<?php } else {
		echo 'На сайте пока не осталено отзывов.';
		}?>
	<?php if(isset($_SESSION['user'])){
	if(!isset($_SESSION ['commentok'])){ ?>
	<div class="new-comment">
		<h4>Напишите свой отзыв:</h4>
		<form id="comment-form" action="" method="post">
			<!--<p><b>Имя:</b></p>
			<p><input type="text" name="name" value="<?php /*if(isset($_POST['name'])) {
					echo htmlspecialchars($_POST['name']);
				} */?>">
				<?php /*if(isset($errors['name'])) {
					echo $errors['name'];
				} */?>
			</p>
			<p><b>E-mail:</b></p>
			<p><input type="email" name="email" value="<?php /*if(isset($_POST['email'])) {
					echo htmlspecialchars($_POST['email']);
				} */?>">
				<?php /*if(isset($errors['email'])) {
					echo $errors['email'];
				} */?>
			</p>-->
			<p><textarea name="comment"><?php if(isset($_POST['comment'])) {
						echo htmlspecialchars($_POST['comment']);
					} ?></textarea>
				<?php if(isset($errors['comment'])) {
					echo $errors['comment'];
				} ?>
			</p>
			<div id="error"></div>
			<button id="btn-comment" type="submit">Отправить</button>
		</form>
		<?php }    else {
		unset($_SESSION ['commentok']);
		?>
		<h3>Ваш отзыв успешно добавлен!</h3>
		<?php }
		} else{?>
		<h2>Чтобы оставить свой отзыв, необходимо авторизоваться:</h2><br>
		<div class="comment-reg">
			<a class="account" href='/cab/registration'>
				Зарегистрироваться
			</a>
			<a class="sign-in" href='/cab/auth'>
				Войти
			</a>
		</div>
		<?php } ?>
	</div>
</div>


<!--
<div class="comments">

			<p><b>Отзывы посетителей сайта:</b></p>
			<hr>
			<div class="comments-block">
				<div class="comment">
					<div class="comment_title"> Игорь <span class="comment_title-date">11.03.2018 14:20</span></div>
					<div class="comment_body">This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes.</div>
				</div>
				<div class="comment">
					<div class="comment_title"> Олег <span class="comment_title-date">21.03.2018 17:20</span></div>
					<div class="comment_body">This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes.</div>
				</div>
				<div class="my-comment">
					<div class="comment_title"> Алексей Макеев <span class="comment_title-date">27.01.2014 19:27</span></div>
					<div class="comment_body">This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes.</div>
				</div>
			</div>
				<div class="new-comment" style="height:1px;"></div>

		</div>
	</div>
--!>