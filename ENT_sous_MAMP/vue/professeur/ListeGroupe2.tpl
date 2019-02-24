<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Affichage des professeurs</title>
		<link rel="stylesheet" href="./vue/styleCSS/style.css"/>
		<link rel="stylesheet" href="./vue/styleCSS/contact.css"/>
		<!-- <script src="script.js"></script> -->
	</head>
	<body>
		<nav>

<?php require("vue/layout/menuProf.tpl"); ?>

</nav>
	
	
		 
		<div id="main">
			

			 <?php

			if ($contactEtu_Prof != false) {
			?> <h2>Voici la liste de vos étudiants</h2>

				<h4>Etudiants :</h4>
				 <?php
				foreach ($contactEtu_Prof as $li) {
				

				 ?>	

				<label><?php echo ($li['nom']." ".$li['prenom']." (groupe ".$li['num_grpe'].") :  ".$li['email']. '</br>');  } ?> </label>		
								
	

<?php
			
			}else{
			echo("Vous n'avez pas d'eleve pour ce groupe'");
		}
		unset($_SESSION['videG']); 
			
?>



		</div>
	</body>
</html>
