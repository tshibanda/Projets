<?php 
	/*controleur contact.php :
		fonctions-action de gestion des contacts
	*/
	session_start();
	function creneau() {
		require ("modele/EDTetuBD.php");
		//$login_etu = (isset($_GET['login']));
		$login_etu=$_SESSION['login'];
		$EDTetu = EDTetu($login_etu);
		
		
		require ("vue/etudiant/affichertexte.tpl");
	}
	

	
	
	
?>
