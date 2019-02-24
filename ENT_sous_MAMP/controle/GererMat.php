<?php

session_start();

function Responsable(){
		require ("modele/GererMatBD.php") ;
//		echo("USER".$_SESSION['login']);
				unset($_SESSION['videM']); 

		$MatResp=estResponsable($_SESSION['login']); 

		if($MatResp != false){

			require('vue/professeur/MatiereAGerer.tpl');

		}
		else{

			require('vue/professeur/AccesInterdit.tpl');

		}


}

function ModMat(){

		require ("modele/GererMatBD.php") ;

			if($_POST['Mid_mat']==0){
		$MatResp=estResponsable($_SESSION['login']); 
				//$_SESSION['videM']=true;
			require('vue/professeur/MatiereAGerer.tpl');

		}
		else{
			$index_mat=$_SESSION['Mid_mat'][$_POST['Mid_mat']-1];
					echo($index_mat);
			$_SESSION['index_mat']=$index_mat;		


					//fonction æ coder pour les modif de la matiere

					require('vue/professeur/modifMat.tpl');

		}



}

function majMat(){
			require ("modele/GererMatBD.php") ;

			$Maj=Maj($_SESSION['index_mat']);



}
