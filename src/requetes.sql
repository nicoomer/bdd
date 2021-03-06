Creation des tables
--------------------
CREATE TABLE Stream (url VARCHAR(100) NOT NULL, name VARCHAR(100) NOT NULL, webLink VARCHAR (100), description TEXT, PRIMARY KEY(url));
CREATE TABLE User (mail VARCHAR(100) NOT NULL, surname VARCHAR(40) NOT NULL, password VARCHAR(40), avatar VARCHAR(100), country VARCHAR(40), city VARCHAR(40), biography TEXT, date DATE, personal_stream_url VARCHAR(100) NOT NULL, PRIMARY KEY(mail), FOREIGN KEY(personal_stream_url) REFERENCES Stream(url));
CREATE TABLE Publication (url VARCHAR(255) NOT NULL, title VARCHAR(100) NOT NULL, date DATE, description TEXT, PRIMARY KEY(url));
CREATE TABLE Friendship (mail_sender VARCHAR(100) NOT NULL, mail_receiver VARCHAR(100) NOT NULL, status BOOLEAN, date DATE, PRIMARY KEY(mail_sender, mail_receiver), FOREIGN KEY(mail_sender) REFERENCES User(mail), FOREIGN KEY(mail_receiver) REFERENCES User(mail));
CREATE TABLE Comment (user_mail VARCHAR(100) NOT NULL, publication_url VARCHAR(255) NOT NULL, stream_url VARCHAR(100), content TEXT, date DATE, PRIMARY KEY(user_mail, publication_url, stream_url), FOREIGN KEY(user_mail) REFERENCES User(mail), FOREIGN KEY(publication_url) REFERENCES Publication(url), FOREIGN KEY(stream_url) REFERENCES Stream(url));
CREATE TABLE `Read` (user_mail VARCHAR(100) NOT NULL, publication_url VARCHAR(255) NOT NULL, date DATE, PRIMARY KEY(user_mail, publication_url), FOREIGN KEY(user_mail) REFERENCES User(mail), FOREIGN KEY(publication_url) REFERENCES Publication(url));
CREATE TABLE Subscribe (user_mail VARCHAR(100) NOT NULL, stream_url VARCHAR(100) NOT NULL, date DATE, PRIMARY KEY(user_mail, stream_url), FOREIGN KEY(user_mail) REFERENCES User(mail), FOREIGN KEY(stream_url) REFERENCES Stream(url));
CREATE TABLE Propose (stream_url VARCHAR(100) NOT NULL, publication_url VARCHAR(255) NOT NULL, PRIMARY KEY(stream_url, publication_url), FOREIGN KEY(stream_url) REFERENCES Stream(url), FOREIGN KEY(publication_url) REFERENCES Publication(url));

Insertion des donnees de test
------------------------------

--> Utilisateurs
-----------------
INSERT INTO User (mail, surname, password, avatar, country, city, biography, date, personal_stream_url) VALUES ("arosette@ulb.ac.be", "arosette", "arosette", "~/Images/arosette.jpg", "Belgique", "Theux", "Je suis un etudiant qui etudie à l'ulb et vit à Theux", '2009-02-02', "http://personal_stream/arosette@ulb.ac.be");
INSERT INTO User (mail, surname, password, avatar, country, city, biography, date, personal_stream_url) VALUES ("nomer@ulb.ac.be", "nomer", "nomer", "~/Images/nomer.jpg", "Belgique", "Bruxelles", "Je suis un etudiant qui etudie à l'ulb et vit à Bruxelles", '2009-01-02', "http://personal_stream/nomer@ulb.ac.be");
INSERT INTO User (mail, surname, password, avatar, country, city, biography, date, personal_stream_url) VALUES ("pveranneman@ulb.ac.be", "pveranneman", "pveranneman", "~/Images/pveranneman.jpg", "Bresil", "Rio", "Je suis un etudiant qui etudie à l'ulb et vit à Rio", '2007-02-02', "http://personal_stream/pveranneman@ulb.ac.be");
INSERT INTO User (mail, surname, password, avatar, country, city, biography, date, personal_stream_url) VALUES ("lpostula@ulb.ac.be", "lpostula", "lpostula", "~/Images/lpostula.jpg", "Belgique", "Liege", "Je suis un etudiant qui etudie à l'ulb et vit à Liege", '2009-03-02', "http://personal_stream/lpostula@ulb.ac.be");
INSERT INTO User (mail, surname, password, avatar, country, city, biography, date, personal_stream_url) VALUES ("sbeyen@ulb.ac.be", "sbeyen", "sbeyen", "~/Images/sbeyen.jpg", "Allemagne", "Berlin", "Je suis un etudiant qui etudie à l'ulb et vit à Berlin", '2010-01-01', "http://personal_stream/sbeyen@ulb.ac.be");
INSERT INTO User (mail, surname, password, avatar, country, city, biography, date, personal_stream_url) VALUES ("spicard@ulb.ac.be", "spicard", "spicard", "~/Images/spicard.jpg", "Belgique", "Ostende", "Je suis un etudiant qui etudie à l'ulb et vit à Ostende", '2008-01-02', "http://personal_stream/spicard@ulb.ac.be");

