<?php 
	/*controleur contact.php :
		fonctions-action de gestion des contacts
	*/		

	session_start();
	function ContactProf() {
		require ("modele/ContactProfBD.php");
		//$login_etu = (isset($_GET['login']));
		$login_etu=$_SESSION['login'];
		$ContactProf = matiere($login_etu);
		$listeProfReferent=listeProfReferent($login_etu);
			require ("vue/etudiant/AfficherProf1.tpl");

		

	}
	function AfficherProf(){
		require ("modele/ContactProfBD.php");
		//echo($_SESSION['index_mat']."   ");

		if($_POST['id_list']==0){
			$login_etu=$_SESSION['login'];
		$ContactProf = matiere($login_etu);

					$_SESSION['vide']=true;
							$listeProfReferent=listeProfReferent($_SESSION['login']);
					require ("vue/etudiant/AfficherProf1.tpl");

		}
		else{
					$index_mat=$_SESSION['ContactProf'][$_POST['id_list']-1];
					$listeProf=listeProf($index_mat);
		//$listeProfReferent=listeProfReferent($index_mat);
		require ("vue/etudiant/AfficherProf2.tpl");

		}
		


	}
	
?>
