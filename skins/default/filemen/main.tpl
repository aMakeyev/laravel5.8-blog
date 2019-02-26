<div class="page-conteiner clearfix">
	<h1>Файловый менеджер</h1><br>
	<div class="filemen">
		<?php
		foreach($files as $v) {
			if(is_dir($dir . $v)) {	?>
				<a href="/index.php?module=filemen&link=<?php echo(isset($_GET['link']) ? $_GET['link'].'/'.$v : $v); ?>"><img src="/skins/default/img/folder.png" alt="folder"><?php echo $v ?></a><br>
			<?php
			}
			else {
				echo '<img src="/skins/default/img/file.png" alt="file">'.$v.'<br>';
			}
		}?>
	</div>
</div>