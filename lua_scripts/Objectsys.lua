local spells = {
97002,
97003,
97004,
97005,
97006,
97007,
97008,
97009,
97010,
97011,
97012,
97013,
97014,
97015,
97016,
97017,
97018,
97019,
97020,
97021,
97022,
97023,
97024,
97025,
97026,
97027,
97028,
97029,
97030,
97031,
97032,
97033,
97034,
97035,
97036,
97037,
97038,
--merchant--
97039,
97040,
97041,
97042,
97043,
97044,
97045,
97046,
97047,
97048,
97049,
97050,
97051,
97052,
97053,
97054,
97055,
97056,
97057,
97058,
97059,
97060,
97061,
97062,
97063,
97064,
97065,
97066,
97067,
97068,
97069,
97070,
97071,
97072,
97073,
97074,
97075,
97076,
97077,
97078,
97079,
97080,
97081,
97082,
97083,
97084,
97085,
97086,
97087,
97088,
97089,
97090,
97091,
97092,
97093,
97094,
97095,
97096,
97097,
97098,
97099,
97100,
97101,
97102,
97103,
97104,
97105,
97106,
97107,
97108,
97109,
97110,
97111,
97112,
97113,
97114,
97115,
97116,
97117,
97118,
97119,
97120,
97121,
97122,
97123,
--HOUSING SYSTEM--
97135,
97136,
97137,
97138,
97139,
97140,
97141,
97142,
97143,
97144,
97145,
97146,
97147,
97148,
97149,
97150,
97151,
97152,
97153,
97154,
97155,
97156,
97157,
97158,
97159,
97160,
97161,
97162,
97163,
97164,
97165,
97166,
97167,
97168,
97169,
97170,
97171,
97172,
97173,
97174,
97175,
97176,
97177,
97178,
97179,
97180,
97181,
97182,
97183,
97184,
97185,
97186,
97187,
97188,
97189,
97190,
97191,
97192,
97193,
97194,
97195,
97196,
97197,
97198,
97199,
97200,
97201,
97202,
97203,
97204,
97205,
97206,
97207,
97208,
97209,
97210,
97211,
97212,
97213,
97214,
97215,
97216,
97217,
97218,
97219
}
local gameobjects = {
532767,
508098,
508121,
509325,
507927,
507928,
539725,
507937,
533763,
533740,
509182,
508742,
509183,
508743,
519661,
519662,
533828,
533827,
532559,
509581,
509582,
508567,
508566,
507596,
507207,
508771,
507208,
509470,
509433,
508878,
509540,
509539,
507210,
539536,
507861,
507863,
507864,
--merchant--
532796,
508351,
532740,
533767,
534875,
508874,
537754,
509326,
539724,
534889,
532739,
537765,
520123,
507771,
509345,
533793,
519869,
532737,
508903,
508382,
508690,
509469,
507261,
508747,
532793,
511760,
511865,
510369,
532799,
508357,
508102,
533794,
522944,
533557,
507595,
507564,
507040,
507007,
532782,
508639,
508628,
538362,
509301,
508861,
508277,
508223,
508204,
519862,
509216,
509217,
509725,
509724,
510081,
508900,
508129,
508124,
520110,
519892,
519891,
507576,
507575,
506862,
506918,
508893,
512668,
519792,
507229,
508439,
508402,
532561,
508440,
508584,
508585,
508274,
508060,
533455,
519745,
509293,
509292,
509280,
509272,
508823,
508820,
508815,
508829,
--HOUSING SYSTEM--
508511,
508512,
507946,
533437,
533436,
507718,
507722,
508258,
508255,
508252,
508897,
508528,
508526,
508527,
508049,
508048,
508047,
508046,
508044,
508045,
508042,
508041,
508040,
508038,
508037,
519694,
507273,
508529,
508530,
508480,
508479,
508539,
509566,
509567,
507719,
532775,
532774,
532773,
532772,
532771,
526228,
508448,
508445,
508444,
508442,
508441,
533497,
539721,
538343,
508374,
508375,
508376,
508373,
538240,
534426,
508543,
508767,
508768,
508762,
507883,
534885,
508613,
532795,
508758,
508862,
508860,
508208,
508205,
508206,
508207,
508222,
508221,
507606,
507242,
508583,
508518,
509309,
509568,
509569,
509570,
509574,
507886,
507885,
512666,
508619
}
local models = {
"World\\Generic\\goblin\\passivedoodads\\goblintents\\goblintent01.m2",
"World\\Generic\\dwarf\\passive doodads\\excavationtents\\excavationtent01.m2",
"World\\Generic\\dwarf\\passive doodads\\excavationtentpavillion\\excavationtentpavillion.m2",
"World\\Generic\\orc\\passive doodads\\tents\\durotarorctent02.m2",
"World\\Generic\\buildings\\humantentlarge\\humantentlarge.m2",
"World\\Generic\\buildings\\humantentmedium\\humantentmedium.m2",
"World\\Generic\\nightelf\\passive doodads\\tent\\nightelfsingletent02.m2",
"World\\Generic\\centaur\\passive doodads\\centaurtents\\centaurtent02.m2",
"World\\Expansion02\\doodads\\generic\\forsaken\\fk_tent02.m2",
"World\\Expansion02\\doodads\\generic\\forsaken\\fk_barricade_01.m2",
"World\\Generic\\orc\\passive doodads\\burntoutposts\\burntoutpost04.m2",
"World\\Generic\\human\\passive doodads\\outposts\\generaloutpost04.m2",
"World\\Generic\\orc\\passive doodads\\burntoutposts\\burntoutpost05.m2",
"World\\Generic\\human\\passive doodads\\outposts\\generaloutpost05.m2",
"World\\Expansion01\\doodads\\generic\\ancientorc\\outpostwalls\\ao_outpostwall04.m2",
"World\\Expansion01\\doodads\\generic\\ancientorc\\outpostwalls\\ao_outpostwall05.m2",
"World\\Expansion02\\doodads\\generic\\human\\barriers\\nd_human_barrier_end.m2",
"World\\Expansion02\\doodads\\generic\\human\\barriers\\nd_human_barrier.m2",
"World\\Expansion02\\doodads\\generic\\human\\torch\\northrendtorch_01.m2",
"World\\Generic\\passivedoodads\\lights\\generaltorch01.m2",
"World\\Generic\\passivedoodads\\lights\\generaltorch02.m2",
"World\\Generic\\human\\passive doodads\\cargonetboxes\\deadminecargonetboxes.m2",
"World\\Generic\\human\\passive doodads\\cargoboxes\\deadminecargoboxes.m2",
"World\\Azeroth\\westfall\\passivedoodads\\westfallchair\\westfallchair.m2",
"World\\Azeroth\\elwynn\\passivedoodads\\jugs\\jug02.m2",
"World\\Generic\\human\\passive doodads\\ropes\\cavekoboldropecoil.m2",
"World\\Azeroth\\elwynn\\passivedoodads\\jars\\jar01.m2",
"World\\Generic\\passivedoodads\\crate02\\crate02.m2",
"World\\Generic\\passivedoodads\\barrel\\barrel01.m2",
"World\\Generic\\human\\passive doodads\\weapons&armor\\humanarrows.m2",
"World\\Generic\\passivedoodads\\furniture\\containers\\sack02.m2",
"World\\Generic\\passivedoodads\\furniture\\containers\\sack01.m2",
"World\\Azeroth\\elwynn\\passivedoodads\\jars\\jar03.m2",
"World\\Azeroth\\redridge\\passivedoodads\\rowboat\\rowboat01.m2",
"World\\Expansion01\\doodads\\hellfirepeninsula\\supplies\\hellfiresupplies_03.m2",
"World\\Expansion01\\doodads\\hellfirepeninsula\\supplies\\hellfiresupplies_05.m2",
"World\\Expansion01\\doodads\\hellfirepeninsula\\supplies\\hellfiresupplies_06.m2",
--merchant--
"World\\Generic\\human\\passive doodads\\vendortents\\stormwindvendortent01.m2",
"World\\Generic\\goblin\\passivedoodads\\goblintents\\goblintent04.m2",
"World\\Expansion02\\doodads\\stratholme_past\\ld_stratholme_tent02.m2",
"World\\Expansion02\\doodads\\generic\\forsaken\\fk_tent05.m2",
"World\\Expansion02\\doodads\\stratholme_past\\banners\\ld_stratholme_foodtent.m2",
"World\\Generic\\human\\passive doodads\\vendorawnings\\stormwindvendorawning01.m2",
"World\\Expansion02\\doodads\\generic\\argentcrusade\\argentcrusade_beervendor.m2",
"World\\Generic\\orc\\passive doodads\\tents\\orctent01.m2",
"World\\Generic\\nightelf\\passive doodads\\tent\\nightelfsingletent01.m2",
"World\\Expansion02\\doodads\\stratholme_past\\ld_stratholme_tent05.m2",
"World\\Expansion02\\doodads\\stratholme_past\\ld_stratholme_tent01.m2",
"World\\Expansion02\\doodads\\generic\\argentcrusade\\argentcrusade_opentent.m2",
"World\\Expansion01\\doodads\\generic\\shadowcouncil\\tents\\shadowcouncil_tent01.m2",
"World\\Environment\\doodad\\carnival\\coketent.m2",
"World\\Generic\\orc\\passive doodads\\wagons\\orcwagon05.m2",
"World\\Expansion02\\doodads\\generic\\highelf\\he_tent_01.m2",
"World\\Expansion01\\doodads\\generic\\bloodelf\\tents\\be_tent03.m2",
"World\\Expansion02\\doodads\\stratholme_past\\ld_foodcart01.m2",
"World\\Generic\\human\\passive doodads\\woodendummies\\stormwindwoodendummy01.m2",
"World\\Generic\\human\\passive doodads\\archerytargets\\stormwindarcherytarget01.m2",
"World\\Generic\\human\\passive doodads\\gypsywagons\\stormwindgypsywagon01.m2",
"World\\Generic\\passivedoodads\\crate01\\crate01.m2",
"World\\Azeroth\\elwynn\\passivedoodads\\waterbasin\\waterbasin.m2",
"World\\Generic\\human\\passive doodads\\planterboxes\\stormwindwindowplantera.m2",
"World\\Generic\\human\\passive doodads\\tables\\inntabletiny.m2",
"World\\Khazmodan\\wetlands\\passivedoodads\\wetlandswagons\\wetlandswagonnest.m2",
"World\\Lordaeron\\plagueland\\passivedoodads\\plaguedwagons\\plaguewagon.m2",
"World\\Goober\\g_bombwagon.m2",
"World\\Generic\\nightelf\\passive doodads\\wagons\\nightelfcart.m2",
"World\\Generic\\goblin\\passivedoodads\\goblintntwagon\\goblinwagontnt_01.m2",
"World\\Generic\\dwarf\\passive doodads\\excavationwaterwagon\\excavationwaterwagon.m2",
"World\\Expansion02\\doodads\\generic\\highelf\\he_wagon_01.m2",
"World\\Expansion02\\doodads\\generic\\forsaken\\fk_wagon02.m2",
"World\\Expansion02\\doodads\\dalaran\\dalaran_wagon01.m2",
"World\\Azeroth\\westfall\\passivedoodads\\westfall wagon\\westfallwagon01.m2",
"World\\Azeroth\\westfall\\passivedoodads\\haywagon\\westfallhaywagon.m2",
"World\\Azeroth\\duskwood\\passivedoodads\\duskwoodhaywagon\\duskwoodhaywagon.m2",
"World\\Azeroth\\duskwood\\buildings\\gypsywagon\\gypsywagon.m2",
"World\\Generic\\human\\passive doodads\\food\\roastboarplatter_nocollision.m2",
"World\\Generic\\human\\passive doodads\\food\\goldfruitbowl01.m2",
"World\\Generic\\human\\passive doodads\\food&utensils\\turkeyleg.m2",
"World\\Generic\\passivedoodads\\thanksgiving\\g_thanksgivingtable_01.m2",
"World\\Generic\\orc\\passive doodads\\tables\\orcbench01.m2",
"World\\Generic\\human\\passive doodads\\tables\\inntable.m2",
"World\\Generic\\gnome\\passive doodads\\furniture\\gnometable01.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventablesmall.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventableaverage01.m2",
"World\\Expansion01\\doodads\\generic\\bloodelf\\tables\\be_table_large01.m2",
"World\\Generic\\orc\\passive doodads\\meatracks\\rawmeatrack01.m2",
"World\\Generic\\orc\\passive doodads\\meatracks\\smokedmeatrack01.m2",
"World\\Generic\\passivedoodads\\shieldracks\\rackshieldalliance02.m2",
"World\\Generic\\passivedoodads\\shieldracks\\rackshieldalliance01.m2",
"World\\Generic\\tauren\\passive doodads\\weapons\\tauren_weaponrack01.m2",
"World\\Generic\\human\\passive doodads\\weaponracks\\generalweaponrack01.m2",
"World\\Generic\\dwarf\\passive doodads\\gunracks\\gunrack02c.m2",
"World\\Generic\\dwarf\\passive doodads\\gunracks\\gunrack01b.m2",
"World\\Expansion01\\doodads\\generic\\ogre\\weapons\\om_weaponrack_01.m2",
"World\\Expansion01\\doodads\\generic\\bloodelf\\weaponracks\\be_weaponrack_02.m2",
"World\\Expansion01\\doodads\\generic\\bloodelf\\weaponracks\\be_weaponrack_01.m2",
"World\\Azeroth\\westfall\\passivedoodads\\rugracks\\rugrack02.m2",
"World\\Azeroth\\westfall\\passivedoodads\\rugracks\\rugrack01.m2",
"World\\Azeroth\\bootybay\\passivedoodad\\deadfish\\fishrack.m2",
"World\\Azeroth\\burningsteppes\\passivedoodads\\orctoolrackburningsteppes\\orctoolrackburningsteppes.m2",
"World\\Generic\\human\\passive doodads\\weapons&armor\\wallshield03.m2",
"World\\Skillactivated\\tradeskillenablers\\engineering_autolathe_01.m2",
"World\\Expansion01\\doodads\\generic\\bloodelf\\knickknacks\\be_magicalknickknack04.m2",
"World\\Azeroth\\elwynn\\passivedoodads\\signs\\genericposts\\genericsmallsignpost01.m2",
"World\\Generic\\human\\passive doodads\\armor\\armorstandmailblue.m2",
"World\\Generic\\human\\passive doodads\\armor\\armorhelmtrim.m2",
"World\\Expansion02\\doodads\\generic\\leather_chest_armor_01.m2",
"World\\Generic\\human\\passive doodads\\armor\\armorstandmailcoifblue.m2",
"World\\Generic\\human\\passive doodads\\chairs\\generalchairloend01.m2",
"World\\Generic\\human\\passive doodads\\chairs\\generalmedchair01.m2",
"World\\Generic\\gnome\\passive doodads\\furniture\\gnomechair01.m2",
"World\\Generic\\dwarf\\passive doodads\\chairs\\dwarvenhighendchair.m2",
"World\\Expansion02\\doodads\\dalaran\\dalaran_chair_02.m2",
"World\\Expansion01\\doodads\\generic\\bloodelf\\chairs\\be_chair04.m2",
"World\\Generic\\orc\\passive doodads\\signs\\orcsign_winery.m2",
"World\\Generic\\orc\\passive doodads\\signs\\orcsign_weapons.m2",
"World\\Generic\\orc\\passive doodads\\signs\\orcsign_mailarmor.m2",
"World\\Generic\\orc\\passive doodads\\signs\\orcsign_general.m2",
"World\\Generic\\human\\passive doodads\\signs\\generalstore01.m2",
"World\\Generic\\human\\passive doodads\\signs\\cheeseshop01.m2",
"World\\Generic\\human\\passive doodads\\signs\\armorershop01.m2",
"World\\Generic\\human\\passive doodads\\signs\\weaponsmithshop01.m2",
--HOUSING SYSTEM--
"World\\Generic\\human\\passive doodads\\beds\\bunkbed01.m2",
"World\\Generic\\human\\passive doodads\\beds\\duskwoodbed.m2",
"World\\Generic\\darkirondwarf\\passive doodads\\beds\\darkirondwarfbed01.m2",
"World\\Expansion02\\doodads\\dalaran\\dalaran_bed_02.m2",
"World\\Expansion02\\doodads\\dalaran\\dalaran_bed_01.m2",
"World\\Dungeon\\goldshireinn\\innbedcanopy\\innbedcanopy.m2",
"World\\Dungeon\\goldshireinn\\innbed\\innbed.m2",
"World\\Generic\\dwarf\\passive doodads\\wardrobe\\wardrobedwarvensimple03.m2",
"World\\Generic\\dwarf\\passive doodads\\wardrobe\\wardrobedwarvenornate03.m2",
"World\\Generic\\dwarf\\passive doodads\\wardrobe\\wardrobedwarvenaverage03.m2",
"World\\Generic\\human\\passive doodads\\wardrobe\\duskwoodwardrobe01.m2",
"World\\Generic\\human\\passive doodads\\bookshelves\\duskwoodbookshelf03.m2",
"World\\Generic\\human\\passive doodads\\bookshelves\\duskwoodbookshelf01.m2",
"World\\Generic\\human\\passive doodads\\bookshelves\\duskwoodbookshelf02.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvensimple04.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvensimple03.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvensimple02.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvensimple01.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvenornate04.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvenornate05.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvenornate02.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvenornate01.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvenaverage05.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvenaverage02.m2",
"World\\Generic\\dwarf\\passive doodads\\bookshelves\\bookshelfdwarvenaverage01.m2",
"World\\Expansion01\\doodads\\generic\\bloodelf\\bookshelf\\be_bookshelffilled_02.m2",
"World\\Azeroth\\karazahn\\passivedoodads\\bookshelves\\karazahnbookshelfsmall.m2",
"World\\Generic\\human\\passive doodads\\bookstacks\\generalbookstackshort01.m2",
"World\\Generic\\human\\passive doodads\\bookstacks\\generalbookstacktall01.m2",
"World\\Generic\\human\\passive doodads\\books\\generalbook01.m2",
"World\\Generic\\human\\passive doodads\\books\\booksmallopen05.m2",
"World\\Generic\\human\\passive doodads\\candelabras\\generalcandelabra01.m2",
"World\\Generic\\passivedoodads\\lights\\candelabratallwall01.m2",
"World\\Generic\\passivedoodads\\lights\\candelabratallwall02.m2",
"World\\Dungeon\\goldshireinn\\innchandelier\\innchandelier.m2",
"World\\Generic\\human\\passive doodads\\artwork\\stormwindpainting05.m2",
"World\\Generic\\human\\passive doodads\\artwork\\stormwindpainting04.m2",
"World\\Generic\\human\\passive doodads\\artwork\\stormwindpainting03.m2",
"World\\Generic\\human\\passive doodads\\artwork\\stormwindpainting02.m2",
"World\\Generic\\human\\passive doodads\\artwork\\stormwindpainting01.m2",
"World\\Generic\\human\\passive doodads\\artwork\\painting14.m2",
"World\\Generic\\human\\passive doodads\\artwork\\painting12.m2",
"World\\Generic\\human\\passive doodads\\artwork\\painting09.m2",
"World\\Generic\\human\\passive doodads\\artwork\\painting08.m2",
"World\\Generic\\human\\passive doodads\\artwork\\painting06.m2",
"World\\Generic\\human\\passive doodads\\artwork\\painting05.m2",
"World\\Expansion02\\doodads\\dalaran\\dalaran_painting_01.m2",
"World\\Generic\\human\\passive doodads\\firewood\\firewoodpile04.m2",
"World\\Generic\\passivedoodads\\diadelosmuertos\\diadelosmuertos_vaseflowers_01.m2",
"World\\Generic\\human\\passive doodads\\animalheads\\stuffedbear.m2",
"World\\Generic\\human\\passive doodads\\animalheads\\stuffedfrenzy.m2",
"World\\Generic\\human\\passive doodads\\animalheads\\stuffedtallstrider.m2",
"World\\Generic\\human\\passive doodads\\animalheads\\duskwoodboarhead01.m2",
"World\\Generic\\human\\passive doodads\\animalheads\\duskwooddeerhead01.m2",
"World\\Expansion02\\doodads\\grizzlyhills\\trappers\\trapper_potbellystove_01.m2",
"World\\Generic\\human\\passive doodads\\cauldrons\\cauldron.m2",
"World\\Generic\\human\\passive doodads\\rugs\\stormwindrug01.m2",
"World\\Generic\\human\\passive doodads\\rugs\\stormwindrug02.m2",
"World\\Generic\\human\\passive doodads\\rugs\\generalbearskinrug01.m2",
"World\\Expansion02\\doodads\\wintertauren\\wt_rug_02.m2",
"World\\Expansion02\\doodads\\stratholme_past\\ld_oldstratholme_rug04.m2",
"World\\Generic\\human\\passive doodads\\dolls\\ragdoll_02.m2",
"World\\Generic\\human\\passive doodads\\toys\\toytrain_01.m2",
"World\\Generic\\human\\passive doodads\\plates\\generaldirtyplate01.m2",
"World\\Generic\\human\\passive doodads\\tables\\inntablesmall.m2",
"World\\Generic\\human\\passive doodads\\tables\\duskwoodtable01.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventableaverage01.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventableaverage02.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventableaverage03.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventableaverage04.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventablesimple05.m2",
"World\\Generic\\dwarf\\passive doodads\\tables\\dwarventablesimple04.m2",
"World\\Azeroth\\westfall\\passivedoodads\\westfalltable\\westfalltable.m2",
"World\\Azeroth\\elwynn\\passivedoodads\\tables\\roundtable\\roundtable.m2",
"World\\Generic\\human\\passive doodads\\chairs\\generalchairhighend01.m2",
"World\\Generic\\human\\passive doodads\\benches\\duskwoodbench.m2",
"World\\Generic\\orc\\passive doodads\\tailoring\\boots\\orcboots03.m2",
"World\\Generic\\passivedoodads\\lights\\candle01.m2",
"World\\Generic\\passivedoodads\\lights\\candle02.m2",
"World\\Generic\\passivedoodads\\lights\\candle03.m2",
"World\\Generic\\passivedoodads\\lights\\candleoff03.m2",
"World\\Generic\\activedoodads\\chest03\\chest03.m2",
"World\\Generic\\activedoodads\\chest02\\chest02.m2",
"World\\Skillactivated\\containers\\treasurechest01.m2",
"World\\Generic\\human\\passive doodads\\desks\\fancydesk01.m2"
}
local namez = {
	"Гоблинский шатер",
"Туристическая палатка",
"Туристический навес",
"Орочий навес",
"Экспедиционный павильон",
"Генеральский шатер",
"Палатка дочерей Элуны",
"Роскошный шатер кентавров",
"Шатер распространителей чумы",
"Ужасающая ограда",
"Обугленные колья",
"Добротная ограда",
"Обугленный колышек",
"Добротный колышек",
"Бревенчатое ограждение",
"Связка бревен",
"Превосходная ограда из темного дерева",
"Большая превосходная ограда из темного дерева",
"Добротный факел",
"Факел из подручных материалов",
"Устойчивый факел",
"Прикрытые припасы",
"Запас продовольствия",
"Небольшой табурет",
"Большая фляга",
"Веревка",
"Кувшин с водой",
"Ящик для инструментов",
"Бочка",
"Припасы для лучника",
"Мешок зерна",
"Мешок с песком",
"Миска с горячим супом",
"Лодка",
"Орочьи экспедиционные припасы",
"Набор продовольствия людей",
"Королевское вооружение",
--merchant--
"Палатка торговца свечами",
"Гоблинская забегаловка",
"Лордеронская роскошь",
"Стенд отрекшихся",
"Приличное заведение",
"Торговый навес",
"Пивная",
"Дуротарская вывеска",
"Дарнасская лавка",
"Благородная вывеска",
"Небольшая благородная вывеска",
"Добротная лавка",
"Запредельная палатка",
"Турнирная палатка",
"Орочья забота",
"Славная палата",
"Изысканная лавка",
"Продуктовое раздолье",
"Манекен для опытного бойца",
"Мишень Гобин-Руда",
"Вагон Джипси",
"Ящик для продуктов",
"Корыто",
"Добротная клумба",
"Бюджетный столик",
"Гнездо",
"Чумной вагон",
"Взрывоопасная телега",
"Транспорт высокорожденного",
"Гоблинские прелести",
"Телега с напитками",
"Изысканный вагон",
"Вагон распространителей чумы",
"Даларанский вагончик",
"Пустая повозка",
"Повозка с сеном",
"Колымага с сеном",
"Мрачная повозка",
"Великолепное блюдо",
"Изысканное лакомство",
"Куриная нога",
"Романтический пикник",
"Орочий пикник",
"Добротный стол",
"Гномий стол",
"Дворфийский стол",
"Резной стол",
"Мраморный стол",
"Мясная стойка",
"Барбекю",
"Славные щиты",
"Геральдические щиты",
"Оружие дикарей",
"Стойка с оружием",
"Пушки Гризвольда",
"Стойка с ружьями",
"Оружейная огров",
"Изысканная стойка с лезвиями",
"Волшебная изысканная стойка",
"Тканевый ковер",
"Зеленый ковер",
"Стойка с рыбой",
"Орудия для пыток",
"Настенный щит",
"Генератор счастья",
"Изысканные напитки",
"Стойка",
"Кольчуга",
"Шлем на продажу",
"Отличная куртка",
"Кольчужная шапочка",
"Добротный стул",
"Благородный стул",
"Гоблинское креслице",
"Роскошный стул",
"Даларанский табурет",
"Изысканный стул",
"Орочья вывеска: Еда",
"Орочья вывеска: Оружие",
"Орочья вывеска: Одежда",
"Орочья вывеска: Общее",
"Людская вывеска: Общее",
"Людская вывеска: Еда",
"Людская вывеска: Одежда",
"Людская вывеска: Оружие",
--HOUSING SYSTEM--
"Двойная детская кровать",
"Дешевая кровать",
"Грязный матрас",
"Роскошная кровать",
"Роскошная кровать с балдахином",
"Уютная кровать с балдахином",
"Уютная кровать",
"Гардероб из светлого дерева",
"Резной гардероб из темного дерева",
"Резной гардероб из красного дерева",
"Дешевый гардероб",
"Книжный шкаф",
"Дешевый пустой стеллаж",
"Дешевая пустая тумба",
"Тумба из светлого дерева",
"Стеллаж из светлого дерева",
"Детский шкаф из светлого дерева",
"Закрытая тумба из светлого дерева",
"Резная тумба из темного дерева",
"Резной стеллаж из темного дерева",
"Резной детский шкаф из темного дерева",
"Закрытая резная тумба из темного дерева",
"Стеллаж из красного дерева",
"Детский шкаф из красного дерева",
"Закрытая тумба из красного дерева",
"Эльфийский книжный шкаф",
"Каменный книжный шкаф",
"Стопка книг",
"Большая стопка книг",
"Книга",
"Открытая книга",
"Подсвечник",
"Канделябра для плоской стены",
"Канделябра для углов",
"Добротная люстра",
"Пейзаж 5",
"Пейзаж 4",
"Пейзаж 3",
"Пейзаж 2",
"Пейзаж 1",
"Натура",
"Портрет рыцаря",
"Портрет девочки",
"Портрет мальчика",
"Портрет дамы",
"Портрет дамы в доспехах",
"Роскошный портрет дамы",
"Дрова для камина",
"Ваза с цветами",
"Чучело медведя",
"Чучело рыбы",
"Чучело долгонога",
"Голова кабана",
"Голова оленя",
"Печь",
"Котел для варки",
"Зеленый ковер",
"Красный ковер",
"Медвежья шкура",
"Коврик в прихожей",
"Роскошный синий ковер",
"Кукла",
"Игрушечный поезд",
"Тарелка",
"Маленький стол",
"Старый стол",
"Стол из красного дерева",
"Маленький стол из красного дерева",
"Резной столик из красного дерева",
"Маленький резной столик из красного дерева",
"Стол из светлого дерева",
"Столик из светлого дерева",
"Дешевый круглый стол бедняка",
"Круглый столик",
"Великолепный стул",
"Лавка в прихожей",
"Сапоги",
"Свеча 1",
"Свеча 2",
"Свеча 3",
"Потухшая свеча",
"Сундук",
"Сундучок",
"Добротный сундук",
"Письменный стол"
}
local itemz = {
97002,
97003,
97004,
97005,
97006,
97007,
97008,
97009,
97010,
97011,
97012,
97013,
97014,
97015,
97016,
97017,
97018,
97019,
97020,
97021,
97022,
97023,
97024,
97025,
97026,
97027,
97028,
97029,
97030,
97031,
97032,
97033,
97034,
97035,
97036,
97037,
97038,
--merchant--
97039,
97040,
97041,
97042,
97043,
97044,
97045,
97046,
97047,
97048,
97049,
97050,
97051,
97052,
97053,
97054,
97055,
97056,
97057,
97058,
97059,
97060,
97061,
97062,
97063,
97064,
97065,
97066,
97067,
97068,
97069,
97070,
97071,
97072,
97073,
97074,
97075,
97076,
97077,
97078,
97079,
97080,
97081,
97082,
97083,
97084,
97085,
97086,
97087,
97088,
97089,
97090,
97091,
97092,
97093,
97094,
97095,
97096,
97097,
97098,
97099,
97100,
97101,
97102,
97103,
97104,
97105,
97106,
97107,
97108,
97109,
97110,
97111,
97112,
97113,
97114,
97115,
97116,
97117,
97118,
97119,
97120,
97121,
97122,
97123,
--HOUSING SYSTEM--
97135,
97136,
97137,
97138,
97139,
97140,
97141,
97142,
97143,
97144,
97145,
97146,
97147,
97148,
97149,
97150,
97151,
97152,
97153,
97154,
97155,
97156,
97157,
97158,
97159,
97160,
97161,
97162,
97163,
97164,
97165,
97166,
97167,
97168,
97169,
97170,
97171,
97172,
97173,
97174,
97175,
97176,
97177,
97178,
97179,
97180,
97181,
97182,
97183,
97184,
97185,
97186,
97187,
97188,
97189,
97190,
97191,
97192,
97193,
97194,
97195,
97196,
97197,
97198,
97199,
97200,
97201,
97202,
97203,
97204,
97205,
97206,
97207,
97208,
97209,
97210,
97211,
97212,
97213,
97214,
97215,
97216,
97217,
97218,
97219
}

