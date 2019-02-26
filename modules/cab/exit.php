<?php
unset($_SESSION['user']);
session_destroy();
@setcookie('autoauthhash', $_COOKIE['autoauthhash'], time() - (365* 24 * 3600),'/');
@setcookie('autoauthid', $_COOKIE['autoauthid'], time() - (365 * 24 * 3600),'/');
@setcookie('HTTP_USER_AGENT', $_COOKIE['HTTP_USER_AGENT'], time() - (365 * 24 * 3600),'/ ');
header("Location: /");
exit();