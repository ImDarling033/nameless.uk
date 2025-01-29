<h1><?= htmlspecialchars($unResto['nomR']); ?></h1>

<section>
    Cuisine <br />
</section>
<p id="principal">   
    <?= htmlspecialchars($unResto['descR']); ?>
</p>
<p id="principal">
    <?php if (count($lesPhotos) > 0) { ?>
        <img src="photos/<?= htmlspecialchars($lesPhotos[0]["cheminP"]) ?>" alt="photo du restaurant" />
    <?php } ?>
</p>

<h2 id="adresse">
    Adresse
</h2>
<p>
    <?= htmlspecialchars($unResto['numAdrR']); ?>
    <?= htmlspecialchars($unResto['voieAdrR']); ?><br />
    <?= htmlspecialchars($unResto['cpR']); ?>
    <?= htmlspecialchars($unResto['villeR']); ?><br/>
    <?= htmlspecialchars($unResto['telR']); ?>
</p>

<h2 id="photos">
    Photos
</h2>
<ul id="galerie">
    <?php for ($i = 0; $i < count($lesPhotos); $i++) { ?>
        <li> <img class="galerie" src="photos/<?= htmlspecialchars($lesPhotos[$i]["cheminP"]) ?>" alt="" /></li>
    <?php } ?>
</ul>

<h2 id="crit">Critiques</h2>
<ul id="critiques">

    <form method="POST" action="./?action=detail&idR=<?php echo $idR; ?>" >

        <input type="text" name="com" placeholder="Commentaire" required /><br />
        <input type="hidden" name="idR" value="<?= htmlspecialchars($_GET['idR']) ?>" /> <!-- ID du restaurant -->
        <input type="submit" name="Envoyer" value="Envoyer" />

    </form>

    <?php foreach ($commentaires as $com): ?>
        <div class="">
            <strong><?= htmlspecialchars($com['pseudoU']) ?></strong>
            <p><?= htmlspecialchars($com['com']) ?></p>
            <small><?= htmlspecialchars($com['dateHeureCom']) ?></small>
        </div>
    <?php endforeach; ?>

</ul>