--> Flux
-----------------
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/arosette@ulb.ac.be", "Flux personnel de arosette", "http://personal_stream", "Voici le flux personnel de arosette, c'est ici qu'il partage les publications qu'il aime");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/nomer@ulb.ac.be", "Flux personnel de nomer", "http://personal_stream", "Voici le flux personnel de nomer, c'est ici qu'il partage les publications qu'il aime");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/pveranneman@ulb.ac.be", "Flux personnel de pveranneman", "http://personal_stream", "Voici le flux personnel de pveranneman, c'est ici qu'il partage les publications qu'il aime");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/lpostula@ulb.ac.be", "Flux personnel de lpostula", "http://personal_stream", "Voici le flux personnel de lpostula, c'est ici qu'il partage les publications qu'il aime");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/sbeyen@ulb.ac.be", "Flux personnel de sbeyen", "http://personal_stream", "Voici le flux personnel de sbeyen, c'est ici qu'il partage les publications qu'il aime");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/spicard@ulb.ac.be", "Flux personnel de spicard", "http://personal_stream", "Voici le flux personnel de spicard, c'est ici qu'il partage les publications qu'il aime");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://www.jeuxvideo.com", "Flux de jeuxvideo", "http://jeuxvideo", "Voici le flux de jeux video, vous pouvez en suivre l'actualité");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://www.youtube.com", "Flux de youtube", "http://youtube", "Voici le flux de youtube, vous pouvez en suivre l'actualité");
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://www.facebook.com", "Flux de facebook", "http://facebook", "Voici le flux de facebook, vous pouvez en suivre l'actualité");

--> Publications
-----------------
INSERT INTO Publication (url, title, date, description) VALUES ("http://www.perdu.com", "Perdu", '2014-05-08', "Vous vous êtes perdu ?");
INSERT INTO Publication (url, title, date, description) VALUES ("http://www.recherche.com", "Recherche", '2014-05-01', "Vous êtes recherché !");
INSERT INTO Publication (url, title, date, description) VALUES ("http://www.retrouve.com", "Retrouve", '2014-04-06', "Vous êtes retrouvé !");
INSERT INTO Publication (url, title, date, description) VALUES ("http://www.games.com", "Jeux", '2014-03-02', "Publication de jeux videos");
INSERT INTO Publication (url, title, date, description) VALUES ("http://www.videos.com", "Vidéos", '2014-04-26', "Publication de vidéos");

--> Amitiés
-----------------
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("arosette@ulb.ac.be", "nomer@ulb.ac.be", TRUE, '2011-09-14');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("nomer@ulb.ac.be", "pveranneman@ulb.ac.be", TRUE, '2011-09-24');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("lpostula@ulb.ac.be", "nomer@ulb.ac.be", FALSE, '2011-09-28');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("pveranneman@ulb.ac.be", "lpostula@ulb.ac.be", TRUE, '2012-09-21');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("arosette@ulb.ac.be", "pveranneman@ulb.ac.be", FALSE, '2013-10-14');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("nomer@ulb.ac.be", "spicard@ulb.ac.be", TRUE, '2013-10-14');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("sbeyen@ulb.ac.be", "nomer@ulb.ac.be", FALSE, '2011-12-14');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("sbeyen@ulb.ac.be", "pveranneman@ulb.ac.be", FALSE, '2011-12-14');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("sbeyen@ulb.ac.be", "lpostula@ulb.ac.be", FALSE, '2011-12-14');
INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("sbeyen@ulb.ac.be", "arosette@ulb.ac.be", FALSE, '2011-12-14');

