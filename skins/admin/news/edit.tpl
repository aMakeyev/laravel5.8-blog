<div class="page-conteiner clearfix">
	<div class="new-comment">
		<h4>Редактирование новости</h4>
		<form action="" method="post"enctype="multipart/form-data">
			<p><b>Заголовок новости: *</b></p>
			<p><input type="text" name="title" value="<?php echo htmlspecialchars($row['title']); ?>">
				<?php if(isset($errors['title'])) {echo $errors['title'];} ?></p>
			<p><b>Категория новости: *<br></b></p>
			<select name="cat">
				<?php foreach($cat as $v) {
					if($row['cat'] == $v) {
						echo '<option selected="selected">'.hc($v).'</option>';
					}else{
						echo '<option>'.hc($v).'</option>';
					}
				}?>
			</select>
				<?php if(isset($errors['cat'])) {echo $errors['cat'];} ?></p>
			<p><b>Описание новости: *</b></p>
			<p><textarea name="description"><?php echo htmlspecialchars($row['description']);?></textarea>
				<?php if(isset($errors['description'])) {echo $errors['description'];} ?></p>
			<p><b>Полный текст новости: *</b></p>
			<p><textarea name="text"><?php echo htmlspecialchars($row['text']);?></textarea>
				<?php if(isset($errors['text'])) {echo $errors['text'];} ?></p>
			<p><b>Изображение товара:<br></b></p>
			<?php  if(isset($_SESSION['file'])) {?>
				<img src="<?php echo '/uploaded/news_200x200/'.hc($_SESSION['file']) ?>">
			<?php } else {?> <img src="<?php echo '/uploaded/news_200x200/'.hc($row['img']) ?>"> <?php }?> <br>
			<?php if(isset($infoload)){ echo $infoload;} ?><br>
			<input type="file" accept="image/gif, image/jpeg, image/png" name="file"><br>
			<p>* - обязательно для заполнения</p>
			<input type="submit" name="ok" value="Изменить новость">
		</form>
	</div>
</div>
