INSERT INTO GENRE (name)
VALUES 
('���'),
('��������'),
('���-������'),
('�����'),
('�����'),
('������'),
('��������� �����');


INSERT INTO ARTIST (name)
VALUES 
('����'),
('�����'),
('��������� ������'),
('����'),
('�������� ��������'),
('����� ������'),
('������ ��������'),
('��� ��������'),
('Yiruma'),
('The Immortals'),
('IM');

INSERT INTO Album (name, year_album)
VALUES 
('���� ������ ���',1995),
('������ � ������',1994),
('��� ����: ������ ������!',2000),
('������ �����',1988),
('����� � �����',1973),
('��� ����',2000),
('� ������ �� ����',2014),
('�� ��������, ����',2011),
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
('������ ������', 157, 1),
('��� �����', 298, 1),
('���� ������ ���',434,1),
('������ � ������',182,2),
('�������', 166, 2),
('������, �������', 162, 2),
('��� ����!', 238, 3),
('�����, ������!', 263, 3),
('������ �����', 283, 4),
('������ �� ���� �����, � �����', 256, 4),
('������ � ������', 149, 5),
('����� ���� � ��� ������ �� ����', 281, 5),
('� �� �����', 100, 5),
('����� � �����', 258, 6),
('����� � �������� �����', 321, 6),
('� ������ �� ����', 265, 7),
('�������', 218, 7),
('�� ��������, ����', 201, 8),
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



