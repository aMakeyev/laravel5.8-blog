<div class="page-conteiner clearfix">
	<div class="new-comment">
		<img src="<?php echo '/uploaded/goods_200x200/'.hc($row['img']); ?>"><br>
		<p><b>Название товара:</b></p>
			<?php echo hc($row['title']); ?>
			<p><b>Категория товара:<br></b></p>
		<?php foreach($cat as $v){ echo hc($v).'. ';} ?>
			<p><b>Цена товара:<br></b></p>
			<?php echo hc($row['price']); ?>
			<p><b>Наличие товара:<br></b></p>
			<?php echo hc($row['avail']); ?>
			<p><b>Описание товара:</b></p>
			<?php echo hc($row['description']); ?>
			<p><b>Доставка:<br></b></p>
			<?php echo hc($row['deliv']); ?>
			<p><b>Гарантия:<br></b></p>
			<?php echo hc($row['warr']); ?>

	</div>
</div>
