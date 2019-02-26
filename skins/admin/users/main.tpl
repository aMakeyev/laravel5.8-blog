<div class="page-conteiner clearfix">
	<?php if(isset($info)){ ?>
		<h2><?php echo $info; ?></h2>
	<?php } ?>
	<form class="search" action="" method="post">
		<b>Поиск по логину:</b>
		<input type="text" name="searchusers" value=""><br><br>
		<input type="submit" name="search" value="Найти">
	</form>
	<?php if(isset($searchusers)){ ?>
		<h1>Результат поиска:</h1>
			<?php if(mysqli_num_rows($searchusers)){ ?>
			<form action="" method="post">
			<?php while($row = mysqli_fetch_assoc($searchusers)){ ?>
				<div class="news-block">
					<div class="news">
						<input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
						<img src="<?php echo '/uploaded/users_45x45/'.hc($row['img']); ?>">
						<b><?php echo hc($row['login']); ?>  </b>
						Зарегистрирован: <?php echo hc($row['date']); ?>
						<a href="/admin/users?action=delete&id=<?php echo $row['id']; ?>">Удалить </a>
						<a href="/admin/users/edit?id=<?php echo $row['id']; ?>">Редактировать </a>
					</div>
				</div>
				<?php } ?>
				<input type="submit" name="delete" value="Удалить отмеченные записи">
			</form>
		<?php } else {
				echo 'Поиск не дал результатов';
			}
		} else {?>
	<br>
	<h1>Все пользователи:</h1>
	<form action="" method="post">
	<?php while($row = mysqli_fetch_assoc($users)){ ?>
		<div class="news-block">
			<div class="news">
				<input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
				<img src="<?php echo '/uploaded/users_45x45/'.hc($row['img']); ?>">
				<b><?php echo hc($row['login']); ?>  </b>
				Зарегистрирован: <?php echo hc($row['date']); ?>
				<a href="/admin/users?action=delete&id=<?php echo $row['id']; ?>">Удалить </a>
				<a href="/admin/users/edit?id=<?php echo $row['id']; ?>">Редактировать </a>
			</div>
		</div>
	<?php } ?>
	<input type="submit" name="delete" value="Удалить отмеченные записи">
	</form>
<?php } ?>
</div>