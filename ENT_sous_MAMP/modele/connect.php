<?php
			


	$hostname = "vs-wamp";	//ou localhost
	$base= "pweb18";
	$loginBD= "root";	//ou "root"
	$passBD="root";
	//$pdo = null;

	$pdo = new PDO ("mysql:server=$hostname; dbname=$base", "$loginBD", "$passBD")
	

 // $test = $pdo->query('SELECT * FROM etudiant');
  // while ($donnees = $test->fetch())
  // {
  // echo '<p>' . $donnees['login_etu']. '</p>';
  // }
?>