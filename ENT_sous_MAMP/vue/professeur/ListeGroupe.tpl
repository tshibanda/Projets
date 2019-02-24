<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Liste Groupe</title>
		<link rel="stylesheet" href="./vue/styleCSS/style.css"/>
		<link rel="stylesheet" href="./vue/styleCSS/contact.css"/>
		<style type="text/css"> 
		#ul{
			margin-left: none;
		}




		</style>



		<!-- <script src="script.js"></script> -->
		 <script type="text/javascript">

			function updated(element)
{
    //var idx=element.selectedIndex;
   // var pElem = document.getElementById('p').value;
    var idx = document.getElementById("listGr").selectedIndex;
    var val=element.options[idx].value;
    var content=element.options[idx].innerHTML;
    //alert(idx + " " + content);
    var d = document.getElementById("listGr");
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

<?php require("vue/layout/menuProf.tpl"); ?>

</nav>
	
		 
		<div id="main">
			<?php

			if(isset($_SESSION['videG'])){ ?>

			<label>Vous devez choisir un groupe !</label>
			<?php $_SESSION['videG']=NULL; } ?>

			<form action="index.php?controle=AffichContactEtu&action=contact_Etudiant" method="post" id="formulaire"
		style="color:black;">
		<h4>Choisissez un groupe</h4>
					<SELECT name="id_mat" size="1" id="listGr" onchange="updated(this)" onload="updated(this)">


			
			<?php 
		
			if ($grpe != false) { ?>
			<OPTION></OPTION>
			
			<?php $index=array();
				
				foreach ($grpe as $c) {

				 ?>
				 <OPTION><?php echo($c['num_grpe']." / ".$c['label']); ?></OPTION>
				 <?php $index[]=$c['id_grpe']; } 
				 ?>
				
			<?php $_SESSION['groupe']=$index; $_SESSION['videG']=false; } 

			else{
			echo("Il n'y a pas de groupe d'étudiants");

		}
	
			?>


			
		</SELECT>
				<input type="text" name="id_grpe" id="txtvalue"  style="display:none"/>

		<input type="submit"  value="Ok" />
		</form>



		</div>
	</body>
</html>
