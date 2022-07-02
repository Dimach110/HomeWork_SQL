

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
SELECT name FROM artist 
WHERE name NOT IN (SELECT a.name FROM artist a
JOIN artistalbum aa ON a.id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.id
WHERE year_album = 2020)
GROUP BY name;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT c.name FROM collection c
JOIN track t ON c.track_id = t.id 
JOIN album al ON t.album_id = al.id 
JOIN artistalbum aa ON al.id = aa.album_id 
JOIN artist ar ON aa.artist_id = ar.id 
WHERE ar.name = 'Кино'
GROUP BY c.name;

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT al.name, count(g.name) FROM album al 
JOIN artistalbum aa ON al.id = aa.album_id 
JOIN artist ar ON aa.artist_id = ar.id
JOIN artistgenre ag ON ar.id = ag.artist_id 
JOIN genre g ON ag.genre_id = g.id
GROUP BY al.name;

--наименование треков, которые не входят в сборники
SELECT t.name FROM track t 
LEFT JOIN collection c ON t.id = c.track_id
WHERE c.name IS NULL; 

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT a.name FROM artist a 
JOIN artistalbum aa ON a.id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.id 
JOIN track t ON a2.id = t.album_id 
WHERE t.time_track_sec = (SELECT min(time_track_sec) FROM track);

--название альбомов, содержащих наименьшее количество треков
SELECT a.name, COUNT(t.name) as my_count
FROM album a 
JOIN track t ON a.id = t.album_id 
GROUP BY a.name
HAVING count(t.name) = (SELECT min(my_count) FROM (SELECT a.name, count(t.name) AS my_count FROM album a 
JOIN track t ON a.id = t.album_id 
GROUP BY a.name) AS a);
