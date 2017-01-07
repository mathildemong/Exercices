<?php
class Task {
    public $description;
    public $title;
    public $completed = false;

    public function __construct($title, $description)
    {
        $this->title = $title;
    	$this->description = $description;
    }

    public function complete()
    {
    	$this->completed = true;
    }
}

$task = new Task('Acheter du pain', 'Prendre son porte feuilles, aller à la boulangerie, etc.');
$task2 = new Task('Manger du pain', 'Car le pain c\'est vraiment bon. Miam.');
var_dump($task->completed);
?>