-- --------------------------------------------------------
-- Сервер:                       127.0.0.1
-- Версія сервера:               5.6.20 - MySQL Community Server (GPL)
-- ОС сервера:                   Win64
-- HeidiSQL Версія:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for spd
CREATE DATABASE IF NOT EXISTS `spd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spd`;


-- Dumping structure for таблиця spd.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text,
  `correct` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.answers: ~67 rows (приблизно)
DELETE FROM `answers`;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`id`, `answer`, `correct`, `question_id`, `test_id`) VALUES
	(1, 'Прем’єр-міністр України, перший віце-прем’єр-міністр, три віце-прем’єр-міністри, міністри;', 0, 1, 1),
	(2, 'Прем’єр-міністр України, перший віце-прем’єр-міністр, віце-прем’єр-міністри, міністри України;', 1, 1, 1),
	(3, 'Прем’єр-міністр України, перший віце-прем’єр-міністр, один віце-прем’єр-міністр, міністри;', 0, 1, 1),
	(4, 'Прем’єр-міністр України, три перших віце-прем’єр-міністр,  віце-прем’єр-міністри, міністри.', 0, 1, 1),
	(5, 'такими, що не можуть бути обмежені;', 0, 2, 1),
	(6, 'невідчужуваними та непорушними;', 1, 2, 1),
	(7, 'вільними та рівними;', 0, 2, 1),
	(8, 'вичерпними.', 0, 2, 1),
	(9, 'Верховна Рада України;', 0, 3, 1),
	(10, 'народні депутати України;', 0, 3, 1),
	(11, 'комітети Верховної Ради України;', 0, 3, 1),
	(12, 'Уповноважений верховної Ради України з прав людини.', 1, 3, 1),
	(13, 'невідчужуваним;', 0, 4, 1),
	(14, 'рівним;', 1, 4, 1),
	(15, 'необмеженим;', 0, 4, 1),
	(16, 'вільним.', 0, 4, 1),
	(17, 'Президент України зобов’язаний його підписати та офіційно оприлюднити;', 0, 5, 1),
	(18, 'Президент України зобов’язаний його підписати та офіційно оприлюднити протягом 10 днів;', 1, 5, 1),
	(19, 'Президент України має право повернути його зі своїми вмотивованими і сформульованими пропозиціями;', 0, 5, 1),
	(20, 'Закон має бути підписаний Головою Верховної Ради України та оприлюднений.', 0, 5, 1),
	(21, 'Так.', 1, 6, 1),
	(22, 'Ні.', 0, 6, 1),
	(23, 'Так.', 1, 7, 1),
	(24, 'Ні.', 0, 7, 1),
	(25, 'Так, підзвітні з питань здійснення повноважень місцевих державних адміністрацій.', 1, 8, 1),
	(26, 'Ні, не підзвітні.', 0, 8, 1),
	(27, 'Так, підзвітні з питань здійснення повноважень територіальних органів юстиції.', 0, 8, 1),
	(28, 'Так, уповноважений.', 1, 9, 1),
	(29, 'Ні, не уповноважений.', 0, 9, 1),
	(30, '20 днів;', 1, 10, 2),
	(31, '10 днів;', 0, 10, 2),
	(32, '30 днів.', 0, 10, 2),
	(33, 'неоднакове застосування судом (судами) касаційної інстанції одних і тих самих норм матеріального та процесуального права, що потягло ухвалення різних за змістом судових рішень у подібних правовідносинах;', 0, 11, 2),
	(34, 'неоднакове застосування судом (судами) касаційної інстанції одних і тих самих норм матеріального права, що потягло ухвалення різних за змістом судових рішень у подібних правовідносинах;', 1, 11, 2),
	(35, 'неоднакове застосування судом (судами) касаційної інстанції одних і тих самих норм процесуального права, що потягло ухвалення різних за змістом судових рішень у подібних правовідносинах.', 0, 11, 2),
	(36, 'на 7 днів;', 0, 12, 2),
	(37, 'на 3 дні;', 0, 12, 2),
	(38, 'на 5 днів.', 1, 12, 2),
	(39, 'апеляційна інстанція по відношенню до національних судів;', 0, 13, 2),
	(40, 'міжнародний судовий орган;', 1, 13, 2),
	(41, 'міжнародний арбітраж. ', 0, 13, 2),
	(42, 'так;', 1, 14, 2),
	(43, 'ні;', 0, 14, 2),
	(44, 'так, якщо це неурядова організація.', 0, 14, 2),
	(45, 'вичерпання всіх національних засобів правового захисту та дотримання шестимісячного строку звернення до Суду;', 1, 15, 2),
	(46, 'вичерпання всіх національних засобів правового захисту;', 0, 15, 2),
	(47, 'вичерпання всіх національних засобів правового захисту та дотримання восьмимісячного строку звернення до Суду.', 0, 15, 2),
	(48, 'Міністр юстиції України;', 0, 16, 2),
	(49, 'Верховна Рада України;', 0, 16, 2),
	(50, 'Кабінет Міністрів України;', 1, 16, 2),
	(51, 'Президент України.', 0, 16, 2),
	(52, 'обґрунтованість заяви;', 0, 17, 2),
	(53, 'сплата судового збору;', 1, 17, 2),
	(54, 'сумісність скарг з положеннями Конвенції або Протоколів до неї;', 0, 17, 2),
	(55, 'вичерпання всіх національних засобів правового захисту.', 0, 17, 2),
	(56, 'так;', 0, 18, 2),
	(57, 'ні;', 1, 18, 2),
	(58, 'у виняткових випадках, передбачених Конвенцією або Протоколами до неї', 0, 18, 2),
	(59, 'забезпечення представництва України в у будь-яких закордонних юрисдикційних органах;', 0, 19, 2),
	(60, 'забезпечення представництва громадян України в Європейському суді з прав людини;', 0, 19, 2),
	(61, 'забезпечення представництва України в Європейському суді з прав людини.', 1, 19, 2),
	(138, 'Вова', 0, 39, 2),
	(139, 'Петька', 0, 39, 2),
	(140, 'Мганга', 1, 39, 2),
	(141, 'Люда', 0, 39, 2);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;


