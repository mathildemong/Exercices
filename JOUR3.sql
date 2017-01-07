--------- VIEWS et TABLES TEMPORAIRES ---------
-- Les vues permettent de sauvegarder le résultat 
-- d'une requête sur une ou plusieurs tables de la même BDD.
-- Elles se comportent comme une table (nous pouvons faire des requêtes sur les vues)
-- Une vue possède les mêmes données que la table employés d'origine.

CREATE VIEW vue_emprunt AS
SELECT a.prenom, l.titre, e.date_sortie
FROM livre l, abonne a, emprunt e
WHERE l.id_livre = e.id_livre
AND a.id_abonne = e.id_abonne;

DROP VIEW vue_emprunt;


---- TABLES TEMPORAIRES ----
-- Même choses que les vues sauf qu'elles existent du début à la fin de la session SQL.
-- Elles sont supprimées automatiquement à la déconnexion de la BDD;

-- Utiles pour le panier, par exemple.
-- Créer une table temporaire pour le pannier de votre client --> Faire des requêtes de tri dessus. Plus léger.

CREATE TEMPORARY TABLE temp_qqq
SELECT a.prenom, l.titre, e.date_sortie
FROM livre l, abonne a, emprunt e
WHERE l.id_livre = e.id_livre
AND a.id_abonne = e.id_abonne
ORDER BY a.prenom ASC;


-- Utiliser les vues lors que vous appelez régulièrement les mêmes données pour des traitements différents.
-- Créer des tables temporaires quand vous faites régulièrement les mêmes traitements sur des données différentes.

-- PDF MERISE : ftp://ftp-developpez.com/cyril-gruau/ConceptionBD.pdf


-- BASE DE DONNEES TAXI


Quels conducteurs conduisent quels véhicules.

-- Sélectionner quels chauffeurs conduisent quelles voitures.
SELECT c.prenom, c.nom, v.marque, v.modele
FROM conducteurs c, vehicules v, association_conducteurs_vehicules acv
WHERE c.id_conducteur = acv.id_conducteur
AND v.id_vehicule = acv.id_vehicule;
-- POUR CHAQUE REQUÊTE --> prénom, nom, marque, modele



-- Sélectionner la couleur DES voitures conduites par Larry
SELECT c.prenom, c.nom, v.marque, v.modele
FROM conducteurs c, vehicules v, association_conducteurs_vehicules acv
WHERE c.id_conducteur = acv.id_conducteur
AND v.id_vehicule = acv.id_vehicule
AND c.prenom = 'Larry';


-- Sélectionner la marque et le modèle DES voitures conduites par Jerry, Bart et Jean
SELECT c.prenom, c.nom, v.marque, v.modele
FROM conducteurs c, vehicules v, association_conducteurs_vehicules acv
WHERE c.id_conducteur = acv.id_conducteur
AND v.id_vehicule = acv.id_vehicule
AND c.prenom IN ('Jerry', 'Bart', 'Jean');


-- Sélectionner Les chauffeurs qui conduisent des voitures
-- dont la marque est présente 2 fois dans le parc de véhicules.
|  prenom	| nom	| marque
|			|		|
|			|		|
|			|		|

SELECT c.prenom, c.nom, v.immatriculation
FROM vehicules v, conducteurs c, association_conducteurs_vehicules acv
WHERE c.id_conducteur = acv.id_conducteur
AND v.id_vehicule = acv.id_vehicule
AND v.marque IN
(SELECT marque FROM vehicules GROUP BY marque HAVING COUNT(marque) >= 2)
ORDER BY v.immatriculation;

-- Afficher la couleur des voitures dont la marque
-- est présente au moins 2 fois dans mon parc de véhicules.
SELECT couleur, marque, modele FROM vehicules WHERE marque IN
(SELECT marque FROM vehicules GROUP BY marque HAVING COUNT(marque) >= 2)
ORDER BY marque;



-- Créer la vue
CREATE VIEW vue_VTC AS
SELECT c.prenom, c.nom, v.marque, v.modele, v.couleur
FROM conducteurs c, vehicules v, association_conducteurs_vehicules acv
WHERE c.id_conducteur = acv.id_conducteur
AND v.id_vehicule = acv.id_vehicule;



-- Sélectionner la couleur DES voitures conduites par Larry


-- Sélectionner la marque et le modèle DES voitures conduites par Jerry, Bart et Jean


-- Sélectionner Les chauffeurs qui conduisent des voitures
-- dont la marque est présente 2 fois dans le parc de véhicules.


-- Afficher la couleur des voitures dont la marque
-- est présente au moins 2 fois dans mon parc de véhicules.






-- Afficher les dates de sortie et de rendu pour les livres d'Alphone DAUDET
-- Qui a emprunté le livre 'Une vie' sur l'année 2014 


-- Afficher le nombre de livres empruntés par chaque abonné


-- Afficher le nombre de livres à rendre pour chaque abonné


-- Qui a emprunté quel livre et quand ?