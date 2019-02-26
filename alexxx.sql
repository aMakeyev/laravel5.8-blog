-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Ноя 15 2018 г., 08:37
-- Версия сервера: 5.6.38
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `main`
--

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(535) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `avail` enum('Есть','Нет','','') NOT NULL,
  `deliv` varchar(535) NOT NULL,
  `warr` tinyint(4) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `date`, `title`, `description`, `price`, `avail`, `deliv`, `warr`, `img`) VALUES
(37, '2018-11-14 17:24:58', 'Мёд', 'бьюфь.бфп', 1500, 'Есть', '', 0, '/uploaded/20181114-152458img56878.png'),
(38, '2018-11-14 09:43:18', 'Сотовый мёд', 'gjkf;lkjgs;fk', 1500, 'Есть', '', 0, '/uploaded/20181114-074317img37303.png'),
(39, '2018-11-13 16:35:16', 'Перга с прополисом в меду', ',fn.dmnf.mdnfad', 5000, 'Есть', '', 0, '/uploaded/20181113-142805img49094.png'),
(40, '2018-11-13 16:29:03', 'Перга', ',mf/amdf/a,dfma/', 900, 'Есть', '', 0, '/uploaded/20181113-142903img28124.png'),
(41, '2018-11-13 16:30:23', 'Сотовый мёд с пергой', 'баьф.баь.фжвпьжйцдлопй', 2000, 'Есть', '', 0, '/uploaded/20181113-143023img90951.png'),
(42, '2018-11-14 22:25:02', 'Прополис', 'лаь.фжвдьаф.жвдаьф', 500, 'Есть', '', 0, '/uploaded/20181114-202502img72756.png'),
(43, '2018-11-13 16:32:11', 'Ферментированный Иван-чай', 'лаь.фаьфжваьдф.вавыф', 1500, 'Есть', '', 0, '/uploaded/20181113-143211img87444.png'),
(44, '2018-11-14 22:31:31', 'Мёд c прополисом', 'ардлфрафджвлоарфдв', 1500, 'Есть', '', 0, '/uploaded/20181114-203117img21591.png');

-- --------------------------------------------------------

--
-- Структура таблицы `goods2goods_cat`
--

CREATE TABLE `goods2goods_cat` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods2goods_cat`
--

INSERT INTO `goods2goods_cat` (`id`, `goods_id`, `cat_id`) VALUES
(105, 40, 2),
(106, 41, 2),
(107, 41, 4),
(109, 43, 5),
(110, 39, 1),
(111, 39, 2),
(112, 39, 3),
(114, 38, 4),
(116, 37, 1),
(136, 42, 3),
(137, 44, 1),
(138, 44, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_cat`
--