-- Dumping structure for таблиця spd.authorization
CREATE TABLE IF NOT EXISTS `authorization` (
  `userrole_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `userrole` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`userrole_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.authorization: ~3 rows (приблизно)
DELETE FROM `authorization`;
/*!40000 ALTER TABLE `authorization` DISABLE KEYS */;
INSERT INTO `authorization` (`userrole_id`, `userid`, `userrole`) VALUES
	(1, 88, 'ROLE_ADMIN'),
	(2, 89, 'ROLE_USER'),
	(6, 97, 'ROLE_USER'),
	(7, 99, 'ROLE_USER');
/*!40000 ALTER TABLE `authorization` ENABLE KEYS */;


-- Dumping structure for таблиця spd.currtest
CREATE TABLE IF NOT EXISTS `currtest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `sessionID` text,
  `test_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Answers` (`answer_id`),
  KEY `Questions` (`question_id`),
  KEY `Test` (`test_id`),
  KEY `User` (`user_id`),
  CONSTRAINT `Answers` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`),
  CONSTRAINT `Questions` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `Test` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`),
  CONSTRAINT `User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.currtest: ~0 rows (приблизно)
DELETE FROM `currtest`;
/*!40000 ALTER TABLE `currtest` DISABLE KEYS */;
/*!40000 ALTER TABLE `currtest` ENABLE KEYS */;


