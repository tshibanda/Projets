
<?php  




	echo ("<h2>Au revoir M. ou Mdme " . $_SESSION['login']. "</h2>");
	session_destroy();
	require("vue/utilisateur/ident.tpl");
	

?>