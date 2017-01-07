<?php
// Getter/Setter
class Person
{
	public $name;
	private $age;

	public function __construct($name)
	{
		$this->name = $name;
	}

	public function setAge(int $age)
	{
		if($age < 0)
		{
			throw new Exception('age negatif');
		} else {
			$this->age = $age;
		}
	}

	public function getAge()
	{
		return $this->age;
	}
}

$person = new Person('Nicolas');

$person->setAge(12);
var_dump($person->getAge());