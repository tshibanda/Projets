<?php 
	/*controleur contact.php :
		fonctions-action de gestion des contacts
	*/
	session_start();
	function dossieret() {
		require ("modele/dossieretBD.php");
		//$login_etu = (isset($_GET['login']));
		$login_etu=$_SESSION['login'];
		$dossieretu = dossieretu($login_etu);
		require ("vue/etudiant/dossieretu.tpl");
	}
	
	function ajout_c() {
		echo ("ajout_c :: ajout d'un contact <br/>");
	}
	
	function maj_c(){
		echo ("maj_c :: mise à jour d'un contact <br/>");
	}
	
	function destr_c () {
		echo ("destr_c :: destruction d'un contact <br/>");
	}
?>