<?php
require('inc/init.inc.php');

$livre = Livre::find($_GET['id_livre']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><?= $livre->getTitre() ?></title>
</head>
<body>
	<a href="livres.php">Retour</a><br>
	Titre du livre : <?= $livre->getTitre() ?><br>
	Auteur du livre : <?= $livre->getAuteur() ?><br>
</body>
</html>