--> Souscriptions
-----------------
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://www.jeuxvideo.com", '2008-09-21');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("arosette@ulb.ac.be", "http://www.facebook.com", '2007-02-22');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://www.youtube.com", '2006-09-23');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://www.facebook.com", '2009-09-22');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://personal_stream/arosette@ulb.ac.be", '2012-11-21');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("sbeyen@ulb.ac.be", "http://www.youtube.com", '2007-01-22');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("sbeyen@ulb.ac.be", "http://personal_stream/arosette@ulb.ac.be", '2001-02-22');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://www.jeuxvideo.com", '2000-01-21');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://www.youtube.com", '2002-02-23');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://personal_stream/lpostula@ulb.ac.be", '2001-09-22');
INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://personal_stream/spicard@ulb.ac.be", '2006-09-22');

--> Commentaires
-----------------
INSERT INTO Comment (user_mail, publication_url, stream_url, content, date) VALUES ("nomer@ulb.ac.be", "http://www.perdu.com", "http://www.facebook.com", "Non je suis où ?", '2009-01-12');
INSERT INTO Comment (user_mail, publication_url, stream_url, content, date) VALUES ("nomer@ulb.ac.be", "http://www.recherche.com", "http://www.facebook.com", "Vous arrivez bientôt ?", '2010-01-12');
INSERT INTO Comment (user_mail, publication_url, stream_url, content, date) VALUES ("nomer@ulb.ac.be", "http://www.retrouve.com", "http://www.facebook.com", "Cool !", '2011-01-12');
INSERT INTO Comment (user_mail, publication_url, stream_url, content, date) VALUES ("arosette@ulb.ac.be", "http://www.perdu.com", "http://www.facebook.com", "Tu es perdu !", '2009-01-13');
INSERT INTO Comment (user_mail, publication_url, stream_url, content, date) VALUES ("arosette@ulb.ac.be", "http://www.recherche.com", "http://www.facebook.com", "On fait ce qu'on peut !", '2010-01-13');
INSERT INTO Comment (user_mail, publication_url, stream_url, content, date) VALUES ("arosette@ulb.ac.be", "http://www.retrouve.com", "http://www.facebook.com", "Vous êtes ici", '2011-01-11');
INSERT INTO Comment (user_mail, publication_url, stream_url, content, date) VALUES ("pveranneman@ulb.ac.be", "http://www.perdu.com", "http://www.facebook.com", "C'est malin !", '2009-01-13');

--> Proposition
-----------------
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://www.facebook.com", "http://www.perdu.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://www.facebook.com", "http://www.recherche.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://www.facebook.com", "http://www.retrouve.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://www.jeuxvideo.com", "http://www.games.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://www.youtube.com", "http://www.videos.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://personal_stream/nomer@ulb.ac.be", "http://www.games.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://personal_stream/nomer@ulb.ac.be", "http://www.videos.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://personal_stream/nomer@ulb.ac.be", "http://www.recherche.com");
INSERT INTO Propose (stream_url, publication_url) VALUES ("http://personal_stream/nomer@ulb.ac.be", "http://www.retrouve.com");

--> Lecture
------------
INSERT INTO `Read` (user_mail, publication_url, date) VALUES ("nomer@ulb.ac.be", "http://www.perdu.com", '2014-11-02');
INSERT INTO `Read` (user_mail, publication_url, date) VALUES ("nomer@ulb.ac.be", "http://www.games.com", '2014-09-02');
INSERT INTO `Read` (user_mail, publication_url, date) VALUES ("arosette@ulb.ac.be", "http://www.recherche.com", '2014-11-02');
INSERT INTO `Read` (user_mail, publication_url, date) VALUES ("pveranneman@ulb.ac.be", "http://www.videos.com", '2014-09-02');

