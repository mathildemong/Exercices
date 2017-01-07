<pre>
Class Car

attributs :
engineStarted : boolean = false;
color : string ('blue' || 'black' || 'yellow')

method :
__construct($color) : définit la couleur de la voiture lors de sa création
turnKey() : démarre ou arrête le moteur
stopEngine() : arrête le moteur
startEngine() : démarre le moteur
setColor($color) : change la couleur de la voiture
getColor() : renvoie la couleur de la voiture

Faire attention à l'encapsulation.
Conditions dans le setColor ;)
</pre>
<?php
class Car
{
	/*
	Déclaration des attributs de la classe.
	Encapsulation :
	-public : Tout le monde y accède (depuis l'intérieur et l'extérieur de la classe)
	-protected/private : accès depuis l'intérieur de la classe mais pas depuis l'extérieur (une fois instancié)

	$engineStarted a une valeur par défaut : false
	*/
	public $engineStarted = false;
	private $color;


	/*
	Méthode magique __construct()
	Méthode appelée lors de l'instanciation de la classe en objet (avec new Car(arg1, arg2, etc));
	*/
	public function __construct($color)
	{
		$this->setColor($color);
	}

	/*
	Setter de l'attribut color
	Un setter permet d'attribuer une valeur à un attribut. Comme c'est une méthode, on peut faire des traitements à l'intérieur. Comme des vérifications, par exemple.
	Ici, on vérifie que l'argument passé au setter est bien l'une des couleurs autorisées.
	Permet d'avoir un code robuste.
	*/
	public function setColor($color)
	{
		if($color == 'blue' || $color == 'black' || $color == 'yellow')
		{
			$this->color = $color;
		} else {
			throw new Exception('Mauvaise couleur donnée');
		}
	}

	/*
	C'est un getter.
	Un getter permet de récupérer la valeur d'une propriété privée ou protégée.
	*/
	public function getColor()
	{
		return $this->color;
	}

	/*
	Méthode public car on doit pouvoir utiliser la méthode depuis l'extérieur de la class.
	*/
	public function turnKey()
	{
		if($this->engineStarted)
		{
			$this->stopEngine();
		} else {
			$this->startEngine();
		}
	}

	/*
	Méthode private car on NE doit PAS pouvoir utiliser la méthode depuis l'extérieur de la class.
	Cette méthode est un outils utilisé par la class. L'user, le developpeur qui manipule les objets ne doit pas y accéder. Il n'en a pas l'utilité.
	*/
	private function startEngine()
	{
		$this->engineStarted = true;
	}

	private function stopEngine()
	{
		$this->engineStarted = false;
	}
}
echo '<hr>';
$car = new Car('yellow');
echo 'je crée la voiture';
var_dump($car);
$car->turnKey();
echo 'Je tourne la clé';
var_dump($car);
$car->turnKey();
echo 'Je tourne la clé';
var_dump($car);

$car->setColor('blue');
var_dump($car);
