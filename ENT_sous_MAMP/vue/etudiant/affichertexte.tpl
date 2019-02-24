<!DOCTYPE html>
<html>
<head>
    <title> Emploi du temps</title>
    <style type="text/css">
        caption /* Titre du tableau */
        {
           margin: auto; /* Centre le titre du tableau */
           font-family: Arial, Times, "Times New Roman", serif;
           font-weight: bold;
           font-size: 1.2em;
           color: #009900;
           margin-bottom: 20px; /* Pour éviter que le titre ne soit trop collé au tableau en-dessous */
        }
  
        #emploi /* Le tableau en lui-même */
        {
           margin: auto; /* Centre le tableau */
           width:90%;

        }
        th /* Les cellules d'en-tête */
        {
           background-color: #9b0d0d;
           color: white;
           font-size: 1.1em;
           font-family: Arial, "Arial Black", Times, "Times New Roman", serif;
           border:1px solid red;
        }
  
        td /* Les cellules normales */
        {
           
           font-family: "Comic Sans MS", "Trebuchet MS", Times, "Times New Roman", serif;
           text-align: center; /* Tous les textes des cellules seront centrés*/
           padding: 5px; /* Petite marge intérieure aux cellules pour éviter que le texte touche les bordures */
           margin-bottom: 2px;
        }
        td.time
        {
            width:5%;
            background-color: #9b0d0d;
           color: white;
           font-size: 1.1em;
           font-family: Arial, "Arial Black", Times, "Times New Roman", serif;
        }

        input{
          margin:auto;
          width: 60%;
        }
    </style>
    <meta charset="utf-8">
    <title>page d'accueil des etudiant</title>
    
    <link rel="stylesheet" href="./vue/styleCSS/style.css"/>
    <link rel="stylesheet" href="./vue/styleCSS/etu.css"/>
    <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        
        <!-- mobile specific info ... mobile specify windows size to 800/900 whereas device-width is less in general, resulting in small texte etc.- those meta correct this... -->
        <meta name="HandheldFriendly" content="true" />
        <meta name="viewport" content="width=device-width, height=device-height, user-scalable=no" />
        <!-- end mobile specific info -->
 
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <script src="script.js"></script> -->
  </head>
  <style>

.menu{
    height: 70px;
    background: #b7b9bc!important;
    box-shadow: 0px 1px 5px 0px black;
   }
.navbar-dark .navbar-nav .nav-link {
    color: rgb(255, 255, 255);
    letter-spacing: 1px;
}
.navbar-dark .navbar-nav .nav-link:hover {
    border-bottom: 3px solid white;

}
.div.container{
  width: 59px;
}
#img{
  margin-top: 2%;
  margin-left: -70%;
  
}
tr{
  margin-top:5%;
}
#group{
    width: 60%;
    margin-left: 6%;
    margin-right: 0%.
    padding-right:0%;

}
#Etat{
  margin-top: 6%;
  color: #b7b9bc;
  margin-left: 6%;
}
#img{
  width: 200px;
  margin-right: 5%;

}

#btn{
  color:rgb(255, 255, 255);
  background-color: #b7b9bc;
  margin-top: 5%;
  margin-left: 35%;
}
</style>




<nav><?php require("vue/layout/menuEtu.tpl"); ?></nav>

<?php
      

  if(!isset($_SESSION['premiereFois'])){

       $index=array();
       $semaineDu=array();
        $nbSession =0;
        $_SESSION['nbSession']=$nbSession;
        $increment=0; 
        $_SESSION['increment']=$increment;
        $_SESSION['premiereFois']=false;
     //   $_POST['SemainePrec']=;
     //   $_POST['SemaineSuiv']=;

      
  if ($IDEDTH != false) { 

            foreach ($IDEDTH as $c) {

        
          $index[]=$c;
          $semaineDu[]=$c['tDeb']; 

          $_SESSION['nbSession']++;

          } 
$_SESSION['edth']=$index;         $_SESSION['semaineDu']=$semaineDu;
}
}
//echo($_SESSION['nbSession']);
if($_SESSION['nbSession']==0){
  echo("Vous n'avez pas d'Emploi Du Temps");
}

?>
<table id="emploi"class="table table-bordered"><caption><?php echo("Semaine du ".date('d/m/Y', $_SESSION['edth'][ $_SESSION['increment']]['tDeb'])); ?></caption>


<?php
    $jour = array(null, "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche");
    
  $_SESSION['EDTH'] = $EDTH;
   
  foreach ($EDTH as &$value) {
    
    $rdv[$jour[$value["nbJour"]+1]][$value["hDeb"]] = $value["label"];
    $rdv[$jour[$value["nbJour"]+1]][$value["hFin"] - 1] = $value["label"];
    
  }

if($value["hFin"]-$value["hDeb"]>=2){
    $i=0;
      for($i=$value["hDeb"];$i<$value["hFin"];++$i){

      $rdv[$jour[$value["nbJour"]+1]][$i] = $value["label"]." / ".$value["Salle"];
      

    }


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
?>
</table>


<form method="post" action="index.php?controle=EDTETU&action=changerSemaine">
<table  border="0">
<tr>
<td width="5%">
    <input id="btn"type="submit" name="SemainePrec" id="SemainePrec" value="Semaine Precedente" /><br/>
</td>
<td width="5%" >
    <input id="btn" type="submit" name="SemaineSuiv" id="SemaineSuiv" value="Semaine Suivante" /><br/>
</td>

</tr>
</table>

</form>


</body>




 </body>
</html>