Creation des tables
--------------------

CREATE TABLE User (mail VARCHAR(100) NOT NULL, surname VARCHAR(40) NOT NULL, password VARCHAR(40), avatar VARCHAR(100), country VARCHAR(40), city VARCHAR(40), biography TEXT, date DATE, personal_stream_url VARCHAR(100) NOT NULL, PRIMARY KEY(mail))

CREATE TABLE Stream (url VARCHAR(100) NOT NULL, name VARCHAR(40) NOT NULL, webLink VARCHAR (40), description TEXT, PRIMARY KEY(url))

CREATE TABLE Publication (url VARCHAR(100) NOT NULL, title VARCHAR(40) NOT NULL, date DATE, description TEXT, `read` BOOLEAN, PRIMARY KEY(url))

CREATE TABLE Friendship (mail_sender VARCHAR(100) NOT NULL, mail_receiver VARCHAR(100) NOT NULL, status BOOLEAN, date DATE, PRIMARY KEY(mail_sender, mail_receiver))

CREATE TABLE Comment (user_mail VARCHAR(100) NOT NULL, publication_url VARCHAR(100) NOT NULL, stream_url VARCHAR(100), content TEXT, date DATE, PRIMARY KEY(user_mail, publication_url, stream_url))

CREATE TABLE `Read` (user_mail VARCHAR(100) NOT NULL, publication_url VARCHAR(100) NOT NULL, date DATE, PRIMARY KEY(user_mail, publication_url))

CREATE TABLE Subscribe (user_mail VARCHAR(100) NOT NULL, stream_url VARCHAR(100) NOT NULL, date DATE, PRIMARY KEY(user_mail, stream_url))

CREATE TABLE Propose (stream_url VARCHAR(100) NOT NULL, user_mail VARCHAR(100) NOT NULL, PRIMARY KEY(stream_url, user_mail))

Insertion des donnees de test
------------------------------

--> Utilisateurs
-----------------
INSERT INTO User (mail, surname, password, avatar, country, city, biography, personal_stream_url) VALUES ("arosette@ulb.ac.be", "arosette", "arosette", "~/Images/arosette.jpg", "Belgique", "Theux", "Je suis un etudiant qui etudie à l'ulb et vit à Theux", "http://personal_stream/arosette@ulb.ac.be")

INSERT INTO User (mail, surname, password, avatar, country, city, biography, personal_stream_url) VALUES ("nomer@ulb.ac.be", "nomer", "nomer", "~/Images/nomer.jpg", "Belgique", "Bruxelles", "Je suis un etudiant qui etudie à l'ulb et vit à Bruxelles", "http://personal_stream/nomer@ulb.ac.be")

INSERT INTO User (mail, surname, password, avatar, country, city, biography, personal_stream_url) VALUES ("pveranneman@ulb.ac.be", "pveranneman", "pveranneman", "~/Images/pveranneman.jpg", "Bresil", "Rio", "Je suis un etudiant qui etudie à l'ulb et vit à Rio", "http://personal_stream/pveranneman@ulb.ac.be")

INSERT INTO User (mail, surname, password, avatar, country, city, biography, personal_stream_url) VALUES ("lpostula@ulb.ac.be", "lpostula", "lpostula", "~/Images/lpostula.jpg", "Belgique", "Liege", "Je suis un etudiant qui etudie à l'ulb et vit à Liege", "http://personal_stream/lpostula@ulb.ac.be")

INSERT INTO User (mail, surname, password, avatar, country, city, biography, personal_stream_url) VALUES ("sbeyen@ulb.ac.be", "sbeyen", "sbeyen", "~/Images/sbeyen.jpg", "Allemagne", "Berlin", "Je suis un etudiant qui etudie à l'ulb et vit à Berlin", "http://personal_stream/sbeyen@ulb.ac.be")

INSERT INTO User (mail, surname, password, avatar, country, city, biography, personal_stream_url) VALUES ("spicard@ulb.ac.be", "spicard", "spicard", "~/Images/spicard.jpg", "Belgique", "Ostende", "Je suis un etudiant qui etudie à l'ulb et vit à Ostende", "http://personal_stream/spicard@ulb.ac.be")

--> Flux
-----------------
INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/arosette@ulb.ac.be", "Flux personnel de arosette", "http://personal_stream", "Voici le flux personnel de arosette, c'est ici qu'il partage les publications qu'il aime")

INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/nomer@ulb.ac.be", "Flux personnel de nomer", "http://personal_stream", "Voici le flux personnel de nomer, c'est ici qu'il partage les publications qu'il aime")

INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/pveranneman@ulb.ac.be", "Flux personnel de pveranneman", "http://personal_stream", "Voici le flux personnel de pveranneman, c'est ici qu'il partage les publications qu'il aime")

INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/lpostula@ulb.ac.be", "Flux personnel de lpostula", "http://personal_stream", "Voici le flux personnel de lpostula, c'est ici qu'il partage les publications qu'il aime")

INSERT INTO Stream (url, name, webLink, description) VALUES ("http://personal_stream/spicard@ulb.ac.be", "Flux personnel de spicard", "http://personal_stream", "Voici le flux personnel de spicard, c'est ici qu'il partage les publications qu'il aime")

INSERT INTO Stream (url, name, webLink, description) VALUES ("http://www.jeuxvideo.com", "Flux de jeuxvideo", "http://jeuxvideo", "Voici le flux de jeux video, vous pouvez en suivre l'actualité")

INSERT INTO Stream (url, name, webLink, description) VALUES ("http://www.youtube.com", "Flux de youtube", "http://youtube", "Voici le flux de youtube, vous pouvez en suivre l'actualité")

INSERT INTO Stream (url, name, webLink, description) VALUES ("http://www.facebook.com", "Flux de facebook", "http://facebook", "Voici le flux de facebook, vous pouvez en suivre l'actualité")

--> Amitiés
-----------------

INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("arosette@ulb.ac.be", "nomer@ulb.ac.be", TRUE, '2011-09-14')

INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("nomer@ulb.ac.be", "pveranneman@ulb.ac.be", TRUE, '2011-09-24')

INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("lpostula@ulb.ac.be", "nomer@ulb.ac.be", FALSE, '2011-09-28')

INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("pveranneman@ulb.ac.be", "lpostula@ulb.ac.be", TRUE, '2012-09-21')

INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("arosette@ulb.ac.be", "pveranneman@ulb.ac.be", FALSE, '2013-10-14')

INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("nomer@ulb.ac.be", "spicard@ulb.ac.be", TRUE, '2013-10-14')

INSERT INTO Friendship (mail_sender, mail_receiver, status, date) VALUES ("sbeyen@ulb.ac.be", "spicard@ulb.ac.be", FALSE, '2011-12-14')

--> Souscriptions
-----------------

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://www.jeuxvideo.com", '2008-09-21');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://www.youtube.com", '2006-09-23');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://www.facebook.com", '2009-09-22');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("nomer@ulb.ac.be", "http://personal_stream/arosette@ulb.ac.be", '2012-11-21');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("sbeyen@ulb.ac.be", "http://www.youtube.com", '2007-01-22');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("sbeyen@ulb.ac.be", "http://personal_stream/arosette@ulb.ac.be", '2001-02-22');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://www.jeuxvideo.com", '2000-01-21');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://www.youtube.com", '2002-02-23');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://personal_stream/lpostula@ulb.ac.be", '2001-09-22');

INSERT INTO Subscribe (user_mail, stream_url, date) VALUES ("pveranneman@ulb.ac.be", "http://personal_stream/spicard@ulb.ac.be", '2006-09-22');

Requetes de selection
----------------------

--> Liste tous les amis de l'utilisateur
-----------------------------------------
<user>
SELECT * FROM Friendship f WHERE f.Status = TRUE AND (mail_sender = <user> OR mail_receiver = <user>)

--> Liste le nombre d'amis d'un utilisateur
-----------------------------------------
<user>
SELECT COUNT(*) FROM Friendship f WHERE f.Status = TRUE AND (mail_sender = <user> OR mail_receiver = <user>)

--> Liste toutes les amitiés existantes 
-----------------------------------------
SELECT DISTINCT f.mail_sender, f.mail_receiver FROM User u, Friendship f 
WHERE f.Status = TRUE AND (mail_sender = u.mail OR mail_receiver = u.mail)

--> R1 Liste tous les utilisateurs qui ont au plus 2 amis
-- (et ceux qui n'ont pas d'amis ne sont pas comptabilisés)
------------------------------------------------------------
SELECT u.surname, count(*)
FROM User u, Friendship f 
WHERE (f.Status = TRUE AND (mail_sender = u.mail OR mail_receiver = u.mail))
GROUP BY u.mail
HAVING count(*) < 3

--> Liste tous les flux de l'utilisateur
-----------------------------------------
<user>
SELECT * FROM Stream s WHERE s.url IN (
    SELECT (sub.stream_url) FROM Subscribe sub WHERE sub.user_mail = <user>)
    
--> R2 : La liste des flux auxquels a souscrit au moins un 
-- utilisateur qui a souscrit à au moins deux flux auxquel X a souscrit
-------------------------------------------------------------------------