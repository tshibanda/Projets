<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Matiere à gérer</title>
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

			if(isset($_SESSION['videM'])){ ?>

			<label>Vous devez choisir une matiere !</label>
			<?php $_SESSION['videM']=NULL; } ?>

			<form action="index.php?controle=GererMat&action=ModMat" method="post" id="formulaire"
		style="color:black;">
		<h4>Choisissez une matiere</h4>
					<SELECT name="id_mat" size="1" id="listGr" onchange="updated(this)" onload="updated(this)" onclick="updated(this)">
						<OPTION></OPTION>

			
			<?php 
		
				foreach ($MatResp as $c) {

				 ?>
				 <OPTION><?php echo($c['nom']); ?></OPTION>
				 <?php $index[]=$c['id_mat']; } 
				 $_SESSION['Mid_mat']=$index; $_SESSION['videM']=false;  

			
	
			?>


			
		</SELECT>
				<input type="text" name="Mid_mat" id="txtvalue"  style="display:none"/>

		<input type="submit"  value="Ok" />
		</form>



		</div>
	</body>
</html>
