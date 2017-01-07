<?php
interface Mouvement
{
	public function deplacement();
}

class Bateau implements Mouvement // classe Bateau extends mouvement ne fonctionne pas
{
	public function deplacement()
	{
		
	}
}
