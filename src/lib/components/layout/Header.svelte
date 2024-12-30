<script lang="js">
	import { SiteLinks } from '$lib/index.js';
	import { onMount } from 'svelte';

	let {isMobile = false} = $props();

</script>

<style lang="css">

	.navbar {
			display: grid;
			grid-template-columns: 33% 66%;
			grid-template-rows: 1fr;

			height: 15vh;
			width: 100vw;
      background-color: grey;

	}
	.img-container {
			max-height: 12vh;
			padding: 10px;
	}

	.img-container > a > img {
			height: 100%;
			width: 100%;
			object-fit: contain;
	}
	.nav-item {
			display: flex;
			flex-direction: row;
			height: 100%;
			width: 100%;
			text-decoration: none;
			justify-content: center;
			align-items: center;

	}
	.nav-item a {
			text-decoration: none;
      color: black;
	}
</style>

<section class="navbar">
	<div class="img-container">
		<a href={SiteLinks.landingPage} >
		<img src="/assets/OrionLabLogo.svg" alt="Orion Labs Logo">
		</a>
	</div>
	<div class="navigation">
		<div class="nav-item">
			<p><a href={SiteLinks.sus}> amogus</a></p>
		</div>
	</div>
</section>
