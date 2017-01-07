<?php
// Les classes et l'instanciation d'objet

class Task
{
	public $description;
	public $completed = false;

	public function __construct($description)
	{
		$this->description = $description;
	}

	public function complete()
	{
		$this->completed = true;
	}
}

$task = new Task('acheter du pain');
var_dump($task);
// J'achète du pain
$task->complete();

var_dump($task);