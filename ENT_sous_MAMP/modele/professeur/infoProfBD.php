<?php


	Function Professeur($login_prof){
		
		
		require ("modele/connect.php") ; 
		$sql="SELECT p.nom, p.prenom, p.genre, p.email, pr.label FROM prof p, prof_roles pr WHERE p.login_prof=:login_prof AND pr.id_prof=p.id_prof;
		LIMIT 0,30;"; // LIMIT ne marche pas en MS SQL SERVER



		/*$sql="SELECT p.nom, p.prenom, p.genre, pr.label , p.email FROM prof p, prof_roles pr WHERE p.login_prof=:login_prof AND pr.id_prof=p.id_prof;
		LIMIT 0,30;";*/

		try {
			
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_prof', $login_prof);
			//echo('loginetu vaut'.$login_etu);
			$bool = $commande->execute();
			$C= array();
			if ($bool) {
				//echo('bool est true');
				while ($c = $commande->fetch()) {
					//echo("ppp");
					$C[] = $c; //stockage dans $C des enregistrements sélectionnés
				}	
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		return $C;
	}












?>
