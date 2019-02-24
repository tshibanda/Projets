<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Listes professeurs</title>
		<link rel="stylesheet" href="./vue/styleCSS/style.css"/>
		<link rel="stylesheet" href="./vue/styleCSS/contact.css"/>
		<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
		<style type="text/css"> 
		#ul{
			margin-left: none;
		}
		#formulaire{
			margin-top: 5%;
		}






		</style>



		<!-- <script src="script.js"></script> -->
		 <script type="text/javascript">

			function updated(element)
{
    //var idx=element.selectedIndex;
   // var pElem = document.getElementById('p').value;
    var idx = document.getElementById("list").selectedIndex;
    var val=element.options[idx].value;
    var content=element.options[idx].innerHTML;
    //alert(idx + " " + content);
    var d = document.getElementById("list");
//    var displaytext=d.options[d.selectedIndex].text;
 //   var displaytext=d.options[d.selectedIndex].text;
    document.getElementById("txtvalue").value=idx;

   // return idx;
 }	

 function defaut(element)
 {
 	    var val=element.options[idx].value;
 	    return val;

 }


		</script> 
	</head>
	<body>
		 <nav>

<?php require("vue/layout/menuEtu.tpl"); ?>

</nav>
	
	
		 
		<div id="main">
			<?php

			if(isset($_SESSION['vide'])){ ?>

			<label class="text-danger">Vous devez choisir une matiere !</label>
			<?php  $_SESSION['vide']=NULL; } ?>

			<form action="index.php?controle=AfficherProf&action=AfficherProf" method="post" id="formulaire"
		style="color:black;">
		<h4>Choisissez une matiere</h4>
					<SELECT name="id_mat" size="1" id="list" onchange="updated(this)" onload="updated(this)">


			
			<?php 
		
			if ($ContactProf != false) { ?>
			<OPTION></OPTION>
			
			<?php $index=array();
				
				foreach ($ContactProf as $c) {

				 ?>
				 <OPTION><?php echo($c['nom']); ?></OPTION>
				 <?php $index[]=$c['id_mat'];   } ?>
				
			<?php $_SESSION['ContactProf']=$index; } 

			else{
			echo("Vous n'avez pas de matiere");

		}
	
			?>


			
		</SELECT>
				<input type="text" name="id_list" id="txtvalue" style="display:none"/>

		<input type="submit"  value="Ok" />
		</form>
		<form  method="post" id="formulaire1" action="index.php?controle=AfficherProf&action=AfficherProf"
		style="color:black;">
				 <?php

			if ($listeProfReferent != false) {
			?> 
				<h2>Voici la liste de vos référents</h2>

				 <?php
				foreach ($listeProfReferent as $li) {
				

				 ?>	
				 <ul class="list-group list-group-striped">
				<li id = "ul"class="list-group-item"><?php echo ($li['nom']." ".$li['prenom']."  :  ".$li['email']. "     ".$li['label'].'</br>');  } ?> 
					</li>
					</ul>	</form>		
	

<?php
			
			}else{
			echo("Vous n'avez pas de référents pour votre formation");
		}
			
?>




		</div>
	</body>
</html>
