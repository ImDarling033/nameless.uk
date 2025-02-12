<?php

include_once "bd.inc.php";

function deleteResto($telR, $idR){
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("delete resto where idR=:idR");
        $req->bindValue(':idR', $idR, PDO::PARAM_INT);

        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

?>