
window.onload = function () {

	$('#sign-in').click(function () {
		$('#m-sign-in').slideToggle();
		return false;
	});

	/*Чобы в чате обновлел не всю страницу а комменты за последнее опред.время:
	просим новые комментарии, где $_SESSION['time'] > time();
	while(){echo новые комментарии}
*/
	setInterval(loadComments,10000);
	function loadComments() {
		$.ajax({
			url : '/comments/ajax_latest_comments',
			type : "POST",
			dataType : 'json',
			success : function (msg) {
				console.log(msg);
				$.each(msg, function(){
					$('.comments-block').append('<div class="comments"><div class="comment"><div class="comment-title">' + this.name + '<span class="comment-title-date"> написал:</span></div><div class="comment-body">' + this.comment + '</div></div></div>');
				});
			}
		})
	}
	$('#btn-comment').click(function (e) {
		e.preventDefault();
		var lastComment = $('#comment-form').serializeArray();
		$.ajax({
			url: '/comments/ajax_comments',
			type: "POST",
			//cache: false,
			//timeout: 15000,
			data: lastComment,
			dataType : 'json',
			//data : {name : name, email : email, comment : comment},
			success: function (msg) {
				$('.comments-block').append('<div class="comments"><div class="comment"><div class="comment-title">' + msg.name + '<span class="comment-title-date"> написал:</span></div><div class="comment-body">' + msg.comment + '</div></div></div>');
				//var respons = JSON.parse(msg);
				$('#comment-form')[0].reset();
				$('#error').empty();
				console.log(msg.name + ', ' + msg.comment);
			},
			error: function () {
				$('#error').append('Вы ничего не написали в отзыве!<br>');
			}
		});
	});
}

//document.getElementById('sign-in').onclick = myAjax();


/*
function myAjax() {
	var x = document.getElementById('login').innerHTML;
	var y = document.getElementById('password').innerHTML;

	$.ajax({// $ - объект jquery, ajax - его метод (поэтому со скобками) - ему мы передали объект (=многом.массив) с {}
		url: '/modules/cab/auth.php', // стандартно аякс работает только внути домена
		type: "POST",
		cache: false,// браузер не запомнит ответ. при новом обращении будет новый код, если он изменится. так деляю в чатах - чтобы чат обновлялся с каждым новым сообщением. Тру ставится для неизменного контента - навигация, оформление сайта и т.д.
		timeout: 15000, //если в течение 15 сек.не будет ответа с сервера, код после date с ответом не выполняется (не ждем ответа)
		data: {login: x, password: y}, //это данные, которые передаем постом. Они существуют в пост - с ними м.работать в пхп. Этот Запрос на сервер отправлен
		success: function (msg) {//это то, что вернет сервер -
			alert(msg); //м.вывести, что вернул. Например в блоге поставить интервал 5 сек и выводить через иннерХтмл (здесь алерт стоит просто для примера) каждые 5 сек, что изменилось.
		},
		error: function (x,t,m) {// в случае ошибки - в т.ч. отрубили интернет просрочен таймаут
			if (t === "timeout"){//просрочен таймаут,т.е.время = таймауту
				alert('Ожидание ответа слишком велико. М.б. проблемы на сервере или у вас с интернетом');
				//setTimeout(myAjax(),10000);//или вызвать через 10 сек функц.снова. если установлен интревал, то нет смысла. для тестирования можно в пхп коде написать sleep(20); - остановка скрипта на 20 сек.
			} else {
				alert('Какие-то другие проблемы');
//!!!  ответ сервера - это то, что пхп файле. если там написать если ПОСТ ок echo 'ok'; тогда м.писать так:
				//success: function (msg) {
				//	if (msg == 'ok'){
				//		alert('Ваш комментарий добавлен');
			}

		}
	});
	return false;
}
*/




