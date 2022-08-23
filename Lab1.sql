Query 1.1
Find the name, genre, IMDB-rating of all the movies.

SELECT Movie_Name, Genre, IMDB_Rating FROM movie;


Query 1.2
Display all the distinct movie-genres.

SELECT DISTINCT (Genre) FROM movie;


Query 1.3
Find the name and current age of all the actors.

SELECT Actor_Name, 2021-Birth_Year as Current_Age FROM actor;


Query 1.4
Find all the movies of the thriller genre with an IMDB rating
greater than or equal to 8.0.

SELECT Movie_Name, Genre, IMDB_Rating
FROM movie
WHERE Genre IN ('thriller') AND IMDB_Rating>7.9;
/Or/
SELECT Movie_Name, Genre, IMDB_Rating
FROM movie
WHERE Genre IN ('thriller') AND IMDB_Rating>=8;


Query 1.5
Find the movie_name, release year, IMDB rating, and the name of the
director of all the movies.

SELECT movie.Movie_Name, movie.Year, movie.IMDB_Rating, director.Director_Name
FROM movie JOIN director using(Person_ID);
/or/
SELECT movie.Movie_Name, movie.Year, movie.IMDB_Rating, director.Director_Name
FROM movie, director
WHERE movie.Person_ID=director.Person_ID;
/or/
SELECT Movie_Name, Year, IMDB_Rating, Director_Name
FROM movie NATURAL JOIN director;
/or/
SELECT Movie_Name, Year, IMDB_Rating, Director_Name
FROM movie INNER JOIN director ON movie.Person_ID=director.Person_ID;
/or/
SELECT Movie_Name, Year, IMDB_Rating, Director_Name
FROM movie INNER JOIN director USING(Person_ID);


Query 1.6
Find the name and number of awards of those directors whose
name starts with an ‘S’.

SELECT Director_Name, No_Of_Awards
FROM director
WHERE Director_Name LIKE 'S%';


Query 1.7
Find the name and birth year of those directors whose name
contains an ‘a’ as its 2nd last character.

SELECT Director_Name, Birth_Year
FROM director
WHERE Director_Name LIKE '%a_';


Query 1.8
Find the name, release year, and genre of all the movies which
contain the word ‘Byomkesh’ anywhere in their name.

SELECT Movie_Name, Genre, Year
FROM movie
WHERE Movie_Name LIKE '%Byomkesh%';


Query 1.9
Find the name and IMDB rating of all the movies whose name
consists of only 2 characters.

SELECT Movie_Name, IMDB_Rating
FROM movie 
WHERE Movie_Name LIKE '__';


Query 2.0
Find the name and genre of all the movies whose name consists
of at least 4 characters.

SELECT Movie_Name, Genre
FROM movie
WHERE LENGTH(Movie_Name)>=4;
/or/
SELECT Movie_Name, Genre
FROM movie
WHERE Movie_Name LIKE "____%"


Query 2.1
Find the name and IMDB rating of all the movies which contain
either 1 or, 2 or, 3 or, 4 characters in their name.

SELECT Movie_Name, IMDB_Rating
FROM movie 
WHERE LENGTH(Movie_Name)=1 OR LENGTH(Movie_Name)=2 OR LENGTH(Movie_Name)=3 OR LENGTH(Movie_Name)=4;
/or/
SELECT Movie_Name, Genre
FROM movie
WHERE Movie_Name NOT LIKE "____%"


Query 2.2
Display all the movies according to their IMDB rating (in
descending order); if multiple movies have the same IMDB rating then
rearrange those movies alphabetically according to their names.

SELECT * 
FROM movie
ORDER BY IMDB_Rating DESC, Movie_Name ASC;


Query 2.3
Find the average IMDB rating of all the movies of the drama
genre.

SELECT Genre, AVG(IMDB_Rating)
FROM movie
WHERE Genre IN ('Drama');


Query 2.4
Find the total number of movies in the database.

SELECT COUNT(Movie_ID) AS Total_Movie
FROM movie;
/or/
SELECT COUNT(Movie_Name) AS Total_Movie
FROM movie;


Query 2.5
Find how many movie-genres are there in the database.

SELECT COUNT(DISTINCT Genre) AS Dissimilar_Genres
FROM movie;


Query 2.6
Find the total number of movies in each genre.

SELECT Genre AS Dissimilar_Genre,COUNT(Movie_ID)
FROM movie
GROUP BY Genre
//HAVING COUNT(Movie_ID)>=1;


Query 2.7
Find all the movies of action, thriller/fiction genre.

SELECT Movie_Name, Genre
FROM movie
WHERE Genre='Action' OR Genre ='Thriller' or Genre='Fiction';
/or/
SELECT Movie_Name, Genre
FROM movie
WHERE Genre IN ('Action', 'Thriller', 'Fiction');


Query 2.8 //check
Find the Name and current age of all the directors and actors.