local function ObjectEditor(event, player, spell, skipCheck)
	if (spell:GetEntry() == 97001) then
		local x,y,z = spell:GetTargetDest()
		
			local creature = PerformIngameSpawn(1, 24648, player:GetMapId(), player:GetInstanceId(), x, y, z, player:GetO(), 1, 0, player:GetPhaseMask())
			if (creature) then
				local object = creature:GetNearestGameObject()
										creature:DeleteFromDB()
				if (object) then
					local IsOwner = WorldDBQuery("SELECT owner FROM gameobject_inform WHERE GUID = "..object:GetGUIDLow()..";")
					local num = 0
					local name = ""
					local model = ""

					for k, v in pairs(gameobjects) do
						if (v == object:GetEntry()) then
							num = k
						end
					end

					if (num) then
					 name = namez[num]
					 model = models[num]
				end

					if ((IsOwner and IsOwner:GetString(0)==player:GetName()) and name) then
						player:SendBroadcastMessage("[SADDON_OBJECTEDIT_"..object:GetGUIDLow().."_"..model.."_"..name.."]")
					end
				end
			end
	end
end
	RegisterPlayerEvent(5, ObjectEditor)

local function ObjectSpawnAndSaveToDb(event, player, spell, skipCheck)
	for k, v in pairs(spells) do
		if (v == spell:GetEntry()) then
			--spell:Finish()
			local x,y,z = spell:GetTargetDest()
				local object = PerformIngameSpawn(2, gameobjects[k], player:GetMapId(), player:GetInstanceId(), x, y, z, player:GetO(), 1, 0, player:GetPhaseMask())
				--if (object) then
				object:SaveToDB()
					WorldDBExecute("INSERT INTO gameobject_inform VALUES ("..object:GetGUIDLow()..", "..gameobjects[k]..", '"..player:GetName().."');")
				--end
		end
	end
