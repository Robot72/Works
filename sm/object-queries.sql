SELECT MIN(  `god_postrojki` )
FROM  `object`
WHERE  `objekt` = 3 OR `objekt` = 4

--
select `ploshad_o`, `ploshad_u`, `ploshad_k`, `ploshad_zh`, `komnat_vsego`, `kmotminska`
FROM `object`
WHERE `objekt` = 3 AND `ploshad_o` >= 0 AND `ploshad_k` >= 0 AND `ploshad_zh` >= 0 AND `komnat_vsego` >= 0 AND`kmotminska`>=0;

-- Значения по-умолчанию для БОРИСОВА
-- Вывод всех объектов из Борисова с пустыми характеристиками
SELECT `nomer_po_baze`, `kmotminska`, `komnat_vsego`, `ploshad_o`, `ploshad_zh`, `ploshad_k`, `ploshad_u`
FROM `object`
WHERE `gorod` = 'борисов' AND (`ploshad_o` IS NULL OR `ploshad_k` IS NULL OR `ploshad_u` IS NULL OR `ploshad_zh` IS NULL OR `komnat_vsego` IS NULL OR `kmotminska` IS NULL);

-- По-умолчанию для расстояня от МКАД
UPDATE `object`
SET `kmotminska` = 65
WHERE `gorod` = 'борисов' AND `kmotminska` IS NULL;

-- По-умолчанию для кол-ва комнат
UPDATE `object`
SET `komnat_vsego` = 0
WHERE `gorod` = 'борисов' AND `komnat_vsego` IS NULL;

-- По-умолчанию для площ.общей
UPDATE `object`
SET `ploshad_o` = 0
WHERE `gorod` = 'борисов' AND `ploshad_o` IS NULL;

-- По-умолчанию для площ.жилой
UPDATE `object`
SET `ploshad_zh` = 0
WHERE `gorod` = 'борисов' AND `ploshad_zh` IS NULL;

-- По-умолчанию для площ.кухни
UPDATE `object`
SET `ploshad_k` = 0
WHERE `gorod` = 'борисов' AND `ploshad_k` IS NULL;

-- По-умолчанию для площ.участка
UPDATE `object`
SET `ploshad_u` = 0
WHERE `gorod` = 'борисов' AND `ploshad_u` IS NULL;

-- Вывод всех объектов из Борисова
SELECT `nomer_po_baze`, `kmotminska`, `komnat_vsego`, `ploshad_o`, `ploshad_zh`, `ploshad_k`, `ploshad_u`
FROM `object`
WHERE `gorod` = 'борисов';
