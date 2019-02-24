<?php 
	/*Fonctions-modèle réalisant les requètes de gestion des contacts en base de données*/
	
	// liste_contact_bd : retourne la liste des informations pour chaque contact de l'utilisateur $id
	
	function EDT($login_etu) {
		require ("modele/connect.php") ; 
		//		WHERE E.login_etu=:login_etu AND E.id_grpe=C.id_grpe

	/*	$sql="SELECT C.id_Creneau, C.tDeb, C.tFin, S.nom as Salle, M.nom as Matiere FROM Creneau C, Etudiant E, Salle S, Matiere M
				WHERE E.login_etu=:login_etu AND E.id_grpe=C.id_grpe AND C.id_salle=S.id_salle AND C.id_mat=M.id_mat;
		LIMIT 0,30;"; // LIMIT ne marche pas en MS SQL SERVER */

		$sql="SELECT C.id_Creneau, C.tDeb, C.tFin, S.nom as Salle, M.nom as Matiere FROM Creneau C, Etudiant E, Salle S, Matiere M, EDTH H 
		WHERE E.login_etu=:login_etu AND H.id_edth=:id_edth AND E.id_grpe=C.id_grpe AND C.id_salle=S.id_salle AND C.id_mat=M.id_mat;
		LIMIT 0,30;";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_etu', $login_etu);
			$commande->bindParam('id_edth', $id_edth);
			$bool = $commande->execute();

			$C= array();
//			echo('bool vaut '.$bool);
			if ($bool) {

				while ($c = $commande->fetch()) {
				//	echo('DANS LA BOUBLEEE WHILE ');
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

	function IDEDTH($login_etu){

			require ("modele/connect.php") ; 
		

		$sql="SELECT H.id_edth, H.tDeb FROM  Etudiant E, Creneau C,  EDTH H
		WHERE E.login_etu=:login_etu AND E.id_grpe=C.id_grpe AND C.id_edth=H.id_edth 
		ORDER BY H.tDeb ASC;
		LIMIT 0,30;";




		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_etu', $login_etu);
			$bool = $commande->execute();
			
			$C= array();
			//echo('bool vaut '.$bool);
			if ($bool) {
			//	echo("dans le while ");
				while ($c = $commande->fetch()) {
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


	function EDTH($login_etu, $id_edth) {
		require ("modele/connect.php") ; 
		//		WHERE E.login_etu=:login_etu AND E.id_grpe=C.id_grpe

	/*	$sql="SELECT C.id_Creneau, C.tDeb, C.tFin, S.nom as Salle, M.nom as Matiere FROM Creneau C, Etudiant E, Salle S, Matiere M
				WHERE E.login_etu=:login_etu AND E.id_grpe=C.id_grpe AND C.id_salle=S.id_salle AND C.id_mat=M.id_mat;
		LIMIT 0,30;"; // LIMIT ne marche pas en MS SQL SERVER */
		/*SELECT m.nom,WEEKDAY(CAST(FROM_UNIXTIME(c.tdeb) as date)) as nbJour,HOUR(CAST(FROM_UNIXTIME(c.tdeb) as datetime)) as hDeb,HOUR(CAST(FROM_UNIXTIME(c.tfin) as datetime)) as hFin*/

		$sql="SELECT C.id_Creneau, WEEKDAY(CAST(FROM_UNIXTIME(c.tdeb) as date)) as nbJour, HOUR(CAST(FROM_UNIXTIME(c.tdeb) as datetime)) as hDeb,HOUR(CAST(FROM_UNIXTIME(c.tfin) as datetime)) as hFin, S.nom as Salle, M.nom, M.label, M.couleur FROM Creneau C, Etudiant E, Salle S, Matiere M, EDTH H 
		WHERE E.login_etu=:login_etu AND H.id_edth=:id_edth AND E.id_grpe=C.id_grpe AND C.id_edth=H.id_edth AND C.id_salle=S.id_salle AND C.id_mat=M.id_mat;
		LIMIT 0,30;";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_etu', $login_etu);
			$commande->bindParam('id_edth', $id_edth);
			$bool = $commande->execute();

			$C= array();
//			echo('bool vaut '.$bool);
			if ($bool) {

				while ($c = $commande->fetch()) {
				//	echo('DANS LA BOUBLEEE WHILE ');
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
