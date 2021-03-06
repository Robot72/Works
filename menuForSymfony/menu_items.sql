SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `crm_dev`
--

-- --------------------------------------------------------

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=42 ;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `parent_id`, `menu_id`, `name`, `label_name`, `is_trans`, `link`, `is_route`, `browser_nav`, `css_class`, `sort`, `show_label_name`, `published`) VALUES
(1, 1, 1, 'Корневой элемент', 'root', 0, 'root', 0, '1', 'root', 0, 0, 1),
(4, 4, 2, 'Kорневой элемент', 'Kорневой элемент', 1, 'root', 1, '1', 'd', 11, 1, 1),
(5, 1, 1, 'Главная', 'CRM_ADMIN.MENU.LEFT_MENU.MAIN', 1, 'crm_admin_homepage', 1, '0', 'fa fa-tachometer fa-fw', 70, 1, 1),
(6, 1, 1, 'Глобальные настройки', 'CRM_ADMIN.MENU.LEFT_MENU.GLOBAL_SETTING', 1, 'no', 0, '0', 'fa fa-cogs fa-fw', 80, 1, 1),
(7, 6, 1, 'Отключить проект', 'CRM_ADMIN.MENU.LEFT_MENU.PROJECT_OFF', 1, 'morris.html', 0, '1', 'c', 300, 1, 1),
(8, 1, 1, 'Пользователи', 'CRM_ADMIN.MENU.LEFT_MENU.USERS', 1, '/cp/', 0, '1', 'fa fa-users fa-fw', 130, 1, 1),
(10, 6, 1, 'Настройка оdata-сервисов', 'CRM_ADMIN.MENU.LEFT_MENU.ODATA', 1, 'crm_admin_odata_services_index', 1, '0', 'no', 100, 1, 1),
(11, 6, 1, 'Настройка подключений', 'CRM_ADMIN.MENU.LEFT_MENU.CONNECTION_SETTINGS', 1, 'crm_admin_connection_settings_index', 1, '0', 'no', 100, 1, 1),
(12, 6, 1, 'Переключить базу данных', 'CRM_ADMIN.MENU.LEFT_MENU.SWITCH_DB', 1, 'crm_admin_global_settings_switch_db', 1, '0', 'no', 100, 1, 1),
(13, 8, 1, 'Пользователи панели управления', 'CRM_ADMIN.MENU.LEFT_MENU.USERS_CP', 1, 'no', 0, '0', 'no', 145, 1, 1),
(14, 8, 1, 'Состояние пользователей', 'CRM_ADMIN.MENU.LEFT_MENU.USERS_STATES', 1, 'crm_admin_homepage', 0, '0', 'not', 150, 1, 1),
(15, 1, 1, 'Перевод', 'CRM_ADMIN.TRANS.TITLE', 1, 'crm_admin_translation_index', 1, '0', 'fa fa-language fa-fw', 160, 1, 1),
(16, 1, 1, 'Менеджер материалов', 'CRM_ADMIN.MENU.LEFT_MENU.MANAGER_MATERIALS', 1, 'not', 0, '1', 'not', 100, 1, 1),
(17, 16, 1, 'Материалы', 'Материалы', 1, 'crm_admin_items_index', 1, '0', 'not', 100, 1, 1),
(18, 1, 1, 'Настройки доступа', 'Настройки доступа', 1, 'crm_admin_acl_index', 1, '0', '100', 100, 1, 1),
(19, 16, 1, 'Категории', 'Категории', 1, 'not', 0, '0', 'not', 100, 1, 1),
(20, 1, 1, 'Менеджер меню', 'CRM_ADMIN.MENU.LEFT_MENU.MANAGER_MENU', 1, 'crm_admin_managermenu_types_index', 1, '0', 'fa fa-bars fa-fw', 90, 1, 1),
(21, 4, 2, 'Личный кабинет', 'Личный кабинет', 1, 'crm_client_homepage', 1, '0', 'fa fa-user', 100, 1, 1),
(22, 4, 2, 'Отчеты', 'Отчеты', 0, 'not', 0, '0', 'fa fa-files-o', 100, 1, 1),
(23, 22, 2, 'Отчет №1', 'Отчет №1', 0, 'not', 0, '0', 'before-icon', 101, 1, 1),
(24, 22, 2, 'Отчет №2', 'Отчет №2', 0, 'not', 0, '0', 'before-icon', 192, 1, 1),
(25, 4, 2, 'Инструменты', 'Инструменты', 0, 'not', 0, '0', 'fa fa-wrench', 100, 1, 1),
(26, 25, 2, 'Инструмент №1', 'Инструмент №1', 0, 'not', 0, '0', 'before-icon', 100, 1, 1),
(27, 25, 2, 'Инструмент №2', 'Инструмент №2', 0, 'not', 0, '0', 'before-icon', 100, 1, 1),
(28, 4, 2, 'Контакты', 'Контакты', 0, 'not', 0, '0', 'fa fa-book', 100, 1, 1),
(29, 4, 2, 'Задачи', 'Задачи', 0, 'not', 0, '0', 'fa fa-tasks', 100, 1, 1),
(30, 4, 2, 'Проекты', 'Проекты', 0, 'not', 0, '0', 'fa fa-folder-open-o', 100, 1, 1),
(31, 4, 2, 'Клиенты', 'Клиенты', 0, 'not', 0, '0', 'fa fa-users', 100, 1, 1),
(32, 28, 2, 'Контакты', 'Контакты 1', 0, 'https://google.by', 0, '1', 'not', 200, 1, 1),
(33, 29, 2, 'Задача', 'Задача 1', 0, 'https://google.by', 0, '0', 'not', 100, 1, 1),
(34, 30, 2, 'Проект', 'Проект2', 0, 'https://google.by', 0, '0', 'not', 100, 1, 1),
(35, 32, 2, 'Проект', 'Проект1', 1, 'not', 0, '0', 'not', 100, 1, 1),
(36, 31, 2, 'R', 'R', 1, 'https://google.by', 0, '0', 'not', 100, 1, 1),
(37, 21, 2, 'Профиль', 'Профиль', 0, 'https://google.by', 0, '0', 'not', 100, 1, 1),
(38, 1, 1, 'TEST', 'TEST', 0, 'not', 0, '0', 'not', 100, 1, 0),

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `FK_70B2CA2A727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`),
  ADD CONSTRAINT `FK_70B2CA2ACCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);
