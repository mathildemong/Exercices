-- Récupérer l'ID des livres qui n'ont pas été rendus
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;

-- Récupérer le titre des livres qui n'ont pas été rendus.
SELECT titre FROM livre WHERE id_livre IN 
	(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);

-- Récupérer l'ID des livres que Chloé a emprunté à la bibliothèque
SELECT id_livre FROM emprunt WHERE id_abonne =
	(SELECT id_abonne FROM abonne WHERE prenom = 'Chloe');

-- EXO : Récupérer les prénoms des abonnés ayant emprunté un livre le 19/12/2014 (dix neuf décembre deux-mille-quatorze)
SELECT prenom FROM abonne WHERE id_abonne IN
(SELECT id_abonne FROM emprunt WHERE date_sortie = '2014-12-19');

-- IS, =, IN
-- IS est utilisé pour comparer à la valeur NULL.
 WHERE nom_colonne IS NULL

-- '=' est utilisé pour comparer à UNE SEULE valeur.
	WHERE nom_colonne = 2

-- IN est utilisé pour comparer à PLUSIEURS valeurs.
	WHERE nom_colonne IN (2, 3, 4, 5)

COMPARAISON = 2 < 3;
COMPARAISON = TRUE;

COMPARAISON = 18 < 2 AND 2 < 3;
COMPARAISON = FALSE AND TRUE;
COMPARAISON = FALSE;

COMPARAISON = 2 < 3 OR 18 < 2;
COMPARAISON = TRUE OR FALSE;
COMPARAISON = TRUE;


COMPARAISON = TRUE AND (FALSE OR TRUE);
COMPARAISON = TRUE AND TRUE;
COMPARAISON = TRUE;

SELECT nom, prenom FROM employes WHERE salaire = 2000 OR salaire = 1800;

-- COMBIEN GUILLAUME A FAIT D'EMPRUNTS
SELECT COUNT(*) AS 'Nombre d\'emprunts' FROM emprunt WHERE id_abonne = 
	(SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');

-- Afficher la liste des abonnés ayant déjà emprunté un livre d'Alphonse DAUDET.
SELECT les prénoms depuis la table abonne où l'abonné' 
a emprunté un livre
écrit par Alphonse DAUDET.
SELECT prenom FROM abonne WHERE id_abonne
	IN (SELECT id_abonne FROM emprunt
		WHERE id_livre = (SELECT id_livre FROM livre WHERE auteur = 'ALPHONSE DAUDET'));

	SELECT prenom FROM abonne WHERE id_abonne IN (4);
	SELECT id_abonne FROM emprunt WHERE id_livre = 103;
	SELECT id_livre FROM livre WHERE auteur = 'ALPHONSE DAUDET';


-------------- JOINTURE --------------
-- Afficher les dates de sortie et de rendu pour l'abonné "Guillaume".
-- Jointure : Utiliser une seule requête pour viser plusieurs tables.
SELECT a.prenom, e.date_sortie, e.date_rendu
FROM abonne a, emprunt e
WHERE a.id_abonne = e.id_abonne
AND a.prenom = 'Guillaume';

SELECT date_sortie, date_rendu FROM emprunt WHERE id_abonne = (SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');

-- 1er ligne --> ce que je souhaite afficher
-- 2eme ligne --> de quelles table cela provient (de quelle table vais-je avoir besoin) ?
-- 3eme ligne --> condition. Quel est le champ en commun dans les deux tables qui me permet de faire la jointure ?



-- Afficher les dates de sortie et de rendu pour les livres d'Alphone DAUDET
SELECT l.auteur, e.date_sortie, e.date_rendu
FROM livre l, emprunt e
WHERE l.id_livre = e.id_livre
AND l.auteur = 'ALPHONSE DAUDET';

-- Qui a emprunté le livre 'Une vie' sur l'année 2014 
-- SELECT 'prenom dans la table abonne', 'titre dans la table livre', 'date_sortie dans la table emprunt'
-- FROM abonne, livre, emprunt
-- WHERE Jointure entre livre et emprunt
-- AND Jointure entre abonne et emprunt
-- date_sortie -> 2014
-- Titre du livre -> 'Une vie'

SELECT a.prenom, l.titre, e.date_sortie
FROM abonne a, emprunt e, livre l
WHERE l.id_livre = e.id_livre
AND a.id_abonne = e.id_abonne
AND e.date_sortie BETWEEN '2014-01-01' AND '2014-12-31'
AND l.titre = 'Une vie';



-- Afficher le nombre de livres empruntés par chaque abonné
SELECT abonne.prenom, COUNT(emprunt.id_livre) AS 'Nb Livres'
FROM abonne, emprunt
WHERE abonne.id_abonne = emprunt.id_abonne
GROUP BY abonne.id_abonne;

-- Afficher le nombre de livres à rendre pour chaque abonné
SELECT COUNT(e.id_livre) AS 'Livres à rendre', a.prenom
FROM emprunt e, abonne a
WHERE a.id_abonne = e.id_abonne
AND e.date_rendu IS NULL
GROUP BY a.prenom;


-- Qui a emprunté quel livre et quand ?
SELECT a.prenom, l.titre, e.date_sortie
FROM livre l, abonne a, emprunt e
WHERE l.id_livre = e.id_livre
AND a.id_abonne = e.id_abonne
ORDER BY a.prenom ASC;




------------------ FONCTIONS PREDEFINIES SQL ------------------
SELECT DATABASE(); --Renvoie la BDD actuelle
SELECT VERSION(); -- Renvoie la version de SQL
SELECT LAST_INSERT_ID(); -- Renvoie l'ID de la dernière ligne insérée
SELECT ADDDATE('1998-02-01', 31); -- Rajoute X jours à une date
SELECT CURDATE(); --Renvoie le jour actuel
SELECT CURTIME(); --Renvoie l'heure qu'il est
SELECT DATE_FORMAT('2012-10-03 22:23:00', '%d/%m/%Y - %H:%i:%s'); --Permet de formater la date
SELECT DAYNAME('1982-12-29'); -- Renvoie le nom du jour de la semaine
SELECT DAYOFYEAR(CURDATE()); -- Renvoyer le numéro du jour de l'année
SELECT LENGTH('BABARRRREZJHKLDUJIOR'); -- Renvoie le nombre de lettre dans le mot
SELECT PASSWORD('nutella');
SELECT LOCATE('w', 'aujourd\'hui'); -- Renvoie l'emplacement de la première chaine de charactère dans la deuxième
--Renvoie 0 si elle ne trouve rien
SELECT CONCAT('bonjour ', 'aujourd\'hui ', 'j\ai mangé'); -- Met à la suite des chaines de charactère.
SELECT REPLACE('www.wikipedia.fr', 'www', 'WWW'); -- Remplace une chaine de charactère par une autre.


------------------ FONCTIONS PERSONNALISEE SQL ------------------
-- TVA(2000) --> 2110

CREATE FUNCTION calcul_tva(prix INT) RETURNS FLOAT
COMMENT 'FONCTION CALCULANT LA TVA'
READS SQL DATA
	BEGIN
		RETURN prix * 2;
	END $
DELIMITER;


-- Afficher le titre et l'auteur des livres qui ont été empruntés 2 fois ou plus







------------------------------------------------------------------
SELECT abonne.prenom, COUNT(emprunt.id_livre) AS 'Nb Livres'
FROM abonne, emprunt
WHERE abonne.id_abonne = emprunt.id_abonne
GROUP BY abonne.id_abonne
HAVING COUNT(emprunt.id_livre) >= 2;



SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service HAVING COUNT(*) > 2;


