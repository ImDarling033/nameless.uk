<?php

include_once "$racine/modele/bd.utilisateur.inc.php";

// creation du menu burger
$menuBurger = array();
$menuBurger[] = Array("url"=>"./?action=connexion","label"=>"Connexion");
$menuBurger[] = Array("url"=>"./?action=inscription","label"=>"Inscription");


$inscrit = false;
$msg="";
// recuperation des donnees GET, POST, et SESSION
if (isset($_POST["mailU"]) && isset($_POST["mdpU"]) && isset($_POST["pseudoU"])) {

    if ($_POST["mailU"] != "" && $_POST["mdpU"] != "" && $_POST["pseudoU"] != "") {
        $mailU = $_POST["mailU"];
        $mdpU = crypt($_POST["mdpU"], 'rl'); // Utilisation de crypt() pour hacher le mot de passe avec un sel
        $pseudoU = $_POST["pseudoU"];

        // enregistrement des donnees
        $ret = addUtilisateur($mailU, $mdpU, $pseudoU);
        if ($ret) {
            $inscrit = true;
        } else {
            $msg = "l'utilisateur n'a pas été enregistré.";
        }
    }
 else {
    $msg="Renseigner tous les champs...";    
    }
}

if ($inscrit) {
    // appel du script de vue qui permet de gerer l'affichage des donnees
    $titre = "Inscription confirmée";
    include "$racine/vue/entete.html.php";
    include "$racine/vue/vueConfirmationInscription.php";
    include "$racine/vue/pied.html.php";
} else {
    // appel du script de vue qui permet de gerer l'affichage des donnees
    $titre = "Inscription pb";
    include "$racine/vue/entete.html.php";
    include "$racine/vue/vueInscription.php";
    include "$racine/vue/pied.html.php";
}
?>

