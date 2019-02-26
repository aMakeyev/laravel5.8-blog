<?php

if($latest_comments->num_rows){
	while($row = $latest_comments->fetch_assoc()){
		if(isset($_SESSION['user']['login']) && $_SESSION['user']['login'] == $row['name']) {
		}else{
			$msg[] = array(
				'name' => hc($row['name']),
				'comment' => hc($row['comment'])
			);
		}
	}
	echo json_encode($msg);
}
exit();