end


	RegisterPlayerEvent(5, ObjectSpawnAndSaveToDb)

local function ObjectEditing(event, player, msg, Type, lang)
	if (msg:find("%[SADDON_OBJECTEDIT_DELETE_.*%]")) then
		local _,_,GUID = msg:find("%[SADDON_OBJECTEDIT_DELETE_(.*)%]")
		if not(tonumber(GUID)) then
			return false;
		end
		local position = WorldDBQuery("SELECT position_x, position_y,position_z, orientation,id FROM gameobject WHERE guid = "..GUID..";")
		if (position) then
			local creature = PerformIngameSpawn(1, 24648, player:GetMapId(), player:GetInstanceId(), position:GetFloat(0), position:GetFloat(1), position:GetFloat(2), position:GetFloat(3), 1, 0, player:GetPhaseMask())
			if (creature) then
				creature:DeleteFromDB()
				local mapid = WorldDBQuery("SELECT map FROM gameobject WHERE guid = "..tonumber(GUID)..";")
				local object = GetObjectByGUID(tonumber(GUID), mapid:GetInt32(0))
										if (object and (object:GetGUIDLow() == tonumber(GUID))) then
										local entry = object:GetEntry()
										for k, v in pairs(gameobjects) do
											if (v == entry) then
												object:DeleteFromDB()
												player:AddItem(itemz[k], 1)
												WorldDBExecute("DELETE FROM gameobject_inform WHERE guid = "..GUID..";")
												WorldDBExecute("DELETE FROM gameobject_inform_scales WHERE guid = "..GUID..";")
												player:SendBroadcastMessage("[SADDON_OBJECTEDIT_DELETED]")
											end
											end
										end
									end
		end
		return false;
	end
	if (msg:find("%[SADDON_OBJECTEDIT_SCALE_.*_.*%]")) then
		local _,_,GUID = msg:find("%[SADDON_OBJECTEDIT_SCALE_.*_(.*)%]")
		if not(tonumber(GUID)) then
			return false;
		end
		local _,_,tip = msg:find("%[SADDON_OBJECTEDIT_SCALE_(.*)_.*%]") 
		local position = WorldDBQuery("SELECT position_x, position_y,position_z, orientation, id FROM gameobject WHERE guid = "..GUID..";")
		if (position) then
			local creature = PerformIngameSpawn(1, 24648, player:GetMapId(), player:GetInstanceId(), position:GetFloat(0), position:GetFloat(1), position:GetFloat(2), position:GetFloat(3), 1, 0, player:GetPhaseMask())
			if (creature) then
				creature:DeleteFromDB()

				local mapid = WorldDBQuery("SELECT map FROM gameobject WHERE guid = "..tonumber(GUID)..";")
				local object = GetObjectByGUID(tonumber(GUID), mapid:GetInt32(0))

				if (object and (object:GetGUIDLow() == tonumber(GUID))) then
		if (tip == "+") then
			if not(object:GetScale() >= 2) then
			object:SetScale(object:GetScale()+0.1)
			object:RefreshObject()
			object:SaveToDB()
		end

			local scale = WorldDBQuery("SELECT scale FROM gameobject_inform_scales WHERE guid = "..object:GetGUIDLow()..";")
	if (scale) then
		WorldDBExecute("UPDATE gameobject_inform_scales SET scale = "..object:GetScale().." WHERE guid = "..object:GetGUIDLow()..";")
	else
		WorldDBExecute("INSERT INTO gameobject_inform_scales VALUES ("..object:GetGUIDLow()..", "..object:GetScale()..");")
	end

			object:SaveToDB()
		elseif (tip == "-") then
			object:SetScale(object:GetScale()-0.1)
			object:RefreshObject()
			object:SaveToDB()

