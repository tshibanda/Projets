<?php 
	/*Fonctions-modèle réalisant les requètes de gestion des contacts en base de données*/
	
	// liste_contact_bd : retourne la liste des informations pour chaque contact de l'utilisateur $id

	function matiere($login_etu){

	require ("modele/connect.php") ; 

		$sql="SELECT M.id_mat, M.nom From Matiere M, Etudiant E, EDTPeriod EDT WHERE E.login_etu=:login_etu AND E.id_promo=EDT.id_promo AND EDT.id_period = M.id_period ; 
		LIMIT 0,30;";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_etu', $login_etu);
			$bool = $commande->execute();

			$C= array();
			if ($bool) {

				while ($c = $commande->fetch()){
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

	





	function listeProf($id_mat){
		
		require ("modele/connect.php") ;

		

		$sql="SELECT DISTINCT R.id_prof, P.nom, P.prenom, P.email FROM Matiere M, Completude C, Prof_roles R, Prof P WHERE M.id_mat=:id_mat AND C .id_mat=M.id_mat AND C.id_prof=P.id_prof AND P.id_prof=R.id_prof; 
		LIMIT 0,30;";



		

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':id_mat', $id_mat);
			$bool = $commande->execute();

			$C= array();

			if ($bool) {
//				echo('KARIS');
				while ($c = $commande->fetch()){
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

	function listeProfReferent($login_etu){
		
/*
		//require ("modele/connect.php") ;
		$D=listeProf($id_mat);
		$C= array();

		foreach($D as $c){
			if($c['bResp']==1){
				$C[] = $c;
			}
		}
		return $C; */
		require ("modele/connect.php") ;

	$sql="SELECT DISTINCT PR.label, P.nom, P.prenom, P.email FROM Prof_roles PR, Prof P, Completude C, Matiere M, Edtperiod Pe, Etudiant E  WHERE E.login_etu=:login_etu AND E.id_promo= Pe.id_promo ANd Pe.id_period=M.id_period AND M.id_period = C.id_period AND C.id_prof = P.id_prof AND P.id_prof=PR.id_Prof AND PR.bResp='1';
		LIMIT 0,30;"; 



		

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_etu', $login_etu);
			$bool = $commande->execute();

			$C= array();

			if ($bool) {
				while ($c = $commande->fetch()){
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
