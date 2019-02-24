<!doctype html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Doosier Etudiant</title>
      <link rel="stylesheet" href="/vue/styleCSS/style.css"/>
      <link rel="stylesheet" href="./vue/styleCSS/dossieretu.css"/>
      <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet">
      <!-- <script src="script.js"></script> -->
   </head>
   <body style="background-image:url(./vue/images/imagefond.jpg">
         <style>

.menu{
    height: 70px;
    background: #9b0d0d!important;
    box-shadow: 0px 1px 5px 0px black;
    margin:auto;
}
.navbar-dark .navbar-nav .nav-link {
    color: rgb(255, 255, 255);
    letter-spacing: 1px;
}
.navbar-dark .navbar-nav .nav-link:hover {
    border-bottom: 3px solid white;
}

#Titre{
  margin-top: 10%;
}

</style>
     
 <nav>

<?php require("vue/layout/menuEtu.tpl"); ?>

</nav>
      
       
      <div align="center" id="main">
        <?php if(isset($_SESSION['msg'])){
        echo($_SESSION['msg']);
        $_SESSION['msg']=null;
      }
         ?>
            <fieldset align="center"id="Titre"class="form-group">
            <h2 id="">Edition de mon profil</h2>
               <div align="left">
                
            <form  align="center" method="POST" action="index.php?controle=editionprofil&action=editerprofil2">
               <label> Photo de Profil: </label>
         <input type="file" name="urlPhoto"/></label><br /><br />
               <label>Email :</label>
               <input align="left"type="email" name="newemail" placeholder="Email" value=""><br/><br/>
                  <label>Mot de passe :</label>
               <input align="left"type="password" name="mdp1" placeholder="Nouveau Mot de passe"><br/><br/>
               <label>Nouveau mot de passe :</label>
               <input align="left" type="password" name="mdp2" placeholder="Confirmer votre mot de passe"><br/><br/>
               <input align="left" type="submit" value="Confirmer"><br/>


               
            </form>
               </div>
               
               
         

         

   </body>
</html>