SELECT Director_Name, 2021-director.Birth_Year AS Directors_Age
FROM director
UNION
SELECT  Actor_Name,  2021-actor.Birth_Year AS Actors_Age
FROM actor;
/or/
SELECT Director_Name AS Name, (2021-director.Birth_Year) AS Current_age
FROM director
UNION
SELECT  Actor_Name AS Name,  (2021-actor.Birth_Year) AS Current_age
FROM actor;

 
Query 3.1
Display the name, IMDb rating and genre of all the movies with
an IMDB rating greater than or equal to 8.0.

SELECT Movie_Name, IMDB_Rating, Genre
FROM movie 
WHERE IMDB_Rating >= 8.0;


Query 3.2
Display all the distinct movie-genres and the average IMDb
rating of each movie-genre.

SELECT Genre, AVG(IMDB_rating) AS Average_IMDB_Rating
from movie
GROUP BY Genre;


Query 3.3 
Find the name and the average IMDb rating of those
movie-genres whose average IMDb rating is greater than or equal to 7.5.

SELECT **Movie_Name,** Genre, AVG(IMDB_Rating) AS Average_IMDB_Rating
FROM movie
GROUP BY Genre
HAVING AVG(IMDB_Rating) >= 7.5;
// group by jar select o tar. onno attribute bhat pay na. 


Query 3.4
Find the name, number of films and number of awards of the
director who directed the most number of films

SELECT Director_Name, No_of_Films, No_of_Awards
FROM director
GROUP BY No_of_Films DESC, Director_Name
HAVING MAX(No_of_Films);


Query 3.5
Find the name, current age, number of films and number of
awards of the youngest actor.

SELECT Actor_Name, 2021-Birth_Year AS Youngest_aged, No_of_Films, No_of_Awards
FROM actor
WHERE 2021-Birth_Year = (SELECT MIN(2021-Birth_Year) FROM actor);


Query 3.6
Find the name, IMDb rating and genre of those movies whose
IMDb Rating is above average.

SELECT Movie_Name, IMDB_Rating AS IMDB_Rating_Greater_than_avg, Genre
FROM movie
WHERE IMDB_Rating > (SELECT AVG(IMDB_Rating) FROM movie); 


Query 3.7
Find the name and average IMDb rating of those movie-genres
whose average IMDb rating is below average.

SELECT  Genre, AVG(IMDB_Rating) AS Below_avg
FROM movie
GROUP BY Genre
HAVING AVG(IMDB_Rating) < (SELECT AVG(IMDB_Rating) FROM movie);


Query 3.8
Among all the movie genres, find the highest average IMDb
rating.

SELECT Genre, AVG(IMDB_Rating) AS High_avg_Genre
FROM movie
GROUP BY Genre
HAVING AVG(IMDB_Rating) >= ALL(SELECT AVG(IMDB_Rating) FROM movie GROUP BY Genre);
/or/
SELECT  AVG(IMDB_Rating) AS High_avg, Genre
FROM movie
GROUP BY Genre
ORDER BY AVG(IMDB_Rating) DESC
LIMIT 1
/or/
SELECT genre, MAX(Imdb) FROM
    (SELECT Genre AS genre, AVG(IMDB_Rating) AS Imdb 
     FROM movie 
     GROUP BY Genre 
     ORDER BY IMDB_Rating DESC 
     LIMIT 1) AS avg_imdb;


CT2
SELECT DISTINCT BookNAME 
FROM Book 
JOIN Book_Publisher_Relationship 
ON Book.ISBN=Book_Publisher_Relationship.ISBN 
ORDER BY Price ASC;


Query 4.1
Find the name and age of all the movie characters who are not
teenagers.

SELECT Character_Name, Age
FROM movie_characters
WHERE  Age < 13 OR Age > 19;


Query 4.2
Find the movie ID of all the movies and the number of
movie-characters in each movie

SELECT Movie_ID, COUNT(Character_ID) AS Character_number
FROM movie_character_relationship
GROUP BY Movie_ID;


Query 4.3
Find the movie name of all the movies and the number of
movie-characters in each movie.

SELECT Movie_Name, COUNT(Character_ID) 
FROM movie AS m
JOIN movie_character_relationship AS mcr
ON m.Movie_ID=mcr.Movie_ID
GROUP BY mcr.Movie_ID;


Query 4.4
Find the name, year of release, IMDB rating and the name of the
director of all the movies that contain at least 12 characters (including
spaces) in their name.

SELECT Movie_Name, Year, IMDB_Rating, Director_Name
FROM movie AS m
JOIN director AS d
ON m.Person_Id=d.Person_Id
WHERE Director_Name LIKE "____________%"; [12 underscore]
/or/
SELECT Movie_Name, Year, IMDB_Rating, Director_Name
FROM movie AS m
JOIN director AS d
ON m.Person_Id=d.Person_Id
WHERE LENGTH(Director_Name)>=12;


Query 4.5
Find the name, year of release, IMDB rating and the name of the
director of all the movies that contain at most 12 characters (including
spaces) in their name.

