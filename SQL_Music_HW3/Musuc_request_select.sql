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


--количество исполнителей в каждом жанре
SELECT g.name, count(a.name) FROM genre g 
JOIN artistgenre ag ON g.id = ag.genre_id 
JOIN artist a ON ag.artist_id = a.id 
GROUP BY g.name
ORDER BY count(a.name);

--*в каком количестве жанров присутствует каждый исполнитель
SELECT a.name, count(g.name) FROM artist a 
JOIN artistgenre ag ON 	a.id = ag.artist_id 
JOIN genre g ON ag.genre_id = g.id 
GROUP BY a.name
ORDER BY count(g.name);

--количество треков, вошедших в альбомы 2019-2020 годов
SELECT a.name, count(t.name) FROM album a
JOIN track t ON a.id = t.album_id 
WHERE year_album BETWEEN 2019 and 2020
GROUP BY a.name
ORDER BY count(t.name);

--средняя продолжительность треков по каждому альбому
SELECT a.name, avg(time_track_sec) FROM album a 
JOIN track t ON a.id = t.album_id  	
GROUP BY a.name 
ORDER BY avg(time_track_sec);

-- все исполнители, которые не выпустили альбомы в 2020 году;
SELECT a.name FROM artist a 
JOIN artistalbum aa ON a.id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.id
WHERE a.name != (SELECT a.name FROM artist WHERE year_album = 2020)
GROUP BY a.name;





