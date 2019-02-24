<?php 
	/*controleur contact.php :
		fonctions-action de gestion des contacts
	*/
	session_start();
	function groupe(){
		require ("modele/contactEtuBD.php");
		unset($_SESSION['videG']); 
		$grpe=grpe();

		require ("vue/professeur/ListeGroupe.tpl");


	}


	function contact_Etudiant() {
		require ("modele/contactEtuBD.php");
		//$login_etu = (isset($_GET['login']));
		//$login_etu=$_SESSION['login'];
		//$contactEtu= contactEtu($);

		if($_POST['id_grpe']==0){
				$grpe=grpe();
				$_SESSION['videG']=true;
		require ("vue/professeur/ListeGroupe.tpl");

		}
		else{
			$index_gr=$_SESSION['groupe'][$_POST['id_grpe']-1];
					$contactEtu_Prof=contactEtu($index_gr);
					require ("vue/professeur/ListeGroupe2.tpl");

		}



	}

	
	
?>
