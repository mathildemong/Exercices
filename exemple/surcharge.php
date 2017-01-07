<?php
class Mother
{
	public $attributA = 'attributA dans la class Mother';
	public function methodA()
	{
		return 'méthode A dans la class Mother';
	}
}

class Child extends Mother
{
	public $attributB = 'attributB dans la classe Child';
	public function methodB()
	{
		return 'méthode B dans la classe Child';
	}

	public function methodA() // J'ai surchargé la méthode methodA(). Je l'ai réécrite.
	{
		return 'méthode A dans la classe Child';
	}

}

$child = new Child;
echo $child->attributA;
echo '<br>';
echo $child->methodA();