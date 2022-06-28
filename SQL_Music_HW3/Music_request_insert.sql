INSERT INTO GENRE (name)
VALUES 
('Рок'),
('Классика'),
('Поп-музыка'),
('Техно'),
('Диско'),
('Шансон'),
('Авторская песня');


INSERT INTO ARTIST (name)
VALUES 
('Ария'),
('Браво'),
('Дискотека Авария'),
('Кино'),
('Владимир Высоцкий'),
('Игорь Крутой'),
('Сергей Трофимов'),
('Юли Савичева'),
('Yiruma'),
('The Immortals'),
('IM');

INSERT INTO Album (name, year_album)
VALUES 
('Ночь короче дня',1995),
('Дорога в облака',1994),
('Все хиты: Авария против!',2000),
('Группа крови',1988),
('Песня о Волге',1973),
('Без слов',2000),
('Я скучаю по тебе',2014),
('Ты вернёшься, знаю',2011),
('The Rewritten Memories',2021),
('Piano',2015),
('Mortal Kombat: The Album',1994),
('My Album', 2018);

INSERT INTO artistgenre 
VALUES 
(1,1),
(2,1),
(3,5),
(4,1),
(5,7),
(6,2),
(6,3),
(7,3),
(7,6),
(8,3),
(9,2),
(10,4),
(10,5);

INSERT INTO artistalbum 
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(9,10),
(10,11),
(11,12);

INSERT INTO track (name, time_track_sec, album_id)
VALUES 
('Король дороги', 157, 1),
('Дух войны', 298, 1),
('Ночь короче дня',434,1),
('Дорога в облака',182,2),
('Однажды', 166, 2),
('Любите, девушки', 162, 2),
('Пей пиво!', 238, 3),
('Давай, Авария!', 263, 3),
('Группа крови', 283, 4),
('Закрой за мной дверь, я ухожу', 256, 4),
('Москва – Одесса', 149, 5),
('Здесь лапы у ели дрожат на весу', 281, 5),
('Я не люблю', 100, 5),
('Песнь о друге', 258, 6),
('Когда я закрываю глаза', 321, 6),
('Я скучаю по тебе', 265, 7),
('Ветерок', 218, 7),
('Ты вернёшься, знаю', 201, 8),
('Embrace of Silence', 173, 9),
('The Last Paradise', 213, 9),
('Techno Syndrome (Mortal Kombat)', 205, 10),
('My track', 121, 11);

INSERT INTO collection (name, year_col, track_id) 
VALUES 
('My_Collection_1',2010, 1),
('My_Collection_1',2010,2), 
('My_Collection_1',2010,21),
('My_Collection_2',2020,6),
('My_Collection_2',2020,15),
('My_Collection_2',2020,16),
('My_Collection_3',2018,10),
('My_Collection_3',2018,12),
('My_Collection_3',2018,13),
('My_Collection_4',2019,19),
('My_Collection_4',2019,22),
('My_Collection_4',2019,14),
('My_Collection_5',2015,7),
('My_Collection_5',2015,9),
('My_Collection_5',2015,2),
('My_Collection_6',2016,4),
('My_Collection_6',2016,20),
('My_Collection_6',2016,16),
('My_Collection_7',2017,19),
('My_Collection_7',2017,12), 
('My_Collection_8',2021,13), 
('My_Collection_8',2021,10),
('My_Collection_8',2021,9);



