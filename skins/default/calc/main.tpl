<div class="page-conteiner clearfix">
	<h1>Калькулятор</h1>
	<form method="post" action="">
		<h3>Введите число 1:</h3>
		<input type="text" name="num1">
		<h4>Выберите действие:</h4>
		<select name="act">
			<option>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<h3>Введите число 2:</h3>
		<input type="text" name="num2"><br><br>
		<input type="submit" name="count" value="Расчёт"><br>
		<!--Вариант
		+<input type="radio" name="act" checked value="+"><br>
		-<input type="radio" name="act" value="-"><br>
		*<input type="radio" name="act" value="*"><br>
		/<input type="radio" name="act" value="/"><br>
		-->
	</form>
	<h2>Результат: <?php if(isset($_POST['num1'], $_POST['num2'], $_POST['act'])){
		echo Calc::actionCalc($_POST['num1'], $_POST['num2'], $_POST['act']);} ?></h2>

</div>
