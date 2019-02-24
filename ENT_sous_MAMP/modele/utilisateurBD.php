<?php
	/*Fonctions-modèle réalisant les requètes de gestion des utilisateurs en base de données*/
	
	// verif_bd : fonction booléenne. 
	// Si vraie, alors le profil de l'utilisateur est affecté en sortie à $profil
		

	
	function verif_bdProf($login_prof,$pass_prof,&$profil) {
		
		$login_prof=isset($_POST['login'])?trim($_POST['login']):'';
		
		$pass_prof=isset($_POST['pass'])?trim($_POST['pass']):'';
		
		require('modele/connect.php'); //$pdo est défini dans ce fichier
		
		$sql="SELECT * FROM `prof` WHERE login_prof=:login_prof AND pass_prof=:pass_prof";
		                   
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_prof', $login_prof);
			$commande->bindParam(':pass_prof', $pass_prof);
			$bool = $commande->execute();
			$resultat=array();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				// var_dump($resultat); die();
				/*while ($ligne = $commande->fetch()) { // ligne par ligne
					print_r($ligne);
				}*/
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		try {
			if (count($resultat) == 0) {
				$profil=array(); // Pour qu'il y ait quand même quelque chose...
				return false; 
			}
			else {
				$profil = $resultat[0];
				//var_dump($profil);
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		
	}
	function verif_bdEtu($login_etu,$pass_etu,&$profil) {
		 
		$login_etu=isset($_POST['login'])?trim($_POST['login']):'';
		
		$pass_etu=isset($_POST['pass'])?trim($_POST['pass']):'';
		
		require("modele/connect.php"); //$pdo est défini dans ce fichier
		$sql="SELECT * FROM `etudiant` WHERE login_etu=:login_etu AND pass_etu=:pass_etu";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_etu', $login_etu);
			$commande->bindParam(':pass_etu', $pass_etu);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				 $_SESSION['ConnectedUser'] = $resultat; //die();
				/*while ($ligne = $commande->fetch()) { // ligne par ligne
					print_r($ligne);
				}*/
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		if (count($resultat) == 0) {
			$profil=array(); // Pour qu'il y ait quand même quelque chose...
			return false; 
		}
		else {
			$profil = $resultat[0];
			//var_dump($profil);
			return true;
		}
	}
	?>