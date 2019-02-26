<?php
if (!count($msg)){
	$msg['name'] = hc($_SESSION['user']['login']);
	$msg['comment'] = hc($_POST['comment']);
	echo json_encode($msg);
}
exit();
