<?php

include_once "bd.inc.php";

function getCommentaire($idResto) {
    $resultat = array();

    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select * from commentaire join utilisateur on commentaire.idUser= utilisateur.idUser where idResto=:idResto");
        $req->bindValue(':idResto', $idResto, PDO::PARAM_INT);
        $req->execute();
        
        $ligne = $req->fetch(PDO::FETCH_ASSOC);
        while ($ligne) {
            $resultat[] = $ligne;
            $ligne = $req->fetch(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

function addCommentaire($com, $idUser, $dateHeureCom, $idResto, $id) {
    try {
        $cnx = connexionPDO();

        $req = $cnx->prepare("insert into commentaire (com, idUser, dateHeureCom, idResto, id) values(:com, :idUser, :dateHeureCom, :idResto, :id)");
        $req->bindValue(':com', $com, PDO::PARAM_STR);
        $req->bindValue(':idUser', $idUser, PDO::PARAM_INT);
        $req->bindValue(':dateHeureCom', $dateHeureCom, PDO::PARAM_STR);
        $req->bindValue(':idResto', $idResto, PDO::PARAM_INT);
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        
        $resultat = $req->execute();
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

?>