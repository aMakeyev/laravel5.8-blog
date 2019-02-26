<!DOCTYPE html>
<html lang="en">
<head>
	<title><?php echo hc(Core::$META['title']); ?></title>
	<meta charset="utf-8">
	<meta name="description" content="<?php echo hc(Core::$META['description']); ?>" />
	<meta name="keywords" content="<?php echo hc(Core::$META['keywords']); ?>" />
	<link href="/skins/default/css/normalize.css" rel="stylesheet"/>
	<link href="/skins/default/css/style.css" rel="stylesheet" type="text/css">
	<link href="/skins/admin/css/style.css" rel="stylesheet" type="text/css">
	<?php if(count(Core::$CSS)) {echo implode("\n",Core::$CSS);} ?>
	<?php if(count(Core::$JS)) {echo implode("\n",Core::$JS);} ?>
	<script src="/skins/default/js/javascript_v1.js"></script>
	<script src="/skins/default/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<header>
	<div class="header-wrapper">
			<a class="logo" href="/">
				<img src="/skins/admin/img/logo.png" alt="logo" >
			</a>
		<div class="head-right">
			<?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] == 5){ ?>
			<a class="account" href="#">
				Админ <?php echo hc($_SESSION['user']['login']);?>
			</a>
			<a class="sign-in" href='/admin/cab/exit'>
				Выход
			</a>
			<?php } ?>
		</div>
	</div>
	</header>
	<?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] == 5){ ?>

		<div class="main-nav clearfix">
			<div class="main-nav-wrapper">
		<nav>
			<a href='/admin/users'>Пользователи</a>
			<a href='/admin/news'>Новости</a>
			<a href='/admin/goods'>Товары</a>
		</nav>
		<form class="search-form" action="" method="get">
			<input class="search-input">
			<a class="search-button">
				<div class="search-icon"></div>
			</a>
		</form>
		</div>
		</div>
	<?php } ?>
			<main>
				<?php echo $content; ?>
			</main>

		<footer>
			<div class="copyright">
				<span>© <?php echo Core::$CREATED. ' - '.date('Y'); ?> </span> <a href="#">Ecommerce software by PrestaShop™</a>
			</div>
		</footer>
</body>
</html>