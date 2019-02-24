<?php 
	/*controleur utilisateur.php :
		fonctions-action de gestion des utilisateurs
	*/


session_start(); 

	function ident () {
		$login=isset($_POST['login'])?trim($_POST['login']):'';
		$pass=isset($_POST['pass'])?trim($_POST['pass']):'';
		$msg="";
		$_SESSION['login']=$login;
		
		require ("./modele/utilisateurBD.php");
		
			if (count($_POST)==0){
			require("./vue/utilisateur/ident.tpl");
		}
		else {
			$profil= array();
			if (($bool=verifS_ident($login, $pass, $err)) && verif_bdProf($login, $pass, $profil)) {
				// session_start(); //fait dans index
				$_SESSION['profil'] = $profil;
				$nexturl = "index.php?controle=utilisateur&action=accueilProf";
				header ("Location:" . $nexturl);
			}
			if (verif_bdEtu($login, $pass, $profil)) { // ce qui est saisi dans le formulaire. On verifie si l'identifian et le nulm sont 
				//echo ('<br />PROFIL : <pre>'); print_r ($profil); echo ('</pre><br />'); die("ident");
				
				// session_start(); //fait dans index
				
				 $_SESSION['profil'] = $profil;
				 $nexturl = "index.php?controle=utilisateur&action=accueilEtu";
				 header ("Location:" . $nexturl);
			}
		else {
			if (!$bool) $msg = $err; 
				else $msg = "Utilisateur inconnu !";
				require("./vue/Utilisateur/ident.tpl");
			}
	}
	}

	function accueilProf() {
		require ("vue/professeur/accueilProf.tpl");
	}
	function accueilEtu() {
		
		require ("vue/etudiant/accueilEtu.tpl");
	}
		
	function bye() {
	
	echo ("<h2>Déconnexion réussie " .  "</h2>");
	session_destroy();
	require("vue/utilisateur/ident.tpl");
	
	}
	
function verifS_ident($nom, $num, &$err) {
		if (!preg_match("`^[[:alpha:][:digit:]\-]{1,30}$`", $nom)) {
			$err = 'erreur de syntaxe sur le nom';
			return false;
		}
		if (!preg_match("`^[[:alpha:][:digit:]]{2,8}$`", $num)) {
			$err = 'erreur de syntaxe sur l\'identifiant.';
			return false;
		}
		return true;
	} 
	
	
	
		?>