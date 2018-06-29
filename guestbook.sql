-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 29 2018 г., 03:03
-- Версия сервера: 5.6.38
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_homepage` varchar(255) DEFAULT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_browser` varchar(100) NOT NULL,
  `review_text` text NOT NULL,
  `review_tags` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `user_name`, `user_email`, `user_homepage`, `user_ip`, `user_browser`, `review_text`, `review_tags`, `date`) VALUES
(46, 'Иван', 'ivan@yandex.ru', 'http://ivansite.ru', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99', 'В Белом доме прокомментировали нападение на журналистов в Аннаполисе', 'Аннаполис,  Белый дом, нападение на журналистов', '2018-06-28 23:19:06'),
(47, 'Василий', 'vasya@mail.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99', 'Хэмилтон постарается укрепить лидерство на Гран-при Австрии \"Формулы-1\"', 'Формула-1', '2018-06-28 23:21:50'),
(48, 'Петя', 'petya@rambler.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99', 'Немецкий провал и минимум нулей на табло - групповой этап ЧМ завершен', 'ЧМ по футболу 2018, Германия,провал', '2018-06-28 23:24:55'),
(49, 'Маша', 'masha@inbox.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99', 'В Белом доме рассказали об ожиданиях Трампа от встречи с Путиным', '', '2018-06-28 23:27:03'),
(50, 'Федя', 'fedya@yndex.ru', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99', 'Россия обвинила Великобританию в подкупе участников ОЗХО', '', '2018-06-28 23:28:25');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
