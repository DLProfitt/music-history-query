-- 1. Query all of the entries in the Genre table
SELECT * 
FROM Genre;

-- 2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT * 
FROM Artist 
ORDER BY ArtistName;

-- 3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT s.Title, a.ArtistName 
FROM Song s Left Join Artist a ON s.ArtistId = a.id;

-- 4. Write a SELECT query that lists all the Artists that have a Pop Album
SELECT a.ArtistName as "Artist", g.Name as "Genre"
FROM Artist a 
Left Join Genre g ON g.Name = 'Pop';

-- 5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT a.ArtistName as "Artist", g.Name as "Genre"
FROM Artist a 
INNER JOIN Genre g ON g.Name = 'Jazz' OR g.Name = 'Rock';

-- 6. Write a SELECT statement that lists the Albums with no songs
SELECT a.Title, s.Title
FROM Album a
Left Join Song s ON a.Id = s.AlbumId
WHERE s.Id IS NULL;

-- 7. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist(ArtistName, YearEstablished) 
VALUES ('Hiromi Euhara', 1996);

-- 8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Spectrum', '2019-09-18', 73.16, 'Telarc', (SELECT TOP 1 Id FROM Artist WHERE ArtistName = 'Hiromi Euhara'), 4);
SELECT * FROM Album a Where ArtistId = (SELECT TOP 1 Id FROM Artist WHERE ArtistName = 'Hiromi Euhara');


-- 9. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Kaleidoscope', 8.01, '2019-09-18', 4, (SELECT TOP 1 Id FROM Artist WHERE ArtistName = 'Hiromi Euhara'), (SELECT TOP 1 a.Id FROM Album a LEFT JOIN Artist ar ON a.ArtistId = ar.Id)),
       ('Whiteout', 5.12, '2019-09-18', 4, (SELECT TOP 1 Id FROM Artist WHERE ArtistName = 'Hiromi Euhara'), (SELECT TOP 1 a.Id FROM Album a LEFT JOIN Artist ar ON a.ArtistId = ar.Id)),
       ('Yellow Wurlitzer Blues', 6.06, '2019-09-18', 4, (SELECT TOP 1 Id FROM Artist WHERE ArtistName = 'Hiromi Euhara'), (SELECT TOP 1 a.Id FROM Album a LEFT JOIN Artist ar ON a.ArtistId = ar.Id));

DELETE FROM Song WHERE AlbumId = (SELECT Id FROM Album WHERE Title = 'Spectrum');

SELECT Title FROM Song WHERE AlbumId = (SELECT TOP 1 a.Id FROM Album a LEFT JOIN Artist ar ON a.ArtistId = ar.Id);

SELECT * FROM Genre;
SELECT * FROM Artist;
SELECT * FROM Album;
SELECT * FROM Song;

-- 10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
-- NOTE: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id; 

