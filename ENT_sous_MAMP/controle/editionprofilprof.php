<?php 
session_start();
	function editerprofil() {
		
		require ("vue/professeur/editionprofil.tpl");
		
	}	
	function editerprofil2() {
		require ("modele/editionprofilBD.php");
		$infouser = editionProfProfil($_SESSION['login']);		
	}	
?>