SELECT Movie_Name, Year, IMDB_Rating, Director_Name
FROM movie AS m
JOIN director AS d
ON m.Person_Id=d.Person_Id
WHERE LENGTH(Director_Name)<=12;
/or/
SELECT Movie_Name, Year, IMDB_Rating, Director_Name
FROM movie AS m
JOIN director AS d
ON m.Person_Id=d.Person_Id
WHERE Director_Name NOT LIKE "_____________%"; [13 underscore]


Query 4.6
Find the name, year of release, IMDB rating of all the movies of
Byomkesh (N.B.: A movie of Byomkesh may not contain the term
‘Byomkesh’ in its name).

SELECT Movie_Name, Character_Name, Year, IMDB_Rating
FROM movie_character_relationship AS mcr
JOIN movie AS m
ON m.Movie_ID=mcr.Movie_ID
JOIN movie_characters AS mc
ON mcr.Character_ID=mc.Character_ID
WHERE Movie_Name LIKE "%Byomkesh%" AND Character_Name LIKE "%Byomkesh%"
GROUP BY m.Movie_Name;
/or/ real
SELECT Movie_Name, Character_Name, Year, IMDB_Rating
FROM movie_character_relationship AS mcr
JOIN movie AS m
ON m.Movie_ID=mcr.Movie_ID
JOIN movie_characters AS mc
ON mcr.Character_ID=mc.Character_ID
WHERE Character_Name LIKE "%Byomkesh%"
/or/
SELECT Movie_Name,Year AS Year_Of_Release,IMDB_Rating 
FROM movie NATURAL JOIN 
(SELECT Character_ID,Character_Name,Movie_ID 
    FROM
(SELECT * 
    FROM movie_characters 
    NATURAL JOIN movie_character_relationship) AS MovieCharJoinTable 
WHERE Character_Name="Byomkesh Bakshi") AS BakshiMovie [Audity]

******Question on natural join and Normal join*******

Query 4.7
Find the name and age of all the characters from the movies of
Feluda (N.B.: A movie of Feluda may not contain the term ‘Feluda’ in its
name).

SELECT Character_Name AS Characters_From_Feluda, Age
FROM movie_characters AS mc
JOIN movie_character_relationship AS mcr
ON mc.Character_ID=mcr.Character_ID
WHERE Movie_ID = (SELECT Movie_ID FROM movie_character_relationship 
WHERE Character_ID = (SELECT Character_ID FROM movie_characters WHERE Character_Name LIKE "%Feluda%"))

/or/
SELECT Character_Name AS CharFeluda,Age 
FROM movie_characters 
NATURAL JOIN (
SELECT Character_ID 
FROM movie_character_relationship 
NATURAL JOIN (SELECT Movie_ID 
    FROM movie_character_relationship 
    WHERE Character_ID=(
SELECT Character_ID 
FROM `movie_characters` 
WHERE Character_Name="Feluda")) AS FeludaTable) AS CharacterTable [Audity version]


***********Las Lab**************
Find the name and age of all the character from the movie of Saytajit Ray


SELECT Character_Name, Age
FROM movie_characters AS mc
WHERE Character_ID IN 
(SELECT Character_ID FROM movie_character_relationship WHERE Movie_ID IN
    (SELECT Movie_ID FROM movie WHERE Person_ID=
        (SELECT Person_ID FROM director WHERE Director_Name LIKE "%Saytajit Ray%")))
/or/

SELECT Character_Name, Age
FROM movie_characters AS mc
JOIN movie_character_relationship AS mcr
ON mc.Character_ID=mcr.Character_ID
WHERE Movie_ID IN
(SELECT Movie_ID FROM movie AS m
JOIN director AS d
ON d.Person_Id=m.Person_Id
WHERE Director_Name LIKE "%Saytajit Ray%")

/or/ I DID 

SELECT Character_Name, Age
FROM movie_characters AS mc
JOIN movie_character_relationship AS mcr
ON mc.Character_ID=mcr.Character_ID
JOIN movie AS m
ON mcr.Movie_ID=m.Movie_ID
JOIN director AS d
ON d.Person_Id=m.Person_Id
WHERE mc.Character_ID IN 
(SELECT Character_ID FROM movie_character_relationship WHERE Movie_ID IN
    (SELECT Movie_ID FROM movie WHERE Person_ID=
        (SELECT Person_ID FROM director WHERE Director_Name LIKE "%Saytajit Ray%")))

*****Ali sir ct ques ans*****
1. List the details of students who borrowed book whose author is “Abraham Silberschatz”
and which are issued on “3-8-2021”.

select *
from student as s
join issue_record as r 
on r.student_id = s.student_id
join book as b
on b.book_id = r.book_id
where r.issue_date = '3-8-2021' and b.author = 'Abraham Silberschatz';

2. Give a count of how many books have been borrowed by each student.

SELECT count(book_id), student_id
from issue_record
group by student_id;

3. List the students who reached the borrowed limit 3.

SELECT count(book_id), student_id
from issue_record
group by student_id
having count(book_id) = 3

4. Group the students who borrowed more than two books.

SELECT count(book_id), student_id
from issue_record
group by student_id
having count(book_id) > 2