<?php
class Livre
{
	protected $id_livre;
	protected $titre;
	protected $auteur;

	public function __construct($titre, $auteur, $id_livre = null)
	{
		// Lors de l'instanciation de la classe Livre en objet, deux ou trois arguments sont passés. Les deux premiers sont le titre et l'auteur. Je renseigne leur valeur avec les setteurs de ces propriétés. Le troisième, facultatif, est l'id du livre en BDD. Il est par défaut égal à null (pas de valeur).
		$this->setTitre($titre);
		$this->setAuteur($auteur);
		$this->setId_livre($id_livre);
	}

	public function setTitre(string $titre)
	{
		$this->titre = $titre;
	}
	public function setAuteur(string $auteur)
	{
		$this->auteur = $auteur;
	}
	public function setId_livre($id_livre)
	{
		if(is_int($id_livre) || is_null($id_livre) || true)
		{
			$this->id_livre = $id_livre;
		} else {
			throw new Exception('Null ou Integer attendu pour id_livre');
		}
		
	}

	public function getTitre()
	{
		return $this->titre;
	}

	public function getAuteur()
	{
		return $this->auteur;
	}

	public function getId_livre()
	{
		return $this->id_livre;
	}


	public static function find($id)
	{
		// Requête via PDO
		Global $pdo;
		$result = $pdo->query("SELECT * FROM livre WHERE id_livre = $id");

		// Traitement du résultat de la requête
		$ligne = $result->fetch(PDO::FETCH_ASSOC);

		// Instanciation d'un objet Livre avec les données reçues depuis MySQL.
		$livre = new Livre($ligne['titre'], $ligne['auteur'], $ligne['id_livre']);

		// Renvoie l'objet livre instancié
		return $livre;
	}


	public static function all()
	{
		// Requête via PDO
		Global $pdo;
		$result = $pdo->query('SELECT * FROM livre');

		// Parcours des résultats dans une boucle
		$tab = [];
		while($ligne = $result->fetch(PDO::FETCH_ASSOC))
		{
			// Pour chaque élément, instanciation d'un nouvel objet livre et stockage dans un array
			$tab[] = new Livre($ligne['titre'], $ligne['auteur'], $ligne['id_livre']);
		}
		// Renvoie tous les livres présents en BDD sous forme de liste d'objet.
		return $tab;
	}
}