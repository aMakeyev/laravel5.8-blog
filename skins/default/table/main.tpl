<div class="page-conteiner clearfix">
	<div class="table">
		<h1>Таблица</h1><br>
		<?php
		echo '<table>';
		for($y=1; $y<=3; $y++) {
			if($y==3){
				echo '<tr class="orange">';
				}
				else{
					echo '<tr>';
				}
				for($x = 1; $x <= 5; $x++) {
					if($x == 2 && $y == 1) {
						echo '<td class="yellow">'.$x.'/'.$y.'</td>';
					}
					elseif($x == 3 && $y == 2) {
						echo '<td class="green">'.$x.'/'.$y.'</td>';
					}
					elseif($x == 5 && ($y == 1 || $y == 2)) {
						echo '<td class="red">'.$x.'/'.$y.'</td>';
					}
					else {
						echo '<td>'.$x.'/'.$y.'</td>';
				}
			}
			echo '</tr>';
		}
		echo '</table>';?>
	</div>
</div>