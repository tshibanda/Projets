afficher = function(){

				setTimeout(function() {
					document.getElementById("adGIF").style.display = "inline";
				}, 500);

				setTimeout(function() {
					document.getElementById("redirection").onclick= gifi();

				}, 6000);

			setTimeout(function() {
					document.getElementById("adGIF").style.display = "none";
					document.getElementById("adPNG").style.display = "inline";
				}, 9000); //6500 ou 9500 


			setTimeout(function() {
					document.getElementById("adPNG").style.display = "none";
					document.getElementById("contenu").style.display = "inline";
					document.getElementById("dispMenu").style.display = "inline";

				}, 12000); 

			}

			document.getElementById("adGIF").onload = afficher();


function fermeture1(){
		document.getElementById("adGIF").style.display="none";
		document.getElementById("adPNG").id="ad3";
		document.getElementById("contenu").style.display = "inline";
		document.getElementById("dispMenu").style.display = "inline";


	}

	

function fermeture2(){
		document.getElementById("adPNG").style.display="none";
		document.getElementById("contenu").style.display = "inline";

	}

	function gifi(){
		document.getElementById("redirection").href="http://www.gifi.fr";
	}
