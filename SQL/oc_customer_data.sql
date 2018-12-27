-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 27 2018 г., 08:43
-- Версия сервера: 10.1.36-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `travel_to_the_life`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_data`
--

CREATE TABLE `oc_customer_data` (
  `customer_id` int(5) NOT NULL,
  `email` varchar(96) NOT NULL,
  `full_name` varchar(64) NOT NULL,
  `birth_date` date NOT NULL,
  `city` varchar(36) NOT NULL,
  `study_place` text NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `teacher_name` varchar(96) NOT NULL,
  `teacher_phone` varchar(20) NOT NULL,
  `teacher_email` varchar(96) NOT NULL,
  `favorite_film` text NOT NULL,
  `favorite_film_influence` text NOT NULL,
  `profession` varchar(64) NOT NULL,
  `profession_opportunities` text NOT NULL,
  `password` varchar(64) NOT NULL,
  `confirm` varchar(64) NOT NULL,
  `agree` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
