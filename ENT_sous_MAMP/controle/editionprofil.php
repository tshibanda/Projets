<?php 
session_start();
	function editerprofil() {
		require ("vue/etudiant/editionprofil.tpl");
		
	}	
	function editerprofil2() {
		//echo("SALUT2");
		require ("modele/editionprofilBD.php");
		//$infouser = editionEtuProfil($_SESSION['login']);
		$_SESSION['msg']= editionEtuProfil($_SESSION['login']);
		echo($_SESSION['msg']);
		if($_SESSION['msg']==null){
			require("vue/etudiant/dossieretu.tpl");
		}
		else{
			require("vue/etudiant/editionprofil.tpl");
			//$_SESSION['msg']==null;

		}


	}	
?>