<div class="page-conteiner clearfix">
	<?php if(isset($info)){ ?>
	<h3><?php echo $info; ?></h3>
	<?php } ?>
	<a class="add-goods" href="/admin/goods/add">Добавить новый товар</a>
	<br>
	<h1>Товары:</h1>
	<form action="" method="post">
		<?php while($row2 = $goods_cat->fetch_assoc()){ ?>
			<label><input class="chbox" type="checkbox" name="search_cat[]" onchange="this.form.submit()" value="<?php echo (int)$row2['id']; ?>" <?php if(isset($_POST['search_cat']) && in_array($row2['id'], $_POST['search_cat'])){ echo 'checked';} ?>><b><?php echo hc($row2['name']); ?></b></label>
		<?php } ?>
<!--		<input type="submit" name="search" value="Найти">-->
	</form>
	<br>
		<?php if(!isset($errorGoods)) { ?>
			<?php if(isset($search_cat)) { ?>
				<form action="" method="post">
					<?php while($row1 = $search_cat->fetch_assoc()) { ?>
						<div class="news-block">
							<div class="news">
								<b><?php echo hc($row1['title']); ?></b>
								<?php echo $row1['date']; ?><br>
								<img src="<?php echo '/uploaded/goods_200x200/'.hc($row1['img']); ?>"><br>
								<input type="checkbox" name="ids[]" value="<?php echo $row1['id']; ?>">
								<a href="/admin/goods?action=delete&id=<?php echo $row1['id']; ?>">Удалить </a>
								<a href="/admin/goods/edit?id=<?php echo $row1['id']; ?>">Редактировать </a>
							</div>
						</div>
					<?php } ?>
					<input type="submit" name="delete" value="Удалить отмеченные записи">
				</form>
			<?php } else { ?>
				<form action="" method="post">
					<?php while($row = $goods->fetch_assoc()) { ?>
						<div class="news-block">
							<div class="news">
								<b><?php echo hc($row['title']); ?></b>
								<?php echo $row['date']; ?><br>
								<img src="<?php echo '/uploaded/goods_200x200/'.hc($row['img']); ?>"><br>
								<input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">
								<a href="/admin/goods?action=delete&id=<?php echo $row['id']; ?>">Удалить </a>
								<a href="/admin/goods/edit?id=<?php echo $row['id']; ?>">Редактировать </a>
							</div>
						</div>
					<?php } ?>
					<input type="submit" name="delete" value="Удалить отмеченные записи">
				</form>
			<?php }
		}else{?>
		<h1><?php echo $errorGoods;?></h1>
<?php }?>

</div>
