<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Affichage des professeurs</title>
		<link rel="stylesheet" href="./vue/styleCSS/style.css"/>
		<link rel="stylesheet" href="./vue/styleCSS/contact.css"/>
		<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
  

		<!-- <script src="script.js"></script> -->
	</head>
	<body>
		<nav>
<?php require("vue/layout/menuEtu.tpl"); ?>

</nav>
	
	
		 
		<div id="main">
			

			 <?php

			if ($listeProf != false) {
			?> <h2 color="">Voici la liste de vos professeurs</h2>

				<h4>Professeurs :</h4>
				 <?php
				foreach ($listeProf as $li) {
				

				 ?>	

				 <!-- <ul class="list-group list-group-striped"> -->
				<label id = "ul"class="list-group-item"><?php echo ($li['nom']." ".$li['prenom']."  :  ".$li['email'].'</br>');  } ?> 
					</label>
					<!-- </ul>	-->
								
	

<?php
			
			}else{
			echo("Vous n'avez pas de professeurs ni de référents");
		}
			
?>



		</div>
	</body>
</html>
