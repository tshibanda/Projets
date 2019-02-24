<?php

	function estResponsable($login_prof){
		require ("modele/connect.php") ; 

		$sql="SELECT DISTINCT M.id_mat, M.nom  FROM  Matiere M, Prof_roles pr, Prof P, Completude C
		WHERE P.login_prof=:login_prof AND Pr.id_prof=p.id_prof AND pr.bResp='1' AND pr.id_prof=C.id_prof AND C.id_mat=M.id_mat;
		LIMIT 0,30;";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login_prof', $login_prof);
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


	function MAJ($id_mat){
		require ("modele/connect.php") ; 
		if(isset($_POST['newlabel'])) {
      $newlabel = htmlspecialchars($_POST['newlabel']);
      $insertmat = $pdo->prepare("UPDATE matiere SET label = ? WHERE id_mat = ?");
      $insertmat->execute(array($newlabel, $id_mat));
      header('Location:index.php?controle=GererMat&action=Responsable');


  }
  	if(isset($_POST['newEns'])) {
      $newEns = htmlspecialchars($_POST['newEns']);
      $insertens = $pdo->prepare("UPDATE matiere SET typeEns = ? WHERE id_mat = ?");
      $insertens->execute(array($newEns, $id_mat));
      $json = json_decode($insertens);
      header('Location:index.php?controle=GererMat&action=Responsable');

     
  }





	}