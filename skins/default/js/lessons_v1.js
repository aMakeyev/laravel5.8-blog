window.document.getElementById('xx'); // обращение в диву хх. window(окно браузера) очень редко когда нужно писать, обычно без него document - вся хтмл страница
document.getElementById('xx').innerHTML; //ссылка на содержание (у нас text). м.ссылаться на конкретные св-ва или объекта этого дива (после . см.в подсказке - без скобок св-ва, со скобками методы) - так м. ходить по дом-дереву.ВАЖНО есть последовательность сверху вниз. на объект м.ссылаться, если он уже сформирован - т.е. js после хтмл объекта к которому обращаемся.
x = document.getElementById('xx').innerHTML; // поместить в переменную и ссылаться на неё. Это будет GET - получаем объект и помещаем в переменную
document.getElementById('xx').innerHTML = 'new text'; //это SET. текст заменили.
document.getElementById('xx').style.backgroundColor = 'red'; // поменяли з.фон на красный
x = document.getElementById('xx').style.backgroundColor; alert(x); // выведет red
document.getElementById('xx').style.backgroundColor = ''; // будет  значение !по умолчанию!
//на сайте нажал куда-то появилось окошко поверх и не двигаеся при прокрутке -> было выставлено для этого блока дисплей нон, а при нажатии дисплей блок и позишен фикс.
// JS нужен работать с событиями - действиями пользователя - см.события к тегам html (пр. для а, но все похожи). Писать м.только встрочку разделяя ; - здесь обязательна:
//<div id="xxx" onclick="document.getElementById('xxx').style.display='none'; document.getElementById('xx').innerHTML = 'new text';">text</div>
	// так писать не удобно. писать функциями:
	//<div id="xxx" onclick="hide(); newText();">text</div>
function hide() {
	document.getElementById('xxx').style.display='none';
}
function nexText() {
	document.getElementById('xx').innerHTML = 'new text';
}

//нажал - пропал, нажал - появилось (обязательно изначально указать !дисплей блок!):
function hide() {
	if (document.getElementById('xxx').style.display == 'block') {
		document.getElementById('xxx').style.display = 'none';
	} else {
		document.getElementById('xxx').style.display = 'block';
	}
}
//тоже оптимизированно:
function hide() {
	var x = document.getElementById('xxx');
	if (x.style.display == 'block') {
		x.style.display = 'none';
	} else {
		x.style.display = 'block';
	}
}
//+ чтобы не захломлять дом-дерево, функции помещать в отдельные файлы, или пока в head. Но нужно писать так в хэде:
window.onload = function () {//т.е. когда все загрузится м.на неё ссылаться
	document.getElementById('key').onclick = function () {// в самом диве онклик не писать: <div id="key">text</div>
		var x = document.getElementById('xxx');
		if (x.style.display == 'block') {
			x.style.display = 'none';
		} else {
			x.style.display = 'block';
		}
	}
}
// или, чтобы ссылаться на функцию hide писать так: +м.ссылаться на эту функ.где угодно
window.onload = function () {
	document.getElementById('key').onclick = hide;//!!! здесь пишется без скобок.
}
// через событие внутри тега, можно передать не текст, а id блока, чтобы один код работал с разными блоками:
// <div id = 'key' onclick="hide('xxx') - т.е. будет cпри нажатии скрывать блок с <div id="xxx". Фунция работатетс id
function hide(id) {
	var x = document.getElementById(id);
	if (x.style.display == 'block') {
		x.style.display = 'none';
	} else {
		x.style.display = 'block';
	}
}


// ошибку в JS смотри в консоли ошибок. - в хроме встроена в инспектор - Console. !!НО, чтобы туда попали ошибки, консоль д.б.открыта во время загрузки стр.