local scale = WorldDBQuery("SELECT scale FROM gameobject_inform_scales WHERE guid = "..object:GetGUIDLow()..";")
	if (scale) then
		WorldDBExecute("UPDATE gameobject_inform_scales SET scale = "..object:GetScale().." WHERE guid = "..object:GetGUIDLow()..";")
	else
		WorldDBExecute("INSERT INTO gameobject_inform_scales VALUES ("..object:GetGUIDLow()..", "..object:GetScale()..");")
	end

			object:SaveToDB()
		end
		end
	end
end
		return false;
	end
	if (msg:find("%[SADDON_OBJECTEDIT_TURN_.*%]")) then
		local _,_,GUID = msg:find("%[SADDON_OBJECTEDIT_TURN_(.*)%]")
		if not(tonumber(GUID)) then
			return false;
		end
		local position = WorldDBQuery("SELECT position_x, position_y,position_z, orientation, id FROM gameobject WHERE guid = "..GUID..";")
		if (position) then
			local creature = PerformIngameSpawn(1, 24648, player:GetMapId(), player:GetInstanceId(), position:GetFloat(0), position:GetFloat(1), position:GetFloat(2), position:GetFloat(3), 1, 0, player:GetPhaseMask())
			if (creature) then
				creature:DeleteFromDB()
				local mapid = WorldDBQuery("SELECT map FROM gameobject WHERE guid = "..tonumber(GUID)..";")
				local object = GetObjectByGUID(tonumber(GUID), mapid:GetInt32(0))
				if (object and (object:GetGUIDLow() == tonumber(GUID))) then
				--WorldDBExecute("UPDATE gameobject SET orientation = "..player:GetO().." WHERE guid = "..GUID..";")
				object:TurnObject(player:GetO())
				object:SaveToDB()
			end
		end
		end
				return false;
	end
end

	RegisterPlayerEvent(18, ObjectEditing)


local function SetObjectScalePERM(event, go)
	local scale = WorldDBQuery("SELECT scale FROM gameobject_inform_scales WHERE guid = "..go:GetGUIDLow()..";")
	if (scale) then
		go:SetScale(scale:GetFloat(0))
	end
end

for k,v in pairs(gameobjects) do
RegisterGameObjectEvent(v, 2, SetObjectScalePERM)
end


local function NOGOB()
	local tableofguid = WorldDBQuery("SELECT GUID FROM gameobject_inform")
	if (tableofguid) then
		for i = 1, tableofguid:GetRowCount() do
			if not(WorldDBQuery("SELECT guid FROM gameobject WHERE guid = "..tableofguid:GetInt32(0)..";")) then
				WorldDBExecute("DELETE FROM gameobject_inform_scales WHERE guid = "..tableofguid:GetInt32(0)..";")
				WorldDBExecute("DELETE FROM gameobject_inform WHERE GUID = "..tableofguid:GetInt32(0)..";")
			end
			tableofguid:NextRow()
		end
	end
end
	CreateLuaEvent(NOGOB, 96000, 0)