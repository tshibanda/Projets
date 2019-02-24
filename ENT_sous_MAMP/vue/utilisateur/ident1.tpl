<?php 
	session_start ();?>
	
	<html>

	<head>
		<meta charset="utf-8">
		<title>formulaire didentification</title>
		<link rel="stylesheet" href="vue/styleCSS/ident.css"/>
		<!-- <script src="script.js"></script> -->
	</head>
	<body style="background-image:url(vue/images/logoDescarte.png">
		<form action="index.php?controle=utilisateur&action=ident" method="post" id="formulaire"
		style="color:black;">
		
		  <div id="tout" style="text-align:center">
		
	
          <div id="auth"><h3>
			<label>login </label><br>
			
			<input name="login" class="login" /></br>
			<label>PassWord</label><br>
			<input type="password" name="pass" class="pass"  /></br>
			<br><input type= "submit" value= "Valider" /></br>  
		</form>
	
		</h3></div>
		
	</body>
</html>


