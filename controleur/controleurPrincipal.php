<?php

function controleurPrincipal($action){
    $lesActions = array();
    $lesActions["defaut"] = "listeRestos.php";
	$lesActions["notFound"] = "notFound.php";
    $lesActions["accueil"] = "listeRestos.php";
    $lesActions["detail"] = "detailResto.php";
    $lesActions["connexion"] = "connexion.php";
    $lesActions["deconnexion"] = "deconnexion.php";
    $lesActions["profil"] = "monProfil.php";
    $lesActions["inscription"] = "inscription.php";
    $lesActions["condition"] = "condition.php";
	
    
    if (array_key_exists ( $action , $lesActions )){
        return $lesActions[$action];
    }
    else{
        return $lesActions["notFound"];
    }

}

?>