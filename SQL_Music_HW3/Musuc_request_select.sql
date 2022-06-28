-- название и год выхода альбомов, вышедших в 2018 году;
SELECT name, year_album FROM album
WHERE year_album = 2018;

--название и продолжительность самого длительного трека;
SELECT name, time_track_sec FROM track  
ORDER BY time_track_sec DESC
LIMIT 1;

--название треков, продолжительность которых не менее 3,5 минуты;
SELECT name, time_track_sec FROM track
WHERE time_track_sec <= 210;

--названия сборников, вышедших в период с 2018 по 2020 год включительно;
SELECT DISTINCT name FROM collection
WHERE year_col BETWEEN 2018 AND 2020;

--исполнители, чье имя состоит из 1 слова;
SELECT name FROM artist 
WHERE name NOT LIKE '% %';

--название треков, которые содержат слово "мой"/"my".
SELECT name FROM track
WHERE name LIKE 'my %'
OR name LIKE 'My %'
OR name LIKE 'мой %'
OR name LIKE 'Мой %';

