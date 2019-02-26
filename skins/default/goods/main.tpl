<div class="page-conteiner clearfix">
	<?php if(isset($info)){ ?>
	<h1><?php echo $info; ?></h1>
	<?php } ?>
	<br>
	<h1>Товары:</h1>
	<form action="" method="get">
		<?php while($row2 = $goods_cat->fetch_assoc()){ ?>
			<label><input class="chbox" type="checkbox" name="search_cat[]" onchange="this.form.submit()" value="<?php echo (int)$row2['id']; ?>" <?php if(isset($_GET['search_cat']) && in_array($row2['id'], $_GET['search_cat'])){ echo 'checked';} ?>><b><?php echo hc($row2['name']); ?></b></label>
		<?php } ?>
		<!--<input type="submit" name="search" value="Найти">-->
	</form>
	<br>
		<?php if(!isset($errorGoods)) { ?>
			<?php if(isset($search_cat)) { ?>
				<?php while($row1 = $search_cat->fetch_assoc()) { ?>
					<div class="news-block">
						<div class="news">
							<b><?php echo hc($row1['title']); ?></b>
							<?php echo $row1['date']; ?><br>
							<i>Категория: </i>
							<?php while($row3 = $goods2goods_cat->fetch_assoc()){
								if($row3['goods_id'] == $row1['id']){
									while($row2 = $goods_cat->fetch_assoc()){
										if($row2['id'] == $row3['cat_id'])
											echo $row2['name'] . ' ';
									}
									mysqli_data_seek($goods_cat, 0);
								}

							}?><br>
							<img src="<?php echo '/uploaded/goods_200x200/'.hc($row1['img']); ?>"><br>
							<a href="/goods/more?id=<?php echo $row1['id']; ?>">Подробнее </a>
						</div>
					</div>
				<?php mysqli_data_seek($goods2goods_cat, 0);
				}?>
					<div class="paginator clearfix">
					<?php if($paginator->num > ++$neighbours) { ?>
						<a href="/goods/main?num=1">1 </a>...
						<a href="/goods/main?num=<?php echo $paginator->num-1; ?>">←Предыдущая </a>
					<?php } ?>
					<?php for ($i=$paginator->left_neighbour; $i<=$paginator->right_neighbour; $i++) {
						if ($i != $paginator->num) {
							echo '<a href="/goods/main?search_cat[]='.hc($cats).'&num='.$i.'">'.$i.' </a>';
						} else {
							echo '<b class="current" >'.$i.'</b>';
						}
					}
					if($paginator->num < $lastPage - $neighbours) { ?>
						<a href="/goods/main?num=<?php echo $paginator->num+1; ?>"> Следующая→</a>...
						<a href="/goods/main?num=<?php echo $lastPage; ?>"><?php echo $lastPage; ?></a>
					<?php } ?>
					</div>
			<?php }else {
				while($row = $goods->fetch_assoc()) { ?>
					<div class="news-block">
						<div class="news">
							<b><?php echo hc($row['title']); ?></b>
							<?php echo $row['date']; ?><br>
							<i>Категория: </i>
							<?php while($row3 = $goods2goods_cat->fetch_assoc()){
								if($row3['goods_id'] == $row['id']){
									while($row2 = $goods_cat->fetch_assoc()){
										if($row2['id'] == $row3['cat_id']){
											echo $row2['name'] . '. ';
										}
									}
								}
								mysqli_data_seek($goods_cat, 0);
							}?><br>
							<img src="<?php echo '/uploaded/goods_200x200/'.hc($row['img']); ?>"><br>
							<a href="/goods/more?id=<?php echo $row['id']; ?>">Подробнее </a>
						</div>
					</div>
					<?php mysqli_data_seek($goods2goods_cat, 0);
				}?>
				<div class="paginator clearfix">
					<?php if($paginator->num > ++$neighbours) { ?>
						<a href="/goods/main?num=1">1 </a>...
						<a href="/goods/main?num=<?php echo $paginator->num-1; ?>">←Предыдущая </a>
					<?php } ?>
					<?php for ($i=$paginator->left_neighbour; $i<=$paginator->right_neighbour; $i++) {
						if ($i != $paginator->num) {
							echo '<a href="/goods/main?num='.$i.'">'.$i.' </a>';
						} else {
							echo '<b class="current" >'.$i.'</b>';
						}
					}
					if($paginator->num < $paginator->lastPage - $neighbours) { ?>
						<a href="/goods/main?num=<?php echo $paginator->num+1; ?>"> Следующая→</a>...
						<a href="/goods/main?num=<?php echo $paginator->lastPage; ?>"><?php echo $paginator->lastPage; ?></a>
					<?php } ?>
				</div>
			<?php }
		}else{?>
	<h1><?php echo $errorGoods;?></h1>
<?php }?>
</div>