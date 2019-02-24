<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Dossier Etudiant</title>
		<link rel="stylesheet" href="/vue/styleCSS/style.css"/>
		<link rel="stylesheet" href="./vue/styleCSS/dossieretu.css"/>
		<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- <script src="script.js"></script> -->
	</head>
	<body style="background-image:url(./vue/images/imagefond.jpg">
		</div>
	<style>

.menu{
    height: 70px;
    background: #9b0d0d!important;
    box-shadow: 0px 1px 5px 0px black;
    margin-bottom: 10%;
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

<body style="background-image:url(vue/images/imagefond.jpg">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top menu">
        <div class="container">
        <a href="#" class="navbar-brand">Gestion emploie du temps</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                   <li class="nav-item"><a class="nav-link" href="index.php?controle=utilisateur&action=accueilEtu">Acceuil</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=EDTetu&action=creneau">Emploie du temps</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=AffichDossierEtu&action=dossieret">Mon profil</a></li>
                    <li><a class="nav-link" href="index.php?controle=editionprofil&action=editerprofil">Editer mon profil</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=AfficherProf&action=ContactProf">Listes des professeurs</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=utilisateur&action=bye">Déconnexion</a></li>
                </ul>
            </div>
        </div>
    </nav>

		 
		<
			<?php
				if ($dossieretu != false) {
				?>
				<h2 id="Titre" align="center" >Profil</h2>
					<h4 align="left" id ="Etat" >Etat civil :</h4>
					
					
						<div id="Bloc"> 
						<img align="right"id="img"type="file" name="urlPhoto" src="<?php foreach ($dossieretu as $c) {echo $c['urlPhoto'];} ?>">
						<ul float="left" id="group"class="list-group list-group-striped">
  									<li class="list-group-item"> Nom : <?php foreach ($dossieretu as $c) {
						echo "<tr class='contact'>";
						echo ($c['nom'])  ;}?></li>
  									<li class="list-group-item">Prenom :<?php foreach ($dossieretu as $c) {
						echo "<tr class='contact'>";
						echo ($c['prenom']);}?></li> 
  									<li class="list-group-item">Email :<?php foreach ($dossieretu as $c) {
						echo "<tr class='contact'>";
						echo ($c['email']);} ?></li> 
  									<li class="list-group-item">Login :<?php foreach ($dossieretu as $c) {
						echo "<tr class='contact'>";
						echo ($c['login_etu']);} ?></li> 
  									<li class="list-group-item">Date d'inscription :<?php foreach ($dossieretu as $c) {
						echo "<tr class='contact'>";
						echo ($c['date_etu']);} ?></li> 
						</ul>
						</div>
						
						
						
						
						<a align="center" id="btn"href="index.php?controle=editionprofil&action=editerprofil" class="btn btn-default">Editer son profil</a
					
						
					
					<?php
					}
					
				else echo ('pas de dossier');
			?>
			

	</body>
</html>