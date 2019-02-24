<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Informations professeur</title>
		<link rel="stylesheet" href="/vue/styleCSS/style.css"/>
		<link rel="stylesheet" href="./vue/styleCSS/dossieretu.css"/>
		<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- <script src="script.js"></script> -->
	</head>
	<body style="background-image:url(./vue/images/imagefond.jpg">
		</div>
<nav>
<?php require("vue/layout/menuProf.tpl"); ?>
</nav>

		 
		<div id="main">
			<?php
				if ($Professeur != false) {
				echo("<h2> Voici vos informations </h2><br>");

				echo('<table class="table">');
				echo('<tr><th> NOM </th> <th> PRENOM </th> <th> EMAIL </th> <th> ROLE</th></tr>');
				foreach($Professeur as $c){
				echo "<tr class='contact'>";
				echo("<td>" . $c['genre'] . ". ".$c[ 'nom'] . "</td>");
				echo("<td>" . $c['prenom'] . "</td>");
				echo("<td>" . $c['email'] . "</td>");
				echo("<td>" . $c['label'] . "</td>");
				echo "</tr>\n";
				}
				}
					
				else{ echo ("Nous n'avons pas assez de renseignements sur vous " .$login_prof);}

			?>
			
		</div>
	</body>
</html>
