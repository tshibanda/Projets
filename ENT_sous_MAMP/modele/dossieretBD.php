
<?php  



function dossieretu($login_etu) {
	
		require ("modele/connect.php") ; 
		$sql="SELECT nom, prenom, email,login_etu,date_etu,urlPhoto FROM etudiant e
		WHERE login_etu=:login_etu;
		LIMIT 0,30"; // LIMIT ne marche pas en MS SQL SERVER
		try {
			
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_etu', $login_etu);
			//echo('loginetu vaut'.$login_etu);
			$bool = $commande->execute();
			$C= array();
			
			if ($bool) {
				//echo('bool est true');
				while ($c = $commande->fetch()) {
					//echo($c);
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