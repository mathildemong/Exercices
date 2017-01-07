<?php
require('inc/init.inc.php');
$livres = Livre::all();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Livres</title>
</head>
<body>
	<a href="index.php">Retour</a><br>
	<ul>
		<?php
		foreach($livres as $livre)
		{
			echo '
			<li>
				<a href="fiche_livre.php?id_livre='.$livre->getId_livre().'">
					'.$livre->getTitre().'
				</a>
			</li>';
		}
		?>
	</ul>
</body>
</html>