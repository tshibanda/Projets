<?php 
	/*controleur contact.php :
		fonctions-action de gestion des contacts
	*/
	session_start();
	function creneau() {
		require ("modele/EDTetuBD.php");
		//$login_etu = (isset($_GET['login']));
		$login_etu=$_SESSION['login'];
		$IDEDTH=IDEDTH($login_etu);
		$EDTetu = EDT($login_etu);
		$EDTH=Array();

  if(!isset($_SESSION['premiereFois'])){
 				$EDTH=EDTH($_SESSION['login'],$IDEDTH[0]['id_edth']);

		}
		else{
			$EDTH=EDTH($_SESSION['login'],$_SESSION['edth'][ $_SESSION['increment']]['id_edth']);
		}


		$_SESSION['EDTetu'] = $EDTetu;
		//var_dump ($EDTetu);
		
		require ("vue/etudiant/affichertexte.tpl");
	}
	

function changerSemaine(){
	if(isset($_POST['SemainePrec'])){
		if($_SESSION['increment']>0){
			$_SESSION['increment']--;
		}
		
	}
	else{
		if($_SESSION['increment']<$_SESSION['nbSession']-1){
			$_SESSION['increment']++;
		}

	}
	unset($_POST['SemainePrec']);
	unset($_POST['SemaineSuiv']);
	creneau();




}

function construireEDT(){
		require ("modele/EDTetuBD.php");

		$EDTH=EDTH($_SESSION['login'],$_SESSION['edth'][ $_SESSION['increment']]['id_edth']);
		print_r($EDTH);
		//require ("vue/etudiant/affichertexte.tpl");


    $jour = array(null, "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche");
    //$rdv["Dimanche"]["16"] = "Maths";
    //$rdv["Lundi"]["8"] = "Anglais";
	//$EDTH = $_SESSION['EDTH'];
    //echo $EDT[1];
	//var_dump($EDT);
	foreach ($EDTH as &$value) {
		//var_dump($value);
		//echo $jour[$value["nbJour"]];
		$rdv[$jour[$value["nbJour"]+1]][$value["hDeb"]] = $value["nom"];
		$rdv[$jour[$value["nbJour"]+1]][$value["hFin"] - 1] = $value["nom"];
		//echo $value["nom"];
		//$rdv["Lundi"]["8"] = $value["nom"];
	}
	echo "<tr><th>Heure</th>";
	
    for($x = 1; $x < 8; $x++)
        echo "<th>".$jour[$x]."</th>";
    echo "</tr>";
    for($j = 8; $j < 19; $j += 1) {
        echo "<tr>";
        for($i = 0; $i < 7; $i++) {
            if($i == 0) {
                $heure = str_replace(".2", ":00", $j);
                echo "<td class=\"time\">".$heure."</td>";
            }
            echo "<td>";
            if(isset($rdv[$jour[$i+1]][$heure])) {
                echo $rdv[$jour[$i+1]][$heure];
            }
            echo "</td>";
        }
        echo "</tr>";
    }

}


?>