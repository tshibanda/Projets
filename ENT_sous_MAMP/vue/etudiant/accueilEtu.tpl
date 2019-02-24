
<html>

<head>
	<head>
		<meta charset="utf-8">
		<title>page d'accueil des etudiant</title>
		
		<link rel="stylesheet" href=./vue/styleCSS/style.css"/>
		<link rel="stylesheet" href=./vue/styleCSS/etu.css"/>
		<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        
        <!-- mobile specific info ... mobile specify windows size to 800/900 whereas device-width is less in general, resulting in small texte etc.- those meta correct this... -->
        <meta name="HandheldFriendly" content="true" />
        <meta name="viewport" content="width=device-width, height=device-height, user-scalable=no" />
        <!-- end mobile specific info -->
 
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- <script src="script.js"></script> -->
	</head>

	<style>
.menu{
    height: 70px;
    background: #9b0d0d!important;
    box-shadow: 0px 1px 5px 0px black;
}
.navbar-dark .navbar-nav .nav-link {
    color: rgb(255, 255, 255);
    letter-spacing: 1px;
}
.navbar-dark .navbar-nav .nav-link:hover {
    border-bottom: 3px solid white;
}
.jumbotron{
	margin-top: 15%;
	margin-left: 30%;
	width: 50%;
}
</style>
 
    
       ?>
<body style="background-image:url(vue/images/imagefond.jpg">
  <nav>

<?php require("vue/layout/menuEtu.tpl"); ?>

</nav>
		<h2 align="center"class="jumbotron">Bienvenue sur votre gestionnaire d'emploi du temps</h2>

</body>
</html>