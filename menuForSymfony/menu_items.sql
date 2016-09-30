SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Структура таблицы `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_trans` tinyint(1) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_route` tinyint(1) NOT NULL,
  `browser_nav` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `show_label_name` tinyint(1) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70B2CA2A727ACA70` (`parent_id`),
  KEY `IDX_70B2CA2ACCD7E912` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `parent_id`, `menu_id`, `name`, `label_name`, `is_trans`, `link`, `is_route`, `browser_nav`, `css_class`, `sort`, `show_label_name`, `published`) VALUES
(1, 1, 1, 'Корневой элемент', 'root', 0, 'root', 0, '1', 'root', 0, 0, 1),
(4, 4, 2, 'Kорневой элемент', 'Kорневой элемент', 1, 'root', 1, '1', 'd', 11, 1, 1),
(5, 1, 1, 'Главная', 'Главная', 0, 'crm_admin_homepage', 1, '1', 'fa fa-tachometer fa-fw', 100, 1, 1),
(6, 1, 1, 'Глобальные настройки', 'Глобальные настройки', 1, 'no', 0, '0', 'fa fa-cogs fa-fw', 200, 1, 1),
(7, 6, 1, 'Отключить проект', 'Отключить проект', 0, 'morris.html', 0, '1', 'c', 300, 1, 1),
(8, 1, 1, 'Пользователи', 'Пользователи', 1, '/cp/', 0, '1', 'fa fa-users fa-fw', 400, 1, 1),
(10, 6, 1, 'Настройка оdata-сервисов', 'Настройка оdata-сервисов', 0, 'crm_admin_odata_services_index', 1, '1', 'no', 100, 1, 1),
(11, 6, 1, 'Настройка подключений', 'Настройка подключений', 1, 'crm_admin_connection_settings_index', 1, '0', 'no', 100, 1, 1),
(12, 6, 1, 'Переключить базу данных', 'Переключить базу данных', 1, 'crm_admin_global_settings_switch_db', 1, '1', 'no', 100, 1, 1),
(13, 8, 1, 'Пользователи панели управления', 'Пользователи панели управления', 1, 'no', 0, '1', 'no', 100, 1, 1),
(14, 8, 1, 'Состояние пользователей', 'Состояние пользователей', 1, 'not', 0, '0', 'not', 100, 1, 1),
(15, 1, 1, 'Перевод', 'Перевод', 1, 'crm_admin_translation_index', 1, '0', 'fa fa-language fa-fw', 100, 1, 1),
(16, 1, 1, 'Менеджер материалов', 'Менеджер материалов', 1, 'not', 0, '1', 'not', 100, 1, 1),
(17, 16, 1, 'Материалы', 'Материалы', 1, 'crm_admin_items_index', 1, '0', 'not', 100, 1, 1),
(18, 1, 1, 'Настройки доступа', 'Настройки доступа', 1, 'crm_admin_acl_index', 1, '0', '100', 100, 1, 1),
(19, 16, 1, 'Категории', 'Категории', 1, 'not', 0, '0', 'not', 100, 1, 1),
(20, 1, 1, 'Менеджер меню', 'Менеджер меню', 1, 'crm_admin_managermenu_types_index', 1, '0', 'fa fa-bars fa-fw', 100, 1, 1),
(21, 4, 2, 'Личный кабинет', 'Личный кабинет', 1, 'crm_client_homepage', 1, '0', 'fa fa-user fa-fw', 100, 1, 1),
(22, 4, 2, 'Отчеты', 'Отчеты', 0, 'not', 0, '0', 'fa fa-files-o fa-fw', 100, 1, 1),
(23, 22, 2, 'Отчет №1', 'Отчет №1', 0, 'not', 0, '0', 'before-icon', 101, 1, 1),
(24, 22, 2, 'Отчет №2', 'Отчет №2', 0, 'not', 0, '0', 'before-icon', 192, 1, 1),
(25, 4, 2, 'Инструменты', 'Инструменты', 0, 'not', 0, '0', 'fa fa-wrench fa-fw', 100, 1, 1),
(26, 25, 2, 'Инструмент №1', 'Инструмент №1', 0, 'not', 0, '0', 'before-icon', 100, 1, 1),
(27, 25, 2, 'Инструмент №2', 'Инструмент №2', 0, 'not', 0, '0', 'before-icon', 100, 1, 1),
(28, 4, 2, 'Контакты', 'Контакты', 0, 'not', 0, '0', 'fa fa-book fa-fw', 100, 1, 1),
(29, 4, 2, 'Задачи', 'Задачи', 0, 'not', 0, '0', 'fa fa-tasks fa-fw', 100, 1, 1),
(30, 4, 2, 'Проекты', 'Проекты', 0, 'not', 0, '0', 'fa fa-folder-open-o fa-fw', 100, 1, 1),
(31, 4, 2, 'Клиенты', 'Клиенты', 0, 'not', 0, '0', 'fa fa-users fa-fw', 100, 1, 1);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `FK_70B2CA2A727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`),
  ADD CONSTRAINT `FK_70B2CA2ACCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);
