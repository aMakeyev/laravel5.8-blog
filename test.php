<head>

<script src="/skins/default/js/javascript_v1.js"></script>
<script src="/skins/default/js/jquery-3.3.1.min.js"></script>

<div id="xxx">тест АЯКСА </div>

<script>
	window.onload = function () {

		document.getElementById('xxx').onclick = function myAjax() {


			$.ajax({
				url: '/test_ajax.php',
				type: "POST",
				cache: false,
				timeout: 15000,
				data: {login: 'alex'},
				success: function (msg) {// опять же msg - это эхо в пхп файле
					var respons = JSON.parse(msg); // возвращаем в виде массива-объекта
					if (respons.status == 'ok') {//часто полезно перед выводом проверять ещё статус. Соотв. в массиве добав. satus
						alert(respons.login + ', ' + respons.age);// обращение к массиву.Здесь показать логин, лет
					}
				}
			});
			return false;
		}
	}
$('#id');	// в jQ обращение к id элемента - замена document.getElementById('id')
$ ('.class'); // в jQ обращение к классу элемента
	$('#id').attr('enctyp');//обращение к атрибутам
	$('#id').css('display');//обращение к стилям
	x = $('#id').css('display'); //это будет ГЕТ
	$('#id').css('display', 'block');// это будет СЕТ - поменяли св-во на дисплей блок
	$(this).css('display','none');//обращение к объекту, с которым только что работали
	nowtime = new Date().getTime();// возвращает сколько сейчас время в милисекундах аналог time() в пхп

</script>

</head>