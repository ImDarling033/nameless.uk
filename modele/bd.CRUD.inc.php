<?php

include_once "bd.inc.php";

function editResto($telR, $idR){
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("update resto set :telR where idR=:idR");
        $req->bindValue(':idR', $idR, PDO::PARAM_INT);
        $req->bindValue(':telR', $telR, PDO::PARAM_INT);

        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

?>