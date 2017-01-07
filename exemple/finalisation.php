<?php
final class Application // Une classe 'final' ne peut PAS être héritée.
{
	public function lauchApp()
	{
		// Plein de code pour initialiser l'application
		return 'l\'appli se lance comme cela';
	}
}

$app = new Application;
echo $app->lauchApp();

// Erreur lors de l'héritage de la classe finale Application.
/*class SubApp extends Application
{

}*/

class Application2
{
	final public function lauchApp() // une méthode final ne peut pas être surchargée.
	{
		// Plein de code pour initialiser l'application
		return 'l\'appli se lance comme cela';
	}
}

class SubApp2 extends Application2
{
	// Provoque une erreur : tentetative d'override d'une méthode finale
	/*public function lauchApp()
	{
		// Surcharge de lauchApp()
	}*/
}