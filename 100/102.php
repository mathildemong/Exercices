<?php
class Task {
    public $description;

    public function __construct($description)
    {
    	$this->description = $description;
    }
}

$task = new Task('Acheter du pain');

var_dump($task->description);
?>