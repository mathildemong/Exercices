<?php
class Maison
{
	private static $nbPieces = 7;
	public static $espaceTerrain = '500m²';
	const HAUTEUR = '10m';
	public $couleur = 'blanc';
	private $nbPorte = 10;

	public static function getNbPieces()
	{
		return self::$nbPieces;
	}
	public function getNbPorte()
	{
		return $this->nbPorte;
	}
}

echo Maison::$espaceTerrain;
Maison::$espaceTerrain = '1000m²';
echo '<br>';
echo Maison::HAUTEUR;
echo '<br>';
echo Maison::getNbPieces();
echo '<br>';
$maison = new Maison;
echo $maison->couleur;
/*
$objet->element : accès à l'élément d'un objet instancié.
$this->element : accès à l'élément d'un objet depuis l'intérieur de sa classe.

Class::$element : accès à l'élément d'une classe depuis l'extérieur de la classe.
self::element : accès à l'élément d'une classe depuis l'intérieur de la classe.


2 questions à se poser :
Est-ce que c'est static (appartient à la class) ?
	Si oui : selecteur ::
		Est-ce que c'est appelé dans la classe ?
			Si oui : self::
			Si non : ClassName::
	Si non static (sélecteur ->)
		Est-ce que c'est appelé dans la classe ?
			Si oui : $this->
			Si non : $nomObj->

	Static indique qu'un élément appartient à la classe.

*/