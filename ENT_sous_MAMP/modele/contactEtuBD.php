
<?php  



function contactEtu($id_grpe) {
	
		require ("modele/connect.php") ; 
		$sql="SELECT e.nom, e.prenom, e.email, g.num_grpe FROM etudiant e, groupe g WHERE g.id_grpe=:id_grpe AND e.id_grpe=g.id_grpe";
		try {
			
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':id_grpe', $id_grpe);

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
	function contactEtu_Prof(){
		
		
		require ("modele/connect.php") ; 
		$sql="SELECT e.nom, e.prenom, e.email, g.num_grpe FROM etudiant e, groupe g WHERE e.id_grpe=g.id_grpe";
		try {
			
			$commande = $pdo->prepare($sql);
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

	function grpe(){

		require ("modele/connect.php") ; 
		$sql="SELECT g.id_grpe, g.num_grpe, P.label FROM Promotion p, groupe G WHERE g.type_grpe='mono' AND g.id_promo=p.id_promo";
		try {
			
			$commande = $pdo->prepare($sql);
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