x='text'; // глобальная
var x='text'; // локальная, только объяв.ссылаться потом просто х
var x;// можно объявлять без значения
function calc(num1,num2,action) {//переменные в функциях автоматом локальные
	if (action === undefined){ // проверка на существование
		action = 'plus';
	}
	var res = 0; //так внутри функций объяв.локальные. Глобальные в функциях объяв.не правильно (нельзя, но браузер отработает)
	if (action == 'plus'){
		res = num1 + num2;
	} else if(action == 'minus'){
		res = num1 - num2;
	}
	return res;
}
var x = 5; //это SET - т.е. дали значение
alert(x); // это GET - получили значение. выдаст просто окно с кнопкой ОК - типа просто инфа
prompt(x); //тоже + кнопки да/нет
prompt('Сколько лет?', 18); // 18 - по умолчанию, м.ввести др.
var x = prompt('Сколько лет?', 18);    // в х запичется то, что ввели
confirm('Удалить?'); // возвращает тру или фолс. проверка if else Желательно всегда при удалении
parseInt(x);// = (int)$x из 12тт вернёт 12
//есть форма
// <form action="" method="get" onsubmit="return send();"> !здесь обязательно return
// <input type="text" id="yyy" value="">
// <input type="submit" value="отправить">
// перед отправкой формы проверит что ввели не менее 5 символов, иначе выведет окно и не будет отправлять:
function send() {
	var l = document.getElementById('yyy').value.length;
	if (l < 5){
		alert('Минимум 5 символов. Вы ввели' + l);
		return false;// !! Не забывать!
	}
}
//Подтверждение удаления через сслыку. Имеем:<a href="" onclick="return del();">Удалить товар</a>
function del() {
	return confirm('Точно удалить?'); // автоматом отправить в a либо тру либо фолс
}

//<a href="mail.ru" onclick="alert(1);">Mail.ru</a> при нажатии выскочит окно, после нажатия на него на сайт передет
//	<a href="mail.ru" onclick="alert(1); return false;">Mail.ru</a> на сайт не передёт.return false останавливает событие по умолчанию


x = 0;
console.log('Число равно:' + x); // выведет в консоли нужное - только в консоли, для нас

 function test() {
	 ++x;
	 console.log('text' + x);
	 if (x == 5){
	 	clearInterval(intervalId); //интервал будет остановлен - редко используется
	 }
 }
 var intervalId = setInterval(test,2000); //каждые 2 секунды (это 2000) будет вызываться функц.тест (без кавычек и скобок - скобки вроде сам подставляет - значит нормально).  Передавть аргументы функ.здесь нельзя, нужно создать безымянную функцию и в ней передавать функ.с аргументами:
intervalId = setInterval(function () {test(arg1,arg2); hide('м.ещёодну функцию с аргументами')},2000);
window.onload = function () { //чтобы обращался к уже загруженному на странице.хотя на локале м.успеть загрузиться и сработать без этого.Но это неправильно.+! м.б. только один window.onload + только один setInterval - иначе проблемы (счётчик ускоряется)
	intervalId = setInterval(test,2000);
}
function test() {
	var i = 0;
	if (++i%2 == 0){ // !!! так каждый 2 раз будет вызываться функц. hide
		hide();
	}
	++x;
	console.log('text' + x);
	if (x == 5){
		clearInterval(intervalId); //интервал будет остановлен - редко используется
	}
}
intervalId = setTimeout(test(),2000);// вызовет функц.один раз через 2 сек.

//!!! асс-ый массив – там, где ключи слова (т.е.как бы по ассоциации). В JS только индексный  массив существует. Асс-ый массив – это объект.Синтаксис такой:
var users = {'key1' : 'value1', 'key2' : 'value2'};
alert(users['key1']);
alert(users.key1); //так вызывать правильней
// сравнение с пхп: $users['key1']; - обращение к массиву. $users->key1; - обращение к объекту
var users = { //как многомерный массив
	'user1' : {
		'name': 'Alex',
		'age': '32'
	},
	'user2' : {
		'name': 'Olya',
		'age': '35'
	}
};
alert('Пользователь:' + users.user1.name);

for (key in users.user1){//key - это все ключи в данном массиве
	console.log(users.user1[key]); // выведет все данные юзера !!!т.е. это форич в js
}
for (key in users){//весь переберем
	console.log(users[key].name + ':' + users[key].age); // выведет данные всех юзеров. Также можно и чат обновлять - только записывать всё в innerHTML
}

38 урок
Из test.php:
…..
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
$('#id');  // в jQ обращение к id элемента - замена document.getElementById('id')
$ ('.class'); // в jQ обращение к классу элемента
$('#id').attr('enctyp');//обращение к атрибутам
$('#id').css('display');//обращение к стилям
x = $('#id').css('display'); //это будет ГЕТ
$('#id').css('display', 'block');// это будет СЕТ - поменяли св-во на дисплей блок
$(this).css('display','none');//обращение к объекту, с которым только что работали
nowtime = new Date().getTime();// возвращает сколько сейчас время в милисекундах аналог time() в пхп

из /test_ajax.php
$users = array(//создаем массив
	'login' => 'alexey',
	'age' => '33',
	'status' => 'ok'
);
echo json_encode($users);// js o - объект. Функция возвращает массив в виде объекта

