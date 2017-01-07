-- REQUETE SUPPRESSION
DELETE FROM employes WHERE prenom = 'Nicolas';


-- 1 -- Afficher la profession de l'employé 547.
		SELECT service FROM employes WHERE id_employes = 547;
-- 2 -- Afficher la date d'embauche d'Amandine.
		SELECT date_embauche FROM employes
		WHERE prenom = 'Amandine';
-- 3 -- Afficher le nom de famille de Guillaume
		SELECT nom FROM employes WHERE prenom = 'guillaume';
-- 4 -- Afficher le nombre de personne ayant un n° id_employes commençant par le chiffre 5.
SELECT COUNT(*)
FROM employes
WHERE id_employes LIKE '5%';

-- 5 -- Afficher le nombre de personnes du service commercial.
		SELECT COUNT(*) FROM employes WHERE service = 'commercial';
		-- Renvoie le nombre de ligne qui répondent à la condition.
		
-- 6 -- Afficher le salaire moyen des informaticiens (+arrondie).
	SELECT ROUND(AVG(salaire), 2) 
	FROM employes 
	WHERE service = 'informatique';


		
-- 7 -- Afficher les 5 premiers employés après avoir classer leur nom de famille par ordre alphabétique.
	SELECT * FROM employes ORDER BY nom ASC LIMIT 5;

		
-- 8 -- Afficher le coût des commerciaux sur 1 année.
		SELECT SUM(salaire*12) FROM employes WHERE service = 'commercial';
		
		STOP
-- 9 -- Afficher le salaire moyen par service. (service + salaire moyen)
		SELECT service, ROUND(AVG(salaire)) AS 'salaire moyen'
		FROM employes
		GROUP BY service;
		
		
		
-- 10 -- Afficher le nombre de recrutement sur l'année 2010 (+alias).
	SELECT COUNT(*)
	FROM employes
	WHERE date_embauche 
	BETWEEN '2010-01-01' AND '2010-12-31';
		
-- 11 -- Afficher le salaire moyen appliqué lors des recrutements sur la période allant de 2005 a 2007

	SELECT ROUND(AVG(salaire), 2) AS 'blablabla'
	FROM employes
	WHERE date_embauche
	BETWEEN '2005-01-01' AND '2007-12-31';
	

-- 12 -- Afficher le nombre de services
SELECT COUNT(DISTINCT(service)) FROM employes;


-- 13 -- Afficher tous les employés (sauf ceux du service production et secrétariat)
	SELECT * FROM employes
	WHERE service
	NOT IN ('production', 'secrétariat');

-- 14 -- Afficher conjoitement le nombre d'homme et de femme dans l'entreprise avec leur salaire
	SELECT COUNT(sexe), sexe, AVG(salaire) FROM employes
	GROUP BY sexe;

-- 15 -- Afficher les commerciaux ayant été recrutés avant 2005 de sexe masculin et gagnant un salaire supérieur a 2500 €
	SELECT prenom, nom, date_embauche, salaire, service FROM employes
	WHERE service = 'commercial'
	AND date_embauche < '2005-01-01'
	AND sexe = 'm'
	AND salaire > 2500;


-- 16 -- Qui a été embauché en dernier
	SELECT nom, prenom, date_embauche
	FROM employes
	WHERE date_embauche = (SELECT MAX(date_embauche) FROM employes);
	
	SELECT nom, prenom, date_embauche
	FROM employes
	ORDER BY date_embauche DESC
	LIMIT 1;
-- 17 -- Afficher les informations sur l'employé du service commercial gagnant le salaire le plus élevé
	SELECT * FROM employes 
	WHERE service = 'commercial'
	AND salaire = (SELECT MAX(salaire) FROM employes WHERE service = 'commercial');
	
	SELECT * FROM employes
	WHERE service = 'commercial'
	ORDER BY salaire DESC
	LIMIT 1;

-- 18 -- Afficher le prénom du comptable gagnant le meilleur salaire
	SELECT * FROM employes 
	WHERE service = 'comptabilite'
	AND salaire = (SELECT MAX(salaire) FROM employes WHERE service = 'comptabilite');

	SELECT prenom FROM employes
	WHERE service = 'comptabilite'
	ORDER BY salaire DESC
	LIMIT 1;


-- 19 -- Afficher le prénom de l'informaticien ayant été recruté en premier

	SELECT prenom FROM employes
	WHERE service = 'informatique'
	ORDER BY date_embauche ASC
	LIMIT 1;
	
-- 20 -- Augmenter tout le monde de 100€
	UPDATE employes
	SET salaire = salaire - 1100
	WHERE sexe = 'f';
	
-- 21 -- SUPPRESSION
	DELETE FROM employes
	WHERE service = 'secretariat';


SELECT prenom, nom
FROM employes
WHERE service = 'commercial'
AND salaire <= 2000;



SELECT prenom, nom, service, salaire FROM employes WHERE service = 'commercial' AND salaire <= 2000;




SELECT prenom, nom, service FROM employes WHERE service ('comptabilite', 'informatique');















INSERT INTO employes VALUES (NULL, 'Nicolas', 'Coulange', 'm', 'informatique', '2016-06-01', 10000);


-- MISE A JOUR
UPDATE employes SET salaire = 1200 WHERE id_employes = 990;

UPDATE employes SET salaire = 1200, service = 'assistant'
WHERE id_employes = 350;

INSERT INTO employes (prenom, nom, sexe, service, date_embauche, salaire) VALUES
('Nicolas', 'Coulange', 'm', 'informatique', '2016-06-01', 10000),
('Richard', 'Duval', 'm', 'informatique', '2016-07-01', 5000);










