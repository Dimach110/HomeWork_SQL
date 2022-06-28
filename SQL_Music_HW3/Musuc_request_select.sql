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

