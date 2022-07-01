-- �������� � ��� ������ ��������, �������� � 2018 ����;
SELECT name, year_album FROM album
WHERE year_album = 2018;

--�������� � ����������������� ������ ����������� �����;
SELECT name, time_track_sec FROM track  
ORDER BY time_track_sec DESC
LIMIT 1;

--�������� ������, ����������������� ������� �� ����� 3,5 ������;
SELECT name, time_track_sec FROM track
WHERE time_track_sec <= 210;

--�������� ���������, �������� � ������ � 2018 �� 2020 ��� ������������;
SELECT DISTINCT name FROM collection
WHERE year_col BETWEEN 2018 AND 2020;

--�����������, ��� ��� ������� �� 1 �����;
SELECT name FROM artist 
WHERE name NOT LIKE '% %';

--�������� ������, ������� �������� ����� "���"/"my".
SELECT name FROM track
WHERE name LIKE 'my %'
OR name LIKE 'My %'
OR name LIKE '��� %'
OR name LIKE '��� %';


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
SELECT a.name FROM artist a 
JOIN artistalbum aa ON a.id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.id
WHERE a.name != (SELECT a.name FROM artist WHERE year_album = 2020)
GROUP BY a.name;





