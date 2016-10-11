SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `crm_dev`
--

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items_actions`
--

CREATE TABLE IF NOT EXISTS `menu_items_actions` (
  `menuitems_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`menuitems_id`,`action_id`),
  KEY `IDX_DF0BFC7897235247` (`menuitems_id`),
  KEY `IDX_DF0BFC789D32F035` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `menu_items_actions`
--

INSERT INTO `menu_items_actions` (`menuitems_id`, `action_id`) VALUES
(4, 11),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(10, 9),
(14, 9),
(18, 9);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu_items_actions`
--
ALTER TABLE `menu_items_actions`
  ADD CONSTRAINT `FK_DF0BFC7897235247` FOREIGN KEY (`menuitems_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DF0BFC789D32F035` FOREIGN KEY (`action_id`) REFERENCES `auth_action` (`id`);
