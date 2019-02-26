<?php
$dir = '.' .'/'.(isset($_GET['link']) ? $_GET['link'].'/' : '');
$files = scandir($dir);

