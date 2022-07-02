

--���������� ������������ � ������ �����
SELECT g.name, count(a.name) FROM genre g 
JOIN artistgenre ag ON g.id = ag.genre_id 
JOIN artist a ON ag.artist_id = a.id 
GROUP BY g.name
ORDER BY count(a.name);

--*� ����� ���������� ������ ������������ ������ �����������
SELECT a.name, count(g.name) FROM artist a 
JOIN artistgenre ag ON 	a.id = ag.artist_id 
JOIN genre g ON ag.genre_id = g.id 
GROUP BY a.name
ORDER BY count(g.name);

--���������� ������, �������� � ������� 2019-2020 �����
SELECT a.name, count(t.name) FROM album a
JOIN track t ON a.id = t.album_id 
WHERE year_album BETWEEN 2019 and 2020
GROUP BY a.name
ORDER BY count(t.name);

--������� ����������������� ������ �� ������� �������
SELECT a.name, avg(time_track_sec) FROM album a 
JOIN track t ON a.id = t.album_id  	
GROUP BY a.name 
ORDER BY avg(time_track_sec);

-- ��� �����������, ������� �� ��������� ������� � 2020 ����;
SELECT name FROM artist 
WHERE name NOT IN (SELECT a.name FROM artist a
JOIN artistalbum aa ON a.id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.id
WHERE year_album = 2020)
GROUP BY name;

--�������� ���������, � ������� ������������ ���������� ����������� (�������� ����);
SELECT c.name FROM collection c
JOIN track t ON c.track_id = t.id 
JOIN album al ON t.album_id = al.id 
JOIN artistalbum aa ON al.id = aa.album_id 
JOIN artist ar ON aa.artist_id = ar.id 
WHERE ar.name = '����'
GROUP BY c.name;

--�������� ��������, � ������� ������������ ����������� ����� 1 �����;
SELECT al.name, count(g.name) FROM album al 
JOIN artistalbum aa ON al.id = aa.album_id 
JOIN artist ar ON aa.artist_id = ar.id
JOIN artistgenre ag ON ar.id = ag.artist_id 
JOIN genre g ON ag.genre_id = g.id
GROUP BY al.name;

--������������ ������, ������� �� ������ � ��������
SELECT t.name FROM track t 
LEFT JOIN collection c ON t.id = c.track_id
WHERE c.name IS NULL; 

--�����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������)
SELECT a.name FROM artist a 
JOIN artistalbum aa ON a.id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.id 
JOIN track t ON a2.id = t.album_id 
WHERE t.time_track_sec = (SELECT min(time_track_sec) FROM track);

--�������� ��������, ���������� ���������� ���������� ������
SELECT a.name, COUNT(t.name) as my_count
FROM album a 
JOIN track t ON a.id = t.album_id 
GROUP BY a.name
HAVING count(t.name) = (SELECT min(my_count) FROM (SELECT a.name, count(t.name) AS my_count FROM album a 
JOIN track t ON a.id = t.album_id 
GROUP BY a.name) AS a);