CREATE TABLE `goods_cat` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_cat`
--

INSERT INTO `goods_cat` (`id`, `name`) VALUES
(1, 'Мёд'),
(2, 'Перга'),
(3, 'Прополис'),
(4, 'Сотовый мёд'),
(5, 'Травяной чай');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `title` text NOT NULL,
  `cat` enum('Политика','Экономика','Наука','Культура') NOT NULL,
  `text` text NOT NULL,
  `description` text NOT NULL,
  `meta_title` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `date`, `title`, `cat`, `text`, `description`, `meta_title`, `meta_keywords`, `meta_description`, `img`) VALUES
(1, '2018-10-30 09:28:25', '1 сентября - День знаний!', 'Культура', '1 сентября - День знаний! Все начинают учиться. В этом году в 1 класс пошли миллион школьников.', 'Сегодня 1 сентября - День знаний! Все начинают учиться.', '', '', '', '/uploaded/20181030-072817img56427.jpg'),
(15, '2018-11-04 22:02:35', 'Прополис', 'Наука', 'dnsNDlksN.,n/djkh;LJKD', 'asm .MN/KJBKJekjlwnd;JK', '', '', '', '/uploaded/20181104-200235img52456.jpg'),
(16, '2018-10-30 09:35:11', 'Сбор меда', 'Экономика', 'алтвдфлавфыдлафыж', 'аолжфлаовлоажывлаф', '', '', '', '/uploaded/20181030-073509img76932.jpg'),
(17, '2018-11-04 17:21:19', 'Встреча G7', 'Политика', 'аловждлоафждловажфдвла', 'лаодвлоадлвофыждлвомжвды', '', '', '', '/uploaded/20181104-152119img15949.jpg'),
(21, '2018-11-04 22:01:30', 'Саммит в Москве', 'Политика', 'авльфлаьфыдвлаф', 'лафдлаждлатвждалт', '', '', '', '/uploaded/20181104-200130img28571.jpg'),
(23, '2018-11-04 21:41:39', 'Праздник Земли', 'Культура', 'алвфждлвжфдлв', 'атвджфтжвф', '', '', '', '/uploaded/20181104-194139img61013.jpg'),
(24, '2018-11-04 22:01:02', 'Исследование учёных', 'Наука', 'оадвлоафжлваофж  алжвлафэвал щалэвж фщваэфщ', 'аждлфвь лопжыдпжы плжылажы', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(25, '0000-00-00 00:00:00', 'Политика', 'Политика', 'таюьфвтаюфьв', 'атвюфьтаюфь', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(26, '0000-00-00 00:00:00', 'Культура', 'Культура', 'лудлфадцфлуацлт', 'автфютваюфбвт', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(27, '2018-11-04 22:02:35', 'Прополис', 'Наука', 'dnsNDlksN.,n/djkh;LJKD', 'asm .MN/KJBKJekjlwnd;JK', '', '', '', '/uploaded/20181104-200235img52456.jpg'),
(28, '0000-00-00 00:00:00', 'Экономика', 'Экономика', 'ктуюбаьтфюб ', 'лктуюлткюйцлт ', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(29, '0000-00-00 00:00:00', 'Политика', 'Политика', 'атлваюбьтфва шожу', 'локуйджлкойц ущшкжйоаывдлафа ', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(30, '0000-00-00 00:00:00', 'Экономика', 'Экономика', 'орюалофцтайоц ', 'уокйлдцоу оукждйо', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(31, '2018-11-06 22:45:43', 'Наука', 'Наука', 'латюфлаотфв', 'окуокйцко', '', '', '', ''),
(32, '0000-00-00 00:00:00', 'Культура', 'Культура', 'лоадлуадцулац', 'уоайцолат оулойждцло', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(33, '0000-00-00 00:00:00', 'Политика', 'Политика', 'оатюцлуоатйц ', 'уоцйклойц дуцлокжйдл', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(34, '0000-00-00 00:00:00', 'Экономика', 'Экономика', 'алуйдлац ж ', 'коулойдуклй жуойж', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(35, '2018-10-30 09:28:25', '1 сентября - День знаний!', 'Культура', '1 сентября - День знаний! Все начинают учиться. В этом году в 1 класс пошли миллион школьников.', 'Сегодня 1 сентября - День знаний! Все начинают учиться.', '', '', '', '/uploaded/20181030-072817img56427.jpg'),
(36, '2018-11-04 22:02:35', 'Прополис', 'Наука', 'dnsNDlksN.,n/djkh;LJKD', 'asm .MN/KJBKJekjlwnd;JK', '', '', '', '/uploaded/20181104-200235img52456.jpg'),
(37, '2018-10-30 09:35:11', 'Сбор меда', 'Экономика', 'алтвдфлавфыдлафыж', 'аолжфлаовлоажывлаф', '', '', '', '/uploaded/20181030-073509img76932.jpg'),
(38, '2018-11-04 17:21:19', 'Встреча G7', 'Политика', 'аловждлоафждловажфдвла', 'лаодвлоадлвофыждлвомжвды', '', '', '', '/uploaded/20181104-152119img15949.jpg'),
(39, '2018-11-04 22:01:30', 'Саммит в Москве', 'Политика', 'авльфлаьфыдвлаф', 'лафдлаждлатвждалт', '', '', '', '/uploaded/20181104-200130img28571.jpg'),
(40, '2018-11-04 21:41:39', 'Праздник Земли', 'Культура', 'алвфждлвжфдлв', 'атвджфтжвф', '', '', '', '/uploaded/20181104-194139img61013.jpg'),
(41, '2018-11-04 22:01:02', 'Исследование учёных', 'Наука', 'оадвлоафжлваофж  алжвлафэвал щалэвж фщваэфщ', 'аждлфвь лопжыдпжы плжылажы', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(42, '0000-00-00 00:00:00', 'Политика', 'Политика', 'таюьфвтаюфьв', 'атвюфьтаюфь', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(43, '0000-00-00 00:00:00', 'Культура', 'Культура', 'лудлфадцфлуацлт', 'автфютваюфбвт', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(44, '0000-00-00 00:00:00', 'Наука', 'Наука', 'кукцфу.дклтцулкт', 'луткдлтуат лкждуйк', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(45, '0000-00-00 00:00:00', 'Экономика', 'Экономика', 'ктуюбаьтфюб ', 'лктуюлткюйцлт ', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(46, '0000-00-00 00:00:00', 'Политика', 'Политика', 'атлваюбьтфва шожу', 'локуйджлкойц ущшкжйоаывдлафа ', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(47, '0000-00-00 00:00:00', 'Экономика', 'Экономика', 'орюалофцтайоц ', 'уокйлдцоу оукждйо', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(48, '0000-00-00 00:00:00', 'Наука', 'Наука', 'латюфлаотфв', 'окуокйцко', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(49, '0000-00-00 00:00:00', 'Культура', 'Культура', 'лоадлуадцулац', 'уоайцолат оулойждцло', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(50, '0000-00-00 00:00:00', 'Политика', 'Политика', 'оатюцлуоатйц ', 'уоцйклойц дуцлокжйдл', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(51, '0000-00-00 00:00:00', 'Экономика', 'Экономика', 'алуйдлац ж ', 'коулойдуклй жуойж', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(52, '2018-10-30 09:28:25', '1 сентября - День знаний!', 'Культура', '1 сентября - День знаний! Все начинают учиться. В этом году в 1 класс пошли миллион школьников.', 'Сегодня 1 сентября - День знаний! Все начинают учиться.', '', '', '', '/uploaded/20181030-072817img56427.jpg'),
(53, '2018-11-04 22:02:35', 'Прополис', 'Наука', 'dnsNDlksN.,n/djkh;LJKD', 'asm .MN/KJBKJekjlwnd;JK', '', '', '', '/uploaded/20181104-200235img52456.jpg'),
(54, '2018-10-30 09:35:11', 'Сбор меда', 'Экономика', 'алтвдфлавфыдлафыж', 'аолжфлаовлоажывлаф', '', '', '', '/uploaded/20181030-073509img76932.jpg'),
(55, '2018-11-04 17:21:19', 'Встреча G7', 'Политика', 'аловждлоафждловажфдвла', 'лаодвлоадлвофыждлвомжвды', '', '', '', '/uploaded/20181104-152119img15949.jpg'),
(56, '2018-11-04 22:01:30', 'Саммит в Москве', 'Политика', 'авльфлаьфыдвлаф', 'лафдлаждлатвждалт', '', '', '', '/uploaded/20181104-200130img28571.jpg'),
(57, '2018-11-04 21:41:39', 'Праздник Земли', 'Культура', 'алвфждлвжфдлв', 'атвджфтжвф', '', '', '', '/uploaded/20181104-194139img61013.jpg'),
(58, '2018-11-04 22:01:02', 'Исследование учёных', 'Наука', 'оадвлоафжлваофж  алжвлафэвал щалэвж фщваэфщ', 'аждлфвь лопжыдпжы плжылажы', '', '', '', '/uploaded/20181104-200102img64745.jpg'),
(59, '2018-10-30 09:28:25', '1 сентября - День знаний!', 'Культура', '1 сентября - День знаний! Все начинают учиться. В этом году в 1 класс пошли миллион школьников.', 'Сегодня 1 сентября - День знаний! Все начинают учиться.', '', '', '', '/uploaded/20181030-072817img56427.jpg'),
(60, '2018-11-04 22:02:35', 'Прополис', 'Наука', 'dnsNDlksN.,n/djkh;LJKD', 'asm .MN/KJBKJekjlwnd;JK', '', '', '', '/uploaded/20181104-200235img52456.jpg'),
(61, '2018-10-30 09:35:11', 'Сбор меда', 'Экономика', 'алтвдфлавфыдлафыж', 'аолжфлаовлоажывлаф', '', '', '', '/uploaded/20181030-073509img76932.jpg'),
(62, '2018-11-04 17:21:19', 'Встреча G7', 'Политика', 'аловждлоафждловажфдвла', 'лаодвлоадлвофыждлвомжвды', '', '', '', '/uploaded/20181104-152119img15949.jpg'),
(63, '2018-11-04 22:01:30', 'Саммит в Москве', 'Политика', 'авльфлаьфыдвлаф', 'лафдлаждлатвждалт', '', '', '', '/uploaded/20181104-200130img28571.jpg'),
(64, '2018-11-04 21:41:39', 'Праздник Земли', 'Культура', 'алвфждлвжфдлв', 'атвджфтжвф', '', '', '', '/uploaded/20181104-194139img61013.jpg'),
(65, '2018-11-04 22:01:02', 'Исследование учёных', 'Наука', 'оадвлоафжлваофж  алжвлафэвал щалэвж фщваэфщ', 'аждлфвь лопжыдпжы плжылажы', '', '', '', '/uploaded/20181104-200102img64745.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `news_cat`
--

CREATE TABLE `news_cat` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news_cat`
--

