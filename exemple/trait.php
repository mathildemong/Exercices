<?php
trait TPanier
{
	public $nbProduit = 1;
	public function displayProducts()
	{
		return 'Affichage des produits';
	}
}

trait TMembre
{
	public function displayMembers()
	{
		return 'Affichage des membres';
	}
}

class Site
{
	use TPanier, Tmembre; // rend disponible le code de TPanier et TMembre.
}

$site = new Site;
echo $site->displayMembers();
echo '<br>';
echo $site->displayProducts();

/*

Les traits ont été inventés pour repousser les limites de l'héritage.
Une classe ne peut hériter que d'une seule classe à la fois. En revanche elle peut importer plusieurs traits.

*/