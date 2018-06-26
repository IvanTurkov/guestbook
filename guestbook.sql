-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 26 2018 г., 19:53
-- Версия сервера: 5.5.50
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `guestbook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_homepage` varchar(255) DEFAULT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_browser` varchar(100) NOT NULL,
  `review_text` text NOT NULL,
  `review_tags` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `user_name`, `user_email`, `user_homepage`, `user_ip`, `user_browser`, `review_text`, `review_tags`, `date`) VALUES
(1, 'Иван', 'lond51@rambler.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'Привет', '', '2018-06-26 14:34:36'),
(2, 'Иван', 'lond51@rambler.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'Привет123', '', '2018-06-26 14:40:57'),
(3, 'Иван', 'lond51@rambler.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'Привет', '', '2018-06-26 14:49:47'),
(4, 'Иван', 'lond51@rambler.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'Привет', '#привет', '2018-06-26 14:50:53'),
(5, 'Иван', 'lond51@rambler.ru', 'http://mysite.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'Я тут', '#привет', '2018-06-26 14:55:19'),
(6, 'Иван', 'lond51@rambler.ru', 'http://mysite.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', '''Я тут''', '#привет', '2018-06-26 14:56:29'),
(7, 'Иван', 'lond51@rambler.ru', 'http://mysite.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', '', '#привет', '2018-06-26 15:02:51'),
(8, 'Карина', 'lond51@rambler.ru', 'http://mysite.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'увауауа', '', '2018-06-26 15:30:00'),
(9, 'Вася', 'turkovivashka@yandex.ru', 'mysite.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'fsdfsdfsdf', '', '2018-06-26 15:56:51'),
(10, 'Вася', 'lond51@rambler.ru', 'mysite.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', 'asdf fd fsdf sdf sdf', '', '2018-06-26 16:11:31'),
(13, 'Вася', '123123', '123123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87', '123 1 123 123 123213', '213123 123 123123', '2018-06-26 16:40:47');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
