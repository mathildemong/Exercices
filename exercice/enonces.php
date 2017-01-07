<?php
/*
1 : Ecrire la classe 'Explicite' qui AFFICHE 'La class a été instanciée' lorsqu'on l'instancie en objet.

2 : Ajouter une méthode à la classe 'Explicite' qui RENVOIE 'Bonjour à toi Nicolas'. 'Nicolas' étant un argument passé à la méthode lors de son appel.

3 : Ecrire une classe 'Calculator' qui contient 4 méthodes statiques (de classe) : add, substract, multiply, divide. Chacune prenant deux arguments qui DOIVENT être des integers.
*/

class Explicite
{
	public function __construct()
	{
		echo 'La classe a été instanciée';
	}

	public function direBonjour($prenom)
	{
		return 'Bonjour à toi '.$prenom.'.';
	}
}

$monObjet = new Explicite;
echo '<br>';
echo $monObjet->direBonjour('Sylvain');
echo '<hr>';


class Calculator
{
	public static function add(int $a, int $b)
	{
		return $a + $b;
	}

	public static function substract(int $a, int $b)
	{
		return $a - $b;
	}

	public static function multiply(int $a, int $b)
	{
		return $a * $b;
	}

	public static function divide(int $a, int $b)
	{
		return $a / $b;
	}
}

$maCalculatrice = new Calculator;
echo '<br>';
echo Calculator::multiply(4, 5);
echo '<br>';