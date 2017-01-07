-- Dans la console, clic sur l'icone en haut à gauche > propriété > configuration > Taille de la fenetre pour augmenter en largeur !
-- La fleche du haut (au clavier) est un racourrci pour l'historique des requêtes.

CREATE DATABASE tic_entreprise; -- Créer une nouvelle base de données

SHOW DATABASES; -- permet de voir les bases de données

USE entreprise; -- Utiliser une base de données

DROP DATABASE entreprise ; -- Supprimer une base de données

DROP table employes ; -- Supprimer une table

TRUNCATE employes; -- Vider une table (plus aucune ligne après cette commande)

DESC employes; -- Observer la structure de la table ainsi que les champs (desc pour describe, c'est la description)

--#################### Requete de selection (affichage)
----------------------------------------------

-- Affichage complet
SELECT * FROM employes ; 
-- Affiche-moi * [toutes les colonnes] de [nom de la table]

----------------------------------------------

-- Quels sont les noms et prénoms des employés travaillant dans l’entreprise ?
SELECT nom, prenom FROM employes ;

----------------------------------------------

-- Quels sont les différents services occupés par les employés travaillant dans l’entreprise ?
SELECT service FROM employes; 

----------------------------------------------

-- DISTINCT
-- Affichage des services (sans doublons)
SELECT DISTINCT service FROM employes;

----------------------------------------------

-- Condition : WHERE
-- Affichage des employés du service informatique
SELECT nom, prenom, service FROM employes WHERE service = 'informatique';
-- Renvoie les nom, prénom et service des employés du service informatique.

----------------------------------------------

-- BETWEEN
-- Affichage des employés ayant été recrutés entre 2010 et aujourd'hui
SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2016-11-08' ;

SELECT CURDATE();

SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND CURDATE() ;

----------------------------------------------

-- LIKE : valeur approchante
-- Affichage des employés ayant un prénom commençant par la lettre s

SELECT prenom FROM employes WHERE prenom LIKE 's%';	 -- Je souhaite connaître le prénom des personnes commençant par la lettre « s » dans l’entreprise.
SELECT prenom FROM employes WHERE prenom LIKE '%s';  -- Je souhaite connaître le prénom des personnes de l’entreprise qui contient un trait d’union dans leur prénom ?
-----> LIKE est très utile dans la recherche d'appartement par Code Postal. 75 et non pas 75015.
SELECT prenom FROM employes WHERE prenom LIKE '%-%';

-- % : peut importe la suite...

-- ID -- nom 	-- code_postal
-- 1     Appart1	  75015
-- 2     Appart2	  75001
-- 3     Appart3	  75017

-- SELECT * FROM appartement WHERE code_postal = 75 ;
-- SELECT * FROM appartement WHERE code_postal LIKE '75%' ;

-- * Déssiner le [SCHEMA5_Like] *

----------------------------------------------

-- Affichage de tous les employés (sauf les informaticiens)
SELECT nom, prenom, service FROM employes WHERE service != 'informatique' ;
-- !=    ---->     'différent de'

----------------------------------------------

-- Affichage de tous les employés gagnant un salaire supérieur a 3000 €
SELECT nom, prenom, service, salaire FROM employes WHERE salaire > 3000;

----------------------------------------------

-- ORDER BY
-- Affichage des employés dans l'ordre alphabétique
SELECT prenom FROM employes ORDER BY prenom ASC ;
SELECT prenom FROM employes ORDER BY prenom DESC ;
SELECT prenom, salaire FROM employes ORDER BY salaire DESC, prenom ASC ;
-- ORDER BY permet d'effectuer un classement.
-- ASC : Ascendant - croissant
-- DESC : Descendant - décroissant

----------------------------------------------

-- LIMIT
-- Affichage des employés 3 par 3
SELECT prenom FROM employes ORDER BY prenom ASC LIMIT 0,3 ;
SELECT prenom FROM employes ORDER BY prenom ASC LIMIT 3,3 ;
SELECT prenom FROM employes ORDER BY prenom ASC LIMIT 6,3 ;
-- LIMIT X,Y
-- X : offset (à partir de la ligne combien ?)
-- Y : combien de lignes

----------------------------------------------

-- Affichage des employés avec un salaire annuel
SELECT prenom, salaire*12 FROM employes ;
SELECT prenom, salaire*12 AS 'salaire annuel' FROM employes ;
-- AS : Alias

----------------------------------------------

-- SUM
-- Affichage de la "masse salarial" sur 12 mois
SELECT SUM(salaire*12) FROM employes ;
-- SUM : Somme

----------------------------------------------

-- AVG
-- Affichage du salaire moyen.
SELECT AVG(salaire) FROM employes ;
-- AVG : moyenne.
-- ROUND
SELECT ROUND(AVG(salaire)) FROM employes ;
-- ROUND permet d'arrondir. ROUND(nombre, nb_chiffre_apres_virgue)

----------------------------------------------

-- COUNT
-- Affichage du nombre de femme(s) dans l'entreprise
SELECT COUNT(*) FROM employes WHERE sexe = 'f';
-- COUNT permet de compter

----------------------------------------------

-- MIN
-- Affichage du salaire minimum/maximum
SELECT MIN(salaire) FROM employes ;
SELECT MAX(salaire) FROM employes ;
 -- Je souhaite savoir quel est le salaire le plus bas attribué dans l'entreprise




-- Qui gagne le salaire minimum ?
SELECT prenom,salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
-- Requête imbriquée
----------------------------------------------



-- IN
SELECT prenom,service FROM employes WHERE service IN ('comptabilite', 'informatique'); 
-- Affichage des employés travaillant dans le service comptabilité et le service informatique.
SELECT nom, prenom, service FROM employes WHERE service IN('comptabilite' ,'informatique');
-- IN permet d'inclure plusieurs valeurs
-- = permet d'inclure 1 seule valeur

----------------------------------------------

-- NOT IN
SELECT prenom,service FROM employes WHERE service NOT IN ('comptabilite', 'informatique');
-- Affichage des employés ne travaillant pas dans le service comptabilité et le service informatique.
SELECT nom, prenom, service FROM employes WHERE service NOT IN('comptabilite' ,'informatique');
SELECT prenom,service FROM employes WHERE service NOT IN ('comptabilite', 'informatique') ORDER BY service ASC; 
-- NOT IN permet d'exclure plusieurs valeurs.
-- != permet d'exclure 1 seule valeur.

----------------------------------------------

-- Affichage des commerciaux gagnant un salaire inférieur ou égal à 2000 €
SELECT nom, prenom, salaire, service FROM employes WHERE service = 'commercial' AND salaire <= 2000 ;

----------------------------------------------

SELECT prenom, nom, service, salaire FROM employes WHERE service='production' AND salaire= 1900 OR salaire=2300 ;

----------------------------------------------

-- GROUP BY
-- Affichage du nombre d'employé(s) par service
SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service;

SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service HAVING COUNT(*) > 2;
-- GROUP BY permet d'effectuer des regroupements.

-- Cas particulier : on utilise HAVING dans le cas d'un GROUP BY pour appliquer une condition.

----------------------------------------------

-- Requete d'Insertion
INSERT INTO employes VALUES (809, 'alexis', 'richy', 'm', 'informatique', '2011-12-28', 1800);
-- Insertion d'une nouvelle ligne. NULL est emplacé pour la colonne id_employes afin que SQL gère la clé primaire.

INSERT INTO employes (prenom, nom, sexe, service, date_embauche, salaire) VALUES ('alexis', 'richy', 'm', 'informatique', '2011-12-28', 1800);
-- Insertion d'une nouvelle ligne en spécifiant le nom des champs à remplir.

----------------------------------------------

-- Requête de modification
UPDATE employes SET salaire = 1391 WHERE id_employes = 699 ;
-- Modifie le salaire à 1391 pour l'employé dont l'id_employes est 699.

UPDATE employes SET salaire = 1392, service ='informatique' WHERE id_employes = 699 ;
-- Modifie le salaire à 1391 et le service à 'informatique' pour l'employé dont l'id_employes est 699.

----------------------------------------------

-- Requête de suppression
DELETE FROM employes WHERE id_employes = 388 ;
-- SUPPRIME la ligne où l'id_employes est égal à 388;

DELETE FROM employes WHERE nom='lagarde';
-- SUPPRIME la ligne où le nom est égal à 'lagarde';




-------------------- EXERCICES ---------------------


-- 1 -- Afficher la profession de l'employé 547.
	SELECT service FROM employes WHERE id_employes=547;
		
-- 2 -- Afficher la date d'embauche d'Amandine.
	SELECT date_embauche FROM employes WHERE prenom='Amandine';

-- 3 -- Afficher le nom de famille de Guillaume
	SELECT nom FROM employes WHERE prenom = 'Guillaume';
		
-- 4 -- Afficher le nombre de personne ayant un n° id_employes commençant par le chiffre 5.
	SELECT COUNT(*) FROM employes WHERE id_employes LIKE '5%';
		
-- 5 -- Afficher le nombre de commerciaux.
	SELECT COUNT(*) as 'nombre' FROM employes WHERE service='commercial';
		
-- 6 -- Afficher le salaire moyen des informaticiens (+arrondie).
	SELECT round(AVG( salaire )) FROM employes WHERE service = 'informatique';
		
-- 7 -- Afficher les 5 premiers employés après avoir classer leur nom de famille par ordre alphabétique.
	SELECT * FROM employes ORDER BY nom ASC LIMIT 0,5 ;
		
-- 8 -- Afficher le coût des commerciaux sur 1 année.
	SELECT SUM(salaire*12) FROM employes WHERE service='commercial';
		
-- 9 -- Afficher le salaire moyen par service. (service + salaire moyen)
	SELECT service, round(AVG( salaire )) FROM employes GROUP BY service;
		
-- 10 -- Afficher le nombre de recrutement sur l'année 2010 (+alias).
	SELECT COUNT(*) as 'nb de recrutement' FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2010-12-31';
	SELECT COUNT(*) as 'nb de recrutement' FROM employes WHERE date_embauche LIKE '2010%';
	SELECT COUNT(*) as 'nb de recrutement' FROM employes WHERE date_embauche >= '2010-01-01' AND date_embauche <= '2010-12-31';
		
-- 11 -- Afficher le salaire moyen appliqué lors des recrutements sur la période allant de 2005 a 2007
	SELECT AVG(salaire) FROM employes WHERE date_embauche BETWEEN '2005-01-01' AND '2007-12-31'

-- 12 -- Afficher le nombre de service différent
	SELECT COUNT(DISTINCT(service)) FROM employes ;

-- 13 -- Afficher tous les employés (sauf ceux du service production et secrétariat)
	SELECT nom, prenom FROM employes WHERE service NOT IN('production', 'secretariat');

-- 14 -- Afficher conjoitement le nombre d'homme et de femme dans l'entreprise
	SELECT sexe, COUNT(*) FROM employes GROUP BY sexe ;

-- 15 -- Afficher les commerciaux ayant été recrutés avant 2005 de sexe masculin et gagnant un salaire supérieur a 2500 €
	SELECT nom, prenom FROM employes WHERE service = 'commercial' AND sexe = 'm' AND date_embauche < '2005-01-01' AND salaire > 2500 ;

-- 16 -- Qui a été embauché en dernier
	SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 0,1 ;
	SELECT * FROM employes WHERE date_embauche = (SELECT MAX(date_embauche) FROM employes);

-- 17 -- Afficher les informations sur l'employé du service commercial gagnant le salaire le plus élevé
	SELECT * FROM employes WHERE service = 'commercial' AND salaire = (SELECT MAX(salaire) FROM employes WHERE service = 'commercial');

-- 18 -- Afficher le prénom du comptable gagnant le meilleur salaire
	SELECT prenom FROM employes WHERE service = 'comptabilite' AND salaire = (SELECT MAX(salaire) FROM employes WHERE service = 'comptabilite');

-- 19 -- Afficher le prénom de l'informaticien ayant été recruté en premier
	SELECT * FROM employes WHERE service = 'informatique' AND date_embauche = (SELECT MIN(date_embauche) FROM employes WHERE service = 'informatique');

-- 20 -- Augmenter chaque employé de 100 €
	UPDATE employes SET salaire = salaire+100 ;

-- 21 -- Supprimer les employés du service secrétariat
	DELETE FROM employes WHERE service = 'secretariat';