-- Dumping structure for таблиця spd.joke
CREATE TABLE IF NOT EXISTS `joke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.joke: ~6 rows (приблизно)
DELETE FROM `joke`;
/*!40000 ALTER TABLE `joke` DISABLE KEYS */;
INSERT INTO `joke` (`id`, `name`) VALUES
	(1, 'A bad beginning makes a bad ending.'),
	(2, 'A bad corn promise is better than a good lawsuit.'),
	(3, 'A beggar can never be bankrupt.'),
	(4, 'Good.'),
	(5, 'A black hen lays a white egg.'),
	(6, 'A clean fast is better than a dirty breakfast.'),
	(7, 'A clean hand wants no washing.');
/*!40000 ALTER TABLE `joke` ENABLE KEYS */;


-- Dumping structure for таблиця spd.test
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.test: ~24 rows (приблизно)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `question`, `test_id`) VALUES
	(1, 'До складу Кабінету Міністрів України входять:', 1),
	(2, 'Права і свободи людини є:', 1),
	(3, 'Парламентський контроль за додержанням конституційних прав і свобод людини і громадянина здійснює:', 1),
	(4, 'Право доступу до державної служби для громадян України є:', 1),
	(5, 'Якщо під час повторного розгляду Закон знову прийнятий Верховною Радою України не менш як двома третинами від її конституційного складу:', 1),
	(6, 'Чи мають погоджувати територіальні органи юстиції пропозиції щодо пріоритетів своєї роботи з головами місцевих державних адміністрацій?', 1),
	(7, 'Чи можуть заслуховуватись на засіданнях колегій місцевих держадміністрацій звіти керівників територіальних органів про виконання планів роботи?', 1),
	(8, 'Чи підзвітні керівники територіальних органів юстиції головам відповідних місцевих державних адміністрації? Якщо підзвітні, визначити з яких питань?', 1),
	(9, 'Чи уповноважений голова місцевої державної адміністрації порушувати питання про відповідність займаній посаді керівника відповідного територіального органу юстиції?', 1),
	(10, 'Строк касаційного оскарження судових рішень:', 2),
	(11, 'Підстава для подання заяви про перегляд судових рішень Верховним Судом України', 2),
	(12, 'Строк складення постанови в справах адміністративного судочинства у повному обсязі може бути відкладено не більше ніж:', 2),
	(13, 'Європейський суд з прав людини – це:', 2),
	(14, 'Чи може звернутися до Європейського суду з прав людини юридична особа:', 2),
	(15, 'Європейський суд з прав людини може взяти до розгляду заяву лише за таких умов:', 2),
	(16, 'Урядового уповноваженого у справах Європейського суду з прав людини призначає на посаду та звільняє з посади:', 2),
	(17, 'Не є умовою прийнятності заяви до розгляду Європейським судом:', 2),
	(18, 'Чи має Європейський суд повноваження скасовувати або змінювати рішення національних судів:', 2),
	(19, 'Основним завданням Урядового уповноваженого у справах Європейського суду з прав людини є:', 2),
	(39, 'Как Тебя звать?', 2);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


-- Dumping structure for таблиця spd.resulttest
CREATE TABLE IF NOT EXISTS `resulttest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.resulttest: ~9 rows (приблизно)
DELETE FROM `resulttest`;
/*!40000 ALTER TABLE `resulttest` DISABLE KEYS */;
INSERT INTO `resulttest` (`id`, `user_id`, `test_id`, `result`, `time`) VALUES
	(170, 88, 1, 3, '2015-07-02 14:04:42'),
	(171, 88, 1, 3, '2015-07-02 14:05:56'),
	(172, 88, 2, 1, '2015-07-02 14:36:33'),
	(173, 88, 1, 1, '2015-07-03 15:13:32'),
	(174, 88, 1, 2, '2015-07-03 17:37:26'),
	(175, 88, 1, 3, '2015-07-03 17:44:56'),
	(176, 88, 2, 0, '2015-07-30 18:52:27'),
	(177, 88, 17, 1, '2015-07-30 18:53:01'),
	(178, 88, 1, 4, '2015-07-30 19:49:40'),
	(179, 88, 1, 2, '2015-07-31 14:59:35');
/*!40000 ALTER TABLE `resulttest` ENABLE KEYS */;


-- Dumping structure for таблиця spd.test
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.test: ~3 rows (приблизно)
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`, `name`) VALUES
	(1, 'Загальні питання'),
	(2, 'Представництво інтересів Кабінету Міністрів України та Міністерства юстиції України у судах України');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


-- Dumping structure for таблиця spd.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- Dumping data for table spd.user: ~5 rows (приблизно)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `nickname`, `email`, `enabled`) VALUES
	(88, 'SashOk', '123', '777', 's020687@gmail.com', 1),
	(89, 'Albatros', '123', 'jdk5', 'sds@ex.ua', 1),
	(97, 'Messi', '789', 'Messi', 'messi@ex.ua', 1),
	(99, 'Zaza', '123', 'Zahar', 'zaza@ya.ru', 1),
	(100, 'Za', '123', 'ads', 'asd@f.t', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
