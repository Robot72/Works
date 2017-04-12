SELECT MIN(  `god_postrojki` )
FROM  `object`
WHERE  `objekt` = 3 OR `objekt` = 4

--
select `ploshad_o`, `ploshad_u`, `ploshad_k`, `ploshad_zh`, `komnat_vsego`, `kmotminska`
FROM `object`
WHERE `objekt` = 3 AND `ploshad_o` >= 0 AND `ploshad_k` >= 0 AND `ploshad_zh` >= 0 AND `komnat_vsego` >= 0 AND`kmotminska`>=0;