Requetes de selection
----------------------

--> Liste les amitiés d'un utilisateur
---------------------------------------
<user>
SELECT * FROM Friendship f WHERE f.Status = TRUE AND (mail_sender = <user>.mail OR mail_receiver = <user>.mail)

--> Liste le nombre d'amis d'un utilisateur
-------------------------------------------
<user>
SELECT COUNT(*) FROM Friendship f WHERE f.Status = TRUE AND (mail_sender = <user>.mail OR mail_receiver = <user>.mail)

--> Liste toutes les amitiés existantes 
----------------------------------------
SELECT DISTINCT f.mail_sender, f.mail_receiver FROM User u, Friendship f 
WHERE f.Status = TRUE AND (mail_sender = u.mail OR mail_receiver = u.mail)

--> R1 Liste tous les utilisateurs qui ont au plus 2 amis
------------------------------------------------------------
SELECT u.surname, COUNT(*)
FROM User u LEFT JOIN (SELECT * FROM Friendship f1 WHERE f1.status = TRUE) AS f2 
ON f2.mail_sender = u.mail OR f2.mail_receiver = u.mail
GROUP BY u.mail
HAVING COUNT(*) < 3;

--> Liste tous les flux de l'utilisateur
-----------------------------------------
<user>
SELECT * FROM Stream s WHERE s.url IN (
    SELECT (sub.stream_url) FROM Subscribe sub WHERE sub.user_mail = <user>)
    
SELECT u.surname, s.url FROM User u, Stream s WHERE s.url IN (
    SELECT (sub.stream_url) FROM Subscribe sub WHERE sub.user_mail = u.mail)

--> R2 : La liste des flux auxquels a souscrit au moins un 
-- utilisateur qui a souscrit à au moins deux flux auxquel X a souscrit
-------------------------------------------------------------------------
<user>
SELECT DISTINCT s3.*
FROM Subscribe sub3, Stream s3
WHERE sub3.stream_url = s3.url AND sub3.user_mail IN
    (SELECT u1.mail
    FROM User u1, Stream s2, Subscribe sub2
    WHERE sub2.user_mail != <user>.mail
    AND sub2.user_mail = u1.mail 
    AND sub2.stream_url = s2.url 
    AND sub2.stream_url IN    
        (SELECT sub1.stream_url 
            FROM Subscribe sub1 
            WHERE sub1.user_mail = <user>.mail)
    GROUP BY sub2.user_mail
    HAVING COUNT(*) >= 2);

--> Liste des publications d'un flux
-------------------------------------
<stream>
SELECT p.publication_url
FROM Propose p
WHERE p.stream_url = <stream>.url

--> Détermine à quel flux appartient la publication
----------------------------------------------------
<publication>
SELECT p.stream_url
FROM Propose p
WHERE p.publication_url = <publication>.url

--> Liste des flux auxquels X a souscrit duquel il n’a partagé aucune publication
----------------------------------------------------------------------------------
<userX>
CREATE TEMPORARY TABLE TMP_USER_SUBSCRIPTIONS SELECT s.url FROM Stream s WHERE s.url IN (SELECT (sub.stream_url) FROM Subscribe sub WHERE sub.user_mail = <userX>.mail)
CREATE TEMPORARY TABLE TMP_USER_SHARED_PUBLICATION SELECT c.publication_url FROM Comment c WHERE c.user_mail = <userX>.mail
CREATE TEMPORARY TABLE TMP_USER_STREAM_PUBLICATION SELECT s.url, p.publication_url FROM Propose p, TMP_USER_SUBSCRIPTIONS s WHERE p.stream_url = s.url

SELECT streamPub.url FROM TMP_USER_STREAM_PUBLICATION streamPub WHERE streamPub.publication_url NOT IN (SELECT pub.publication_url FROM TMP_USER_SHARED_PUBLICATION pub)

