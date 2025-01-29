<?php
session_start();
include_once "$racine/modele/bd.resto.inc.php";
include_once "$racine/modele/bd.photo.inc.php";
include_once "$racine/modele/bd.comment.inc.php";

// creation du menu burger
$menuBurger = array();
$menuBurger[] = array("url"=>"#top","label"=>"Le restaurant");
$menuBurger[] = array("url"=>"#adresse","label"=>"Adresse");
$menuBurger[] = array("url"=>"#photos","label"=>"Photos");
$menuBurger[] = array("url"=>"#crit","label"=>"Critiques");

// recuperation des donnees GET, POST, et SESSION
$idR = $_GET["idR"];

// ajout du commentaire
if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST['com'])) {
    $com = htmlspecialchars($_POST['com']);
    $idUser = $_SESSION["idUser"] ; // Remplace par l'ID réel de l'utilisateur connecté
    $dateHeureCom = date("Y-m-d H:i:s");

    addCommentaire($com, $idUser, $dateHeureCom, $idR);
}

// appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
$unResto = getRestoByIdR($idR);
$lesPhotos = getPhotosByIdR($idR);
$commentaires = getCommentaire($idR);

// appel du script de vue qui permet de gerer l'affichage des donnees
$titre = "detail d'un restaurant";
include "$racine/vue/entete.html.php";
include "$racine/vue/vueDetailResto.php";
include "$racine/vue/pied.html.php";
?>
