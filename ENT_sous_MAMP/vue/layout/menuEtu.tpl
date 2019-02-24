
<html>

<head>
	<head>
		<meta charset="utf-8">

		<link rel="stylesheet" href="./vue/styleCSS/etu.css"/>
	
	
        

<body style="background-image:url(vue/images/imagefond.jpg">

		<div id="bienvenue" style="color:black">
       <?php echo("<h2> Bienvenue sur votre espace étudiant " . $_SESSION['login']. "</h2>");
	
	   ?>
	      </div>
	<style>

.menu{
    height: 70px;
    background: #9b0d0d!important;
    box-shadow: 0px 1px 5px 0px black;
    margin-bottom: 10%;
    font-size: smaller;
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
  <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top menu">
        <div class="container">
        <a href="#" class="navbar-brand">Gestion emploi du temps</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                   <li class="nav-item"><a class="nav-link" href="index.php?controle=utilisateur&action=accueilEtu">Accueil</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=EDTetu&action=creneau"> Emploi du temps</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=AffichDossierEtu&action=dossieret">Profil</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=editionprofil&action=editerprofil">Editer mon profil</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=AfficherProf&action=ContactProf">Listes des professeurs</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?controle=utilisateur&action=bye">Déconnexion</a></li>
                </ul>
            </div>
        </div>
    </nav>			
					
					<!-- </li></ul> -->
				</div> <!-- fin id=menu -->





 </body>
</html>