DROP TABLE TMP_USER_SUBSCRIPTIONS
DROP TABLE TMP_SHARED_PUBLICATION
DROP TABLE TMP_USER_STREAM_PUBLICATION

--> R3 : La liste des flux auxquels X a souscrit, auxquels aucun de 
-- ses amis n’a souscrit et duquel il n’a partagé aucune publication
---------------------------------------------------------------------
<userX>
CREATE TEMPORARY TABLE TMP_USER_SUBSCRIPTIONS SELECT s.url FROM Stream s WHERE s.url IN (SELECT (sub.stream_url) FROM Subscribe sub WHERE sub.user_mail = <userX>.mail)
CREATE TEMPORARY TABLE TMP_USER_SHARED_PUBLICATION SELECT c.publication_url FROM Comment c WHERE c.user_mail = <userX>.mail
CREATE TEMPORARY TABLE TMP_FRIEND_USER SELECT DISTINCT u.mail FROM User u, Friendship f WHERE f.Status = TRUE AND (mail_sender = <userX>.mail OR mail_receiver = <userX>.mail) AND u.mail != <userX>.mail
CREATE TEMPORARY TABLE TMP_FRIEND_SUBSCRIPTIONS SELECT u.mail, s.url FROM TMP_FRIEND_USER u, Stream s WHERE s.url IN (SELECT (sub.stream_url) FROM Subscribe sub WHERE (sub.user_mail = u.mail))
CREATE TEMPORARY TABLE TMP_USER_STREAM_PUBLICATION SELECT s.url, p.publication_url FROM Propose p, TMP_USER_SUBSCRIPTIONS s WHERE p.stream_url = s.url
CREATE TEMPORARY TABLE TMP_USER_UNSHARED_STREAM SELECT streamPub.url FROM TMP_USER_STREAM_PUBLICATION streamPub WHERE streamPub.publication_url NOT IN (SELECT pub.publication_url FROM TMP_USER_SHARED_PUBLICATION pub)

SELECT userStream.url FROM TMP_USER_UNSHARED_STREAM userStream WHERE userStream.url NOT IN (SELECT s.url FROM TMP_FRIEND_SUBSCRIPTIONS s)
        
DROP TABLE TMP_USER_SUBSCRIPTIONS
DROP TABLE TMP_USER_SHARED_PUBLICATION
DROP TABLE TMP_FRIEND_USER
DROP TABLE TMP_FRIEND_SUBSCRIPTIONS
DROP TABLE TMP_USER_STREAM_PUBLICATION
DROP TABLE TMP_USER_UNSHARED_STREAM

--> Liste des publications commentées
--------------------------------------
<user>
SELECT c.publication_url FROM Comment c WHERE c.user_mail = <user>

--> Liste des publications partagées
--------------------------------------
<user>
SELECT DISTINCT p.* 
FROM Publication p, Propose prop, Subscribe sub, Stream s
WHERE p.url = prop.publication_url
and prop.stream_url = s.url
AND sub.user_mail = <user>.mail
AND s.url = <user>.personal_stream_url;

--> R4 : La liste des utilisateurs qui ont 
-- partagé au moins 3 publications que X a partagé
---------------------------------------------------
<userX>
SELECT DISTINCT u.*
FROM User u, Propose prop1, Propose prop2
WHERE prop1.stream_url = <user>.personal_stream_url
AND prop2.stream_url != <user>.personal_stream_url
AND prop2.stream_url = u.personal_stream_url
AND prop1.publication_url = prop2.publication_url
GROUP BY u.mail
HAVING count(*) >= 3;

