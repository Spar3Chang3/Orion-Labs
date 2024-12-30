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

			min-height: 30px;
			height: 10vh;
			/*min-height: 53px;*/
			width: 100vw;
      background-color: white;
	}

	.img-container {
			display: flex;
			height: 100%;
			width: 100%;
			justify-content: center;
			align-items: center;
			padding: 10px;
			object-fit: contain;
	}

	.img-container img {
			height: clamp(25px, 9vh, 9vh);
			width: 90%;
			object-fit: contain;
	}

  .navigation {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
      grid-template-rows: auto;

      height: 10vh;
			width: 100%;
  }

	.navigation a {
			display: flex;
			height: 100%;
			width: 100%;

			justify-content: center;
			align-items: center;

			font-family: Hacked, sans-serif;
			font-size: clamp(0.5rem, 2rem, 3rem);
			text-decoration: none;
			color: #1a1a1a;
	}

	.navigation a:hover {
			animation: 1s glitch;
	}

	/*
		TODO:
		Add a glitch effect that looks like this: https://codepen.io/aldrie/pen/PojGYLo
		Currently, only stole the keyframes code for one part lmao, needs work
	*/

	@keyframes glitch {
      0% {
          text-shadow: -4px 6px 0 var(--banner-accent), 4px -6px 0 var(--banner-standard);
          transform: translateY(-0.5rem);
      }
      20% {
          text-shadow: 4px -6px 0 var(--banner-standard), -4px 6px 0 var(--banner-accent);
      }
      30%, 100% {  text-shadow: none; transform: none; }
	}

</style>

<section class="navbar">
	<div class="img-container">
		<a href={SiteLinks.landingPage} >
		<img src="/assets/OrionLabLogo.svg" alt="Orion Labs Logo">
		</a>
	</div>
	<div class="navigation">
		<a href={SiteLinks.about}>About Us</a>
		<a href={SiteLinks.sus}>amogus</a>
		<a href={SiteLinks.susquared}>amogus ඞ</a>
	</div>
</section>
