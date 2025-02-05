<?php

include_once "bd.inc.php";

function getUtilisateurByMailU($mailU) {
    $resultat = array();

    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select * from utilisateur where mailU=:mailU");
        $req->bindValue(':mailU', $mailU, PDO::PARAM_STR);
        $req->execute();
        
        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

function addUtilisateur($mailU, $mdpU, $pseudoU, $Perms) {
    try {
        $cnx = connexionPDO();

        $req = $cnx->prepare("insert into utilisateur (mailU, mdpU, pseudoU, Perms) values(:mailU,:mdpU,:pseudoU,:Perms)");
        $req->bindValue(':mailU', $mailU, PDO::PARAM_STR);
        $req->bindValue(':mdpU', $mdpU, PDO::PARAM_STR);
        $req->bindValue(':pseudoU', $pseudoU, PDO::PARAM_STR);
        $req->bindValue(':Perms', $Perms, PDO::PARAM_INT);
        
        $resultat = $req->execute();
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

?>