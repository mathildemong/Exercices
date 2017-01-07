<?php
require('inc/init.inc.php');
$livres = Livre::all();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Back-end bibliothèque</title>
</head>
<body>
	Bonjour, bienvenu sur votre backend !<br>
	<a href="abonnes.php">Voir les abonnés</a><br>
	<a href="livres.php">Voir les livres</a><br>
</body>
</html>