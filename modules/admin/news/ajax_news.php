<?php
$latest_news = q("
	SELECT *
	FROM `news`
	WHERE `date` > NOW() - INTERVAL 1 MINUTE 
");
// -	из БД новость за последнюю минуту.(также м.использовать BEETWEEN - для между такой и такой меткой)