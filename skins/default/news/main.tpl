<div class="page-conteiner clearfix">
	<?php
	if(isset($info)){ ?>
	<h1><?php echo $info; ?></h1>
	<?php } ?>
	<br>
	<h1>Новости:</h1>
	<form action="" method="get">
		<?php while($row2 = $news_cat->fetch_assoc()){ ?>
			<label><input type="radio" name="search_cat" onChange="this.form.submit()" <?php if(isset($_GET['search_cat']) && $row2['name'] == $_GET['search_cat']){ echo 'checked';} ?> value="<?php echo $row2['name']; ?>">
			<b><?php echo hc($row2['name']);?></b></label>
		<?php } ?>
	</form>
	<br>
	<?php if(isset($search_cat)) { ?>
		<?php while($row1 = $search_cat->fetch_assoc()){ ?>
		<div class="news-block">
			<div class="news">
				<b><?php echo hc($row1['title']); ?></b>
				<?php echo $row1['date'];  ?><br>
				<img src="<?php echo '/uploaded/news_200x200/'.hc($row1['img']); ?>"><br>
				<a href="/news/more?id=<?php echo $row1['id']; ?>">Подробнее </a>
			</div>
		</div>
		<?php } ?>
			<div class="paginator clearfix">
				<?php if($paginator->num > ++$neighbours) { ?>
					<a href="/news/main?num=1">1 </a>...
					<a href="/news/main?num=<?php echo $paginator->num-1; ?>">←Предыдущая </a>
				<?php } ?>
				<?php for ($i=$paginator->left_neighbour; $i<=$paginator->right_neighbour; $i++) {
					if ($i != $paginator->num) {
						echo '<a href="/news/main?search_cat='.hc($_GET['search_cat']).'&num='.$i.'">'.$i.' </a>';
					} else {
						echo '<b class="current" >'.$i.'</b>';
					}
				}
				if($paginator->num < $lastPage - $neighbours) { ?>
					<a href="/news/main?num=<?php echo $paginator->num+1; ?>"> Следующая→</a>...
					<a href="/news/main?num=<?php echo $lastPage; ?>"><?php echo $lastPage; ?></a>
				<?php } ?>
			</div>
		<?php } else {
		while($row = $news->fetch_assoc()){ ?>
		<div class="news-block">
			<div class="news">
				<b><?php echo hc($row['title']); ?></b>
				<?php echo $row['date'];  ?><br>
				<img src="<?php echo '/uploaded/news_200x200/'.hc($row['img']); ?>"><br>
				<a href="/news/more?id=<?php echo $row['id']; ?>">Подробнее </a>
			</div>
		</div>
	<?php } ?>
		<div class="paginator clearfix">
			<?php if($paginator->num > ++$neighbours) { ?>
				<a href="/news/main?num=1">1 </a>...
				<a href="/news/main?num=<?php echo $paginator->num-1; ?>">←Предыдущая </a>
			<?php } ?>
			<?php for ($i=$paginator->left_neighbour; $i<=$paginator->right_neighbour; $i++) {
				if ($i != $paginator->num) {
					echo '<a href="/news/main?num='.$i.'">'.$i.' </a>';
				} else {
					echo '<b class="current" >'.$i.'</b>';
				}
			}
			if($paginator->num < $paginator->lastPage - $neighbours) { ?>
				<a href="/news/main?num=<?php echo $paginator->num+1; ?>"> Следующая→</a>...
				<a href="/news/main?num=<?php echo $paginator->lastPage; ?>"><?php echo $paginator->lastPage; ?></a>
			<?php } ?>
		</div>

		<!--<div class="paginator clearfix">
				<?php /*if($num > ++$neighbours) { */?>
			<a href="/news/main?num=1">1 </a>...
			<a href="/news/main?num=<?php /*echo $num-1; */?>">←Предыдущая </a>
			<?php /*} */?>
			<?php /*for ($i=$left_neighbour; $i<=$right_neighbour; $i++) {
				if ($i != $num) {
					echo '<a href="/news/main?num='.$i.'">'.$i.' </a>';
				} else {
					echo '<b class="current" >'.$i.'</b>';
				}
			}
			if($num < $lastPage - $neighbours) { */?>
			<a href="/news/main?num=<?php /*echo $num+1; */?>"> Следующая→</a>...
			<a href="/news/main?num=<?php /*echo $lastPage; */?>"><?php /*echo $lastPage; */?></a>
		<?php /*} */?>
		</div>
		-->
	<?php } ?>

</div>