<?php
class Calc {
	static public function actionCalc($num1, $num2, $act) {
		if(isset($num1, $num2)) {
			if(is_numeric($num1) && is_numeric($num2)) {
				switch($act) {
					case "+":
						$res = $num1 + $num2;
						break;
					case "-":
						$res = $num1 - $num2;
						break;
					case "*":
						$res = $num1 * $num2;
						break;
					case "/" && $num2 != 0:
						$res = $num1 / $num2;
						break;
					default:
						$res = 'На ноль делить нельзя';
				}
			}
			else {
				$res = 'Неверно введены числа';
			}
		}
		return $res;
	}
}
