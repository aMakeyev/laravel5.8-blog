<!DOCTYPE html>
<html lang="en">
<head>
	<title><?php echo hc(Core::$META['title']); ?></title>
	<meta charset="utf-8">
	<meta name="description" content="<?php echo hc(Core::$META['description']); ?>" />
	<meta name="keywords" content="<?php echo hc(Core::$META['keywords']); ?>" />
	<link href="/skins/default/css/normalize.css" rel="stylesheet"/>
	<link href="/skins/default/css/style.css" rel="stylesheet"/>
	<?php if(count(Core::$CSS)){echo implode("\n",Core::$CSS);} ?>
	<?php if(count(Core::$JS)){echo implode("\n",Core::$JS);} ?>
	<script src="/skins/default/js/javascript_v1.js"></script>
	<script src="/skins/default/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<header>
	<div class="header-wrapper">
			<a class="logo" href="/">
				<img src="/skins/default/img/logo.png" alt="logo">
			</a>
		<div class="head-right">
			<a class="cart" href="#">
				<div class="cart-icon20"></div>
				<span>Cart (empty)</span>
				<div class="simbol1"></div>
			</a>

			<?php if(!isset($_SESSION['user'])){ ?>
			<a class="account" href='/cab/registration'>
				Зарегистрироваться
			</a>
			<a class="sign-in" id="sign-in" href='/cab/auth'>
				Войти
			</a>
			<div class="auth-wrapper" id="m-sign-in">
					<form action="/cab/auth" method="post" class="auth-box">
						<label>Логин</label><br>
						<input class="inpt" id="login" type="text" name="login" value="<?php if(isset($_POST['login'])) {echo htmlspecialchars($_POST['login']);} ?>">
						<?php if(isset($errors['login'])) {echo $errors['login'];} ?><br><br>
						<label>Пароль</label><br>
						<input class="inpt" id="password" type="password" name="password" value="<?php if(isset($_POST['password'])) {echo htmlspecialchars($_POST['password']);} ?>">
						<?php if(isset($errors['password'])) {echo $errors['password'];} ?><br>
						<?php if(isset($_SESSION['autherror'])) {echo $_SESSION['autherror'];} ?><br>
						<input class="chbox" type="checkbox" name="autoauth" id="check1"><label for="check1">Запомнить</label><br><br>
						<button type="submit" name="sendreg">Войти</button>
					</form>
				<?php include './modules/cab/auth.php';?>
				</div>
			<?php } else { ?>
			<a class="account" href="#">
				Личный кабинет <?php echo hc($_SESSION['user']['login']);?>
			</a>
			<a class="sign-in" href='/cab/exit'>
				Выход
			</a>
			<?php } ?>
			<div class="lang-money">
			<a class="lang" href="#">
				En
				<div class="simbol11"></div>
			</a>
			<a class="money" href="#">
				$
				<div class="simbol11"></div>
			</a>
			</div>
		</div>
	</div>
	</header>
		<div class="main-nav clearfix">
			<div class="main-nav-wrapper">
		<nav>
			<a href='/lessons'>Домашки</a>
			<a href='/comments'>Отзывы</a>
			<a href='/news'>Новости</a>
			<a href='/goods'>Товары</a>
			<?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] == 5){ ?>
			<a class="adminA" href='/admin'>Админка</a>";
			<?php } ?>
		</nav>
		<form class="search-form" action="" method="get">
			<input class="search-input">
			<a class="search-button">
				<div class="search-icon"></div>
			</a>
		</form>
		</div>
		</div>
			<main>
				<?php echo $content; ?>
			</main>

		<footer>
			<div class="footer-info clearfix">
				<div class="list-info">
					<h4>Information</h4>
					<ul>
						<li><a href="#">Specials</a></li>
						<li><a href="#">New products</a></li>
						<li><a href="#">Top sellers</a></li>
						<li><a href="#">Our stores</a></li>
						<li><a href="#">Contact us</a></li>
						<li><a href="#">Pages configuration</a></li>
						<li><a href="#">Sitemap</a></li>
					</ul>
				</div>
				<div class="list-my-acount">
					<h4><a href="#">My account</a></h4>
					<ul>
						<li><a href="#">My orders</a></li>
						<li><a href="#">My merchandise returns</a></li>
						<li><a href="#">My credit slips</a></li>
						<li><a href="#">My addresses</a></li>
						<li><a href="#">My personal info</a></li>
						<li><a href="#">My vouchers</a></li>
					</ul>
				</div>
				<div class="store-info">
					<h4>Store Information</h4>
					<div class="place-on-map-icon"></div>
					<p>My Company,4578 Marmora Road, Glasgow D04 89GR</p>
					<div class="phone-icon1"></div>
					<p>Call us now: 0123-456-789</p>
					<a href="#">info@demolink.org</a>
					<div class="newsletter">
						<h4>Newsletter</h4>
						<div class="newsletter-input">
							<form action="" method="post">
								<input name="email" value="Enter your e-mail" type="text">
								<button type="submit" name="submitNewsletter">
									<span>></span>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright">
				<span>© <?php echo Core::$CREATED. ' - '.date('Y'); ?> </span> <a href="#">Ecommerce software by PrestaShop™</a>
			</div>
		</footer>
</body>
</html>