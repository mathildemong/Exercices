<?php
//Héritage
abstract class Shape
{
	public $color;

	public function __construct($color)
	{
		$this->color = $color;
	}

	abstract protected function getArea();
}

class Square extends Shape
{
	public $length = 4;
	public function getArea()
	{
		return $this->length * $this->length;
	}
}

class Triangle extends Shape
{
	public $base = 3;
	public $height = 4;
	public function getArea()
	{
		return $this->height * $this->base * 0.5;
	}
}

class Octogone extends Shape
{
	public $length = 4;

	public function getArea()
	{
		return $this->length * $this->length;
	}
}

$square = new Square('jaune');

$triangle = new Triangle('bleu');
echo $triangle->color;
echo '<br>';
echo $triangle->getArea();