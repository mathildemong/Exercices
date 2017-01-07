<?php
abstract class Vehicule
{
	final public function start()
	{
		return 'je démarre';
	}

	abstract public function carburant();

	public function nombreDeTestObligatoire()
	{
		return 200;
	}
}

class Peugeot extends Vehicule
{
	public function carburant()
	{
		return 'Essence';
	}

	public function nombreDeTestObligatoire()
	{
		return parent::nombreDeTestObligatoire() + 70;
	}
}
class Renault extends Vehicule
{
	public function carburant()
	{
		return 'Diesel';
	}

	public function nombreDeTestObligatoire()
	{
		return parent::nombreDeTestObligatoire() + 30;
	}
}

$renault = new Renault;
echo $renault->carburant();
echo '<br>';
echo $renault->start();
echo '<br>';
echo $renault->nombreDeTestObligatoire();
echo '<hr>';

$peugeot = new Peugeot;
echo $peugeot->carburant();
echo '<br>';
echo $peugeot->start();
echo '<br>';
echo $peugeot->nombreDeTestObligatoire();
echo '<hr>';

/*

1 : Faire en sorte de ne pas pouvoir instancier la classe Vehicule
2 : Obligation pour la Renault et la Peugeot de posséder la même méthode start() qu'un véhicule de base (pas de réécriture de méthode).
3 : Obligation de déclarer un carburant (avec return).

/!\ Demander de l'aide à votre formateur /!\
4 : La Renault doit effectuer 30 tests de plus qu'un véhicule de base.
5 : la Peugeot doit effectuer 70 tests de plus qu'un véhicule de base.

6 : Effectuer les afficages nécessaires.

*/