<div class="page-conteiner clearfix">
	<div class="new-comment">
		<h4>Добавление товара</h4>
		<form action="" method="post" enctype="multipart/form-data">
		<p><b>Название товара *:</b></p>
		<p><input type="text" name="title" value="<?php  if(isset($_POST['title'])) {echo hc($_POST['title']);} ?>">
			<?php if(isset($errors['title'])) {echo $errors['title'];} ?></p>
		<p><b>Категория товара *:<br></b></p>
			<?php while($row2 = $goods_cat->fetch_assoc()){ ?>
				<label><input class="chbox" type="checkbox" name="cat[]" value="<?php echo (int)$row2['id']; ?>" <?php if(isset($_POST['cat']) && in_array($row2['id'], $_POST['cat'])){ echo 'checked';} elseif ($row2['id'] == 1){ echo 'checked';} ?>><b><?php echo hc($row2['name']); ?></b></label>
			<?php } ?>
			<?php if(isset($errors['cat'])) {echo $errors['cat'];} ?>
			<p><b>Цена товара *:<br></b></p>
		<p><input type="text" name="price" value="<?php  if(isset($_POST['price'])) {echo hc($_POST['price']);} ?>"> руб.
			<?php if(isset($errors['price'])) {echo $errors['price'];} ?></p>
		<p><b>Наличие товара *:<br></b></p>
			<select name="avail">
				<option selected="selected">Есть</option>
				<option>Нет</option>
			</select>
			<?php if(isset($errors['avail'])) {echo $errors['avail'];} ?>
			<p><b>Описание товара *:</b></p>
		<p><textarea name="description"><?php if(isset($_POST['description'])) {echo hc($_POST['description']);} ?></textarea>
			<?php if(isset($errors['description'])) {echo $errors['description'];} ?></p>
			<p><b>Доставка:<br></b></p>
			<p><input type="text" name="deliv" value="<?php  if(isset($_POST['deliv'])) {echo hc($_POST['deliv']);} ?>"></p>
			<p><b>Гарантия:<br></b></p>
			<p><input type="text" name="warr" value="<?php  if(isset($_POST['warr'])) {echo hc($_POST['warr']);} ?>"></p><br>

			<p><b>Изображение товара:<br></b></p>
			<?php  if(isset($_SESSION['file'])) {?><img src="<?php echo '/uploaded/goods_200x200/'.hc($_SESSION['file']) ?>"><?php } ?><br>
			<?php if(isset($infoload)){ echo $infoload;} ?><br>
				<input type="file" accept="image/gif, image/jpeg, image/png" name="file"><br>
			<p>* - обязательно для заполнения</p>
			<input type="submit" name="ok" value="Добавить товар">
		</form>
	</div>
</div>