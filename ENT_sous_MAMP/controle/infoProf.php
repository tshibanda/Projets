<?php 
	/*controleur contact.php :
		fonctions-action de gestion des contacts
	*/
	session_start();
	function infoProf() {
		require ("modele/professeur/infoProfBD.php");
		//$login_etu = (isset($_GET['login']));
		$login_prof=$_SESSION['login'];
		$Professeur=Array();
		$Professeur = Professeur($login_prof);
		require ("vue/professeur/informations.tpl");
	}

	
?>
