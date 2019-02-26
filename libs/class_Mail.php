<?php


//mail('кому', 'тема', 'текст письма', $headers);

class Mail{
	static $subject = 'Вы зарегистрировались на сайте';
	static $from = 'admin@alexxx.school-php.com';
	static $to = 'makeeb@list.ru';
	static $text = 'Шаблон письма';
	static $headers = '';

	static function send(){
		self::$subject = '=?utf-8?B?'.base64_encode(self::$subject).'?=';
		self::$headers = "Content-type: text/html; charset=\"utf-8\"\r\n";
		self::$headers .= "From: ".self::$from."\r\n";
		self::$headers .= "MIME-Version: 1.0\r\n";
		self::$headers .= "Date: ".date('D, d M Y h:i:s O') ."\r\n";
		self::$headers .= "Precedence: bulk\r\n";

		return mail(self::$to,self::$subject,self::$text,self::$headers);
	}

	static function testSend(){
		if(mail(self::$to,'English words', 'English words')){
			echo 'Письмо отправилось';
		}else{
			echo 'Письмо не отправилось';
		}
		exit();
	}

}

//Отправить письмо:
Mail::$to = 'oleg@mail.ru';
Mail::$text = 'text';
Mail::send();