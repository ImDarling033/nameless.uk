
<h1><?= $unResto['nomR']; ?></h1>

<section>
    Cuisine <br />
	<!--
	<ul id="tagFood">
				
		<li class="tag">
			<span class="tag">#</span>
		</li>

	</ul>
	-->
</section>
<p id="principal">   
    <?= $unResto['descR']; ?>
</p>
<p id="principal">
    <?php if (count($lesPhotos) > 0) { ?>
        <img src="photos/<?= $lesPhotos[0]["cheminP"] ?>" alt="photo du restaurant" />
    <?php } ?>
</p>

<h2 id="adresse">
    Adresse
</h2>
<p>
    <?= $unResto['numAdrR']; ?>
    <?= $unResto['voieAdrR']; ?><br />
    <?= $unResto['cpR']; ?>
    <?= $unResto['villeR']; ?>
</p>

<h2 id="photos">
    Photos
</h2>
<ul id="galerie">
    <?php for ($i = 0; $i < count($lesPhotos); $i++) { ?>
        <li> <img class="galerie" src="photos/<?= $lesPhotos[$i]["cheminP"] ?>" alt="" /></li>
    <?php } ?>

</ul>

<h2 id="crit">Critiques</h2>
<ul id="critiques">
</ul>

