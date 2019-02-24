<?php


function editionEtuProfil($login_etu) {
	
require('connect.php');

$msg=null;

if(isset($_SESSION['login'])) {
   $requser = $pdo->prepare("SELECT * FROM etudiant WHERE login_etu = ?");
   $requser->execute(array($_SESSION['login']));
   $infouser = $requser->fetch();


   if(isset($_POST['newemail']) AND !empty($_POST['newemail']) AND $_POST['newemail'] != $userinfo['email']) {
      $newmail = htmlspecialchars($_POST['newemail']);
      $insertmail = $pdo->prepare("UPDATE etudiant SET email = ? WHERE login_etu = ?");
      $insertmail->execute(array($newmail, $_SESSION['login']));
//header('Location:index.php?controle=AffichDossierEtu&action=dossieret');  
  }

  if(isset($_POST['mdp1']) AND !empty($_POST['mdp1']) AND isset($_POST['mdp2']) AND !empty($_POST['mdp2'])) {
      $mdp1 = $_POST['mdp1'];
      $mdp2 = $_POST['mdp2'];
      if($mdp1 == $mdp2) {
         $insertmdp = $pdo->prepare("UPDATE etudiant SET pass_etu = ? WHERE login_etu = ?");
         $insertmdp->execute(array($mdp1, $_SESSION['login']));
//header('Location:index.php?controle=AffichDossierEtu&action=dossieret');
      } else {
         $msg = "Vos 2 mots de passe ne sont pas identiques !";
      }
   }

   if(isset($_FILES['avatar']) AND !empty($_FILES['avatar']['name'])) {
   $tailleMax = 2097152;
   $extensionsValides = array('jpg', 'jpeg', 'gif', 'png');
   if($_FILES['avatar']['size'] <= $tailleMax) {
      $extensionUpload = strtolower(substr(strrchr($_FILES['avatar']['name'], '.'), 1));
      if(in_array($extensionUpload, $extensionsValides)) {
         $chemin = "vue/Images/".$_FILES['avatar']['name'].".".$extensionUpload;
         $resultat = move_uploaded_file($_FILES['avatar']['tmp_name'], $chemin);
         if($resultat) {
            $updateavatar = $pdo->prepare('UPDATE prof SET avatar = :avatar WHERE login_prof = ?');
            $updateavatar->execute(array(
               'avatar' => $_SESSION['login'].".".$extensionUpload,
               'login_prof' => $_SESSION['login']
               ));
//header('Location:index.php?controle=AffichDossierEtu&action=dossieret');
         } else {
            $msg = "Erreur durant l'importation de votre photo de profil";
         }
      } else {
         $msg = "Votre photo de profil doit être au format jpg, jpeg, gif ou png";
      }
   } else {
      $msg = "Votre photo de profil ne doit pas dépasser 2Mo";
   }
}

}

return $msg;
}


//      header('Location:index.php?controle=AffichDossierEtu&action=dossieret');

function editionProfProfil($login_etu) {
   
require('connect.php');

if(isset($_SESSION['login'])) {
   $requser = $pdo->prepare("SELECT * FROM prof WHERE login_prof = ?");
   $requser->execute(array($_SESSION['login']));
   $infouser = $requser->fetch();


   if(isset($_POST['newemail']) AND !empty($_POST['newemail']) AND $_POST['newemail'] != $userinfo['email']) {
      $newmail = htmlspecialchars($_POST['newemail']);
      $insertmail = $pdo->prepare("UPDATE prof SET email = ? WHERE login_prof = ?");
      $insertmail->execute(array($newmail, $_SESSION['login']));
      header('Location:index.php?controle=infoProf&action=infoProf');
  
  }

  if(isset($_POST['mdp1']) AND !empty($_POST['mdp1']) AND isset($_POST['mdp2']) AND !empty($_POST['mdp2'])) {
      $mdp1 = $_POST['mdp1'];
      $mdp2 = $_POST['mdp2'];
      if($mdp1 == $mdp2) {
         $insertmdp = $pdo->prepare("UPDATE prof SET pass_prof = ? WHERE login_prof = ?");
         $insertmdp->execute(array($mdp1, $_SESSION['login']));
      header('Location:index.php?controle=infoProf&action=infoProf');

      } else {
         $msg = "Vos 2 mot de passe ne sont pas identique!";
      }
   }

   if(isset($_FILES['avatar']) AND !empty($_FILES['avatar']['name'])) {
   $tailleMax = 2097152;
   $extensionsValides = array('jpg', 'jpeg', 'gif', 'png');
   if($_FILES['avatar']['size'] <= $tailleMax) {
      $extensionUpload = strtolower(substr(strrchr($_FILES['avatar']['name'], '.'), 1));
      if(in_array($extensionUpload, $extensionsValides)) {
         $chemin = "vue/Images/".$_FILES['avatar']['name'].".".$extensionUpload;
         $resultat = move_uploaded_file($_FILES['avatar']['tmp_name'], $chemin);
         if($resultat) {
            $updateavatar = $pdo->prepare('UPDATE prof SET avatar = :avatar WHERE login_prof = ?');
            $updateavatar->execute(array(
               'avatar' => $_SESSION['login'].".".$extensionUpload,
               'login_prof' => $_SESSION['login']
               ));
      header('Location:index.php?controle=infoProf&action=infoProf');

         } else {
            $msg = "Erreur durant l'importation de votre photo de profil";
         }
      } else {
         $msg = "Votre photo de profil doit être au format jpg, jpeg, gif ou png";
      }
   } else {
      $msg = "Votre photo de profil ne doit pas dépasser 2Mo";
   }
}

}
}
 ?>