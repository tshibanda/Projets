<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Contact Etudiant</title>
		<link rel="stylesheet" href="/vue/styleCSS/style.css"/>
		<link rel="stylesheet" href="./vue/styleCSS/dossieretu.css"/>
		<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- <script src="script.js"></script> -->
	</head>
	<body style="background-image:white">
		</div>
<nav>
				<?php require("vue/layout/menuEtu.tpl"); ?>
</nav>

		 
		<div id="main">
			<?php
				if ($contactEtu != false) {
				echo("<h2> Voici vos contacts étudiants </h2><br>");
				echo("<h2 style=text-align:center color:black> Vos Camarades </h2><br>");
				echo('<table class="table">');
				echo('<tr><th> NOM </th> <th> PRENOM </th> <th> EMAIL </th> <th> GROUPE </th></tr>');
				foreach($contactEtu as $c){
				echo "<tr class='contact'>";
				echo("<td>" . $c['nom'] . "</td>");
				echo("<td>" . $c['prenom'] . "</td>");
				echo("<td>" . $c['email'] . "</td>");
				echo("<td>" . $c['num_grpe'] . "</td>");
				echo "</tr>\n";
				}
				}
					
				else echo ('pas de contacts!');
			?>
		</div>
	</body>
</html>
