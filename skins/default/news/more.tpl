<div class="page-conteiner clearfix">
	<div class="new-comment">
			<img src="<?php echo '/uploaded/news_200x200/'.hc($row['img']); ?>"><br>
			<h2><?php echo hc($row['title']); ?></h2>
			<p><b>Категория новости:<br></b></p>
			<?php echo hc($row['cat']); ?>
			<p><b>Описание новости:</b></p>
			<?php echo hc($row['description']); ?>
			<p><b>Полный текст новости:<br></b></p>
			<?php echo hc($row['text']); ?>
	</div>
</div>