--> La liste des flux auquel un utilisateur est inscrit avec le 
-- nombre de publications lues, le nombre de publications partagées, 
-- le pourcentage de ces dernières par rapport aux premières
--------------------------------------------------------------------
<userX>.mail
SELECT DISTINCT s.url AS Stream
FROM Stream s
    WHERE s.url IN (
        SELECT (sub.stream_url) 
        FROM Subscribe sub 
        WHERE sub.user_mail = <userX>.mail;
UNION
SELECT COUNT(*) FROM `Read` r WHERE r.user_mail = <userX>.mail
UNION
SELECT COUNT(*) FROM Propose p WHERE p.stream_url = <userX>.personal_stream_url
UNION
SELECT (COUNT(*) / (SELECT COUNT(*) FROM `Read` r WHERE r.user_mail = <userX>.mail))
FROM Propose p WHERE p.stream_url = <userX>.personal_stream_url;

--> Liste des publications des 30 derniers jours
-------------------------------------------------------
SELECT p.* FROM Publication p
WHERE DATE_SUB(CURDATE(),INTERVAL 30 DAY) <= p.date

--> R5 : La liste des flux auquel un utilisateur est inscrit avec le 
-- nombre de publications lues, le nombre de publications partagées, le 
-- pourcentage de ces dernières par rapport aux premières, cela pour les 
-- 30 derniers jours et ordonnée par le nombre de publications partagées
-------------------------------------------------------------------------

[TODO]

--> La liste des amis d’un utilisateur avec pour chacun 
-- le nombre de publications lues et le nombre d’amis
--------------------------------------------------------
<userX>
SELECT u.mail, COUNT(*) AS NbrOfFriends, COUNT(r.user_mail) AS NbrOfReadPublications
FROM Friendship f, User u, `Read` r
WHERE f.Status = TRUE 
AND (mail_sender = u.mail OR mail_receiver = u.mail) 
AND u.mail != <userX>.mail
AND u.mail = r.user_mail
GROUP BY u.mail;

--> R6 : La liste des amis d’un utilisateur avec pour chacun le nombre 
-- de publications lues par jour et le nombre d’amis, ordonnée par la 
-- moyenne des lectures par jour depuis la date d’inscription de cet ami
-------------------------------------------------------------------------

[TODO]

--> Liste des publications de l'utilisateur
--------------------------------------------
<user>
SELECT * FROM Publication pub WHERE pub.url IN (
    SELECT DISTINCT prop.publication_url Propose prop WHERE prop.stream_url IN (
        SELECT s.url FROM Stream s WHERE s.url IN (
            SELECT (sub.stream_url) FROM Subscribe sub WHERE sub.user_mail = <user>.mail)))
            
--> Savoir si une publication est lue par un utilisateur
---------------------------------------------------------
<user>, <publication>
SELECT COUNT(*) FROM `Read` WHERE user_mail = <user>.mail AND publication_url = <publication>.url


--> Les commentaires a afficher pour une publication et un utilisateur donne (on affiche que les commentaires qui appartiennent au flux d'un ami)
----------------------------------------------------------------------------
<user>, <publication>
SELECT *
FROM Comment com
WHERE
com.stream_url IN
    (SELECT sub.stream_url 
    FROM Subscribe sub 
    WHERE sub.user_mail = <user>.mail AND 
    sub.stream_url IN 
        (SELECT u.personal_stream_url FROM User u WHERE u.mail IN
            (SELECT f1.mail_sender FROM Friendship f1 WHERE f1.mail_receiver = <user>.mail AND f1.status = TRUE)
        OR u.mail IN
            (SELECT f2.mail_receiver FROM Friendship f2 WHERE f2.mail_sender = <user>.mail AND f2.status = TRUE)))
AND
com.publication_url = <publication>.url

--> Les flux a proposer a l'utilisateur lorsqu'il veut commenter une publication (il faut exclure les flux qu'il a deja commente)
---------------------------------------------------------------------------------
<user>, <publication>
SELECT *
FROM Stream s
WHERE
s.url IN 
    (SELECT u.personal_stream_url FROM User u, Propose prop WHERE (u.mail IN
        (SELECT f1.mail_sender FROM Friendship f1 WHERE f1.mail_receiver = <user>.mail AND f1.status = TRUE)
    OR u.mail IN
        (SELECT f2.mail_receiver FROM Friendship f2 WHERE f2.mail_sender = <user>.mail AND f2.status = TRUE))
    AND u.personal_stream_url = prop.stream_url AND prop.publication_url = <publication>.url)
AND
s.url NOT IN
    (SELECT com.stream_url FROM Comment com WHERE com.publication_url = <publication>.url AND com.user_mail = <user>.mail)