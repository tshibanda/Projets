<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>formulaire d'identification</title>
		<link rel="stylesheet" href="vue/styleCSS/ident.css"/>
		<head>
		<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
		
</head>
		<!-- <script src="script.js"></script> -->
	</head>
	<body style="background-image:url(vue/images/imagefond.jpg">
	<div id="logo">
	<img src="vue/images/logodescartes.png">
	</div>
	
		<form action="index.php?controle=utilisateur&action=ident" method="post" id="formulaire"
		style="color:black;">
		
		  <div id="tout" style="text-align:center">
		
		<fieldset class="form-group">
		<img src="vue/images/Profil.png">
          <div id="auth"><h3>
			<label>Utilisateur</label><br>
			
			<input name="login" class="login" value="" /></br>
			<label>Mot de passe</label><br>
			<input type="password" name="pass" class="pass" value="" /></br>
			<br><button type= "submit"class="btn btn-lg   btn-outline-danger">Me connecter</button></br>  
	

		 </h3></div>
		</fieldset>
			</div>
	</body>
</html>