INSERT INTO `news_cat` (`id`, `name`) VALUES
(1, 'Политика'),
(2, 'Экономика'),
(3, 'Наука'),
(4, 'Культура');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `modules` varchar(255) NOT NULL,
  `static` tinyint(1) NOT NULL DEFAULT '1',
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `modules`, `static`, `meta_title`, `meta_description`, `meta_keywords`, `text`) VALUES
(1, '404', 1, 'Данная страница отсутствует!', 'Данная страница отсутствует!', 'Данная страница отсутствует!', 'Данная страница отсутствует!'),
(2, 'static', 0, '', '', '', ''),
(3, 'cab', 0, '\r\n', '', '', ''),
(4, 'comments', 0, '', '', '', ''),
(5, 'registration', 0, '', '', '', ''),
(6, 'errors', 0, '', '', '', ''),
(7, 'main', 0, '', '', '', ''),
(8, 'contacts', 0, '', '', '', ''),
(9, 'voting', 0, '', '', '', ''),
(10, 'aboutus', 1, '', '', '', 'Статичная информация о нас\r\n'),
(11, 'auth', 0, '', '', '', ''),
(12, 'exit', 0, '', '', '', ''),
(13, 'lessons', 0, '', '', '', ''),
(14, 'game', 0, '', '', '', ''),
(15, 'gameover', 0, '', '', '', ''),
(16, 'filemen', 0, '', '', '', ''),
(17, 'table', 0, '', '', '', ''),
(18, 'calc', 0, '', '', '', ''),
(19, 'admin', 0, '', '', '', ''),
(20, 'news', 0, '', '', '', ''),
(21, 'goods', 0, '', '', '', ''),
(22, 'users', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` tinyint(4) NOT NULL DEFAULT '0',
  `hash` varchar(255) NOT NULL,
  `access` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `httpuseragent` varchar(535) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `age`, `hash`, `access`, `active`, `httpuseragent`, `date`, `img`) VALUES
(38, 'alex', 'cbj5D/7It/U/M', 'zzzzz@zzzz.ru', 34, 'cbfCGmIRVvJHMcb5m3MLyMfaukcbTBwLqBXzeWI', 5, 1, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '2018-10-28 09:30:30', '/uploaded/20181101-135034img40849.jpg'),
(41, '`\'\"<b>text</b>', 'cb6WeD48CAUPU', 'avaa@aaa.ru', 0, 'cb8WUq5iue.hs', 1, 1, '', '2018-10-28 10:19:43', '/uploaded/20181101-135034img40849.jpg'),
(42, 'alex1', 'cbypCqEdULL9c', 'fgffkg@mail.ru', 0, 'cbqW2qWCTPlVAcbLwzDwGu3wYwcb3nA0IuTY7/I', 5, 1, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '2018-10-30 08:24:23', '/uploaded/20181102-113727img82241.jpg'),
(45, 'bbb', 'cbQkscXavrW2M', 'bb@bb.bb', 0, 'cb.Qfs7ojnNHQ', 1, 1, '', '2018-10-30 18:42:36', '/uploaded/20181114-204153img22246.png'),
(46, 'alexey', 'CB3Q/CSYBHA4E', 'makeeb@list.ru', 35, 'CBonS6jZb/p.YCBp1ZgAPVpOacCBCcvpvrB5okk', 5, 1, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', '2018-11-06 07:49:58', '/uploaded/20181101-135034img40849.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `сomments`
--

CREATE TABLE `сomments` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `сomments`
--

INSERT INTO `сomments` (`id`, `name`, `email`, `comment`) VALUES
(1, 'Alex', 'aaa@aaa.ru', 'hfdlhka;iypq oiasdofya a;oo  kjdf;lka;dhf '),
(2, 'aaa', 'aaa@aaa.tu', 'fjdhflkasjhflkajhfd ;l jkf;alkjf a;ka;kjdf ;zjk  hdlkjfhalhjda;l'),
(3, 'nl2br', 'aaa@aaa.ru', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa    aaaaaaaaaaaaaaaaaaaaaa                       aaaaa        aaa  aaaaa dddddddddd d      dddkldj;lfdkjfl;ajnf;cije;qoi[e  ;f;aljf ;kl`jd;flkj f;l j;kjef e;jef;wifj ;'),
(4, 'Олег', 'bb@bb.ru', 'This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes.'),
(5, 'zzzzzzzz', 'zzzzz@zzzz.ru', 'hjhdsljadhfbhcblafoiuqpoin[p  fiefhlahfdaliuy  puyeUEYREIKFJFKJSDGHJCNJ D ;  fjjf;akdakjdf;airwi  pieid;LKJ.JH IRID;ALIDU;CDZ/ . '),
(6, 'Alex', 'aaa@aaa.ru', 'This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes.'),
(7, 'Илья', 'fgffk@mail.ru', 'This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes. This is a box. The content would go in these boxes.'),
(8, 'Alex', 'makeeb@list.ru', 'fm/fdma;kdj  ;je;j'),
(9, 'Alex', 'zzzzz@zzzz.ru', 'lk\';jzzzzzzzzzzzz');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods2goods_cat`
--
ALTER TABLE `goods2goods_cat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods_cat`
--
ALTER TABLE `goods_cat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news_cat`
--
ALTER TABLE `news_cat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `login_2` (`login`,`password`),
  ADD KEY `age` (`age`);

--
-- Индексы таблицы `сomments`
--
ALTER TABLE `сomments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `goods2goods_cat`
--
ALTER TABLE `goods2goods_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT для таблицы `goods_cat`
--
ALTER TABLE `goods_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `news_cat`
--
ALTER TABLE `news_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `сomments`
--
ALTER TABLE `сomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
