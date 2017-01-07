<?php
class Person
{
	protected $name;
	protected $salary;

	// Constructeur
	public function __construct($name, $salary)
	{
		$this->setName($name);
		$this->setSalary($salary);
	}

	// Setters
	public function setSalary(int $salary)
	{
		$this->salary = $salary;
	}
	public function setName(string $name)
	{
		$this->name = $name;
	}

	// Getters
	public function getSalary()
	{
		return $this->salary;
	}
	public function getName()
	{
		return $this->name;
	}
}

class Staff
{
	protected $members;

	public function __construct(array $members = [])
	{
		$this->members = $members;
	}

	// Ajouter une membre au staff
	public function add(Person $person)
	{
		$this->members[] = $person;
	}

	public function getMembers()
	{
		return $this->members;
	}
}

class Business
{
	protected $staff;

	public function __construct(Staff $staff)
	{
		$this->staff = $staff;
	}

	public function hire(Person $person)
	{
		$this->staff->add($person);
	}

	public function getEmployes()
	{
		return $this->staff->getMembers();
	}

	public function getSalaryMass()
	{
		$mass = 0;
		foreach($this->getEmployes() as $person)
		{
			$mass += $person->getSalary();
		}
		return $mass;
	}
}

$nicolas = new Person('Nicolas Coulange', 1200);
$liam = new Person('Liam Tardieu', 2000);
$staff = new Staff([$liam, $nicolas]);
$evogue = new Business($staff);


echo $evogue->getSalaryMass();
/*
Rajouter la masse salariale.

class Person : rajouter un attribut protégé salaire

class Business : ajouter une méthode qui calcul la masse salariale de l'entreprise.
*/
