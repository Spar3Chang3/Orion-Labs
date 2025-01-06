<script lang="js">
	import { SiteLinks, IconLinks } from '$lib/index.js';
	import Modal from '$lib/components/layout/Modal.svelte';
	import { afterNavigate } from '$app/navigation';
	import { onMount } from 'svelte';

	let {isMobile = false, prefersDarkMode = false} = $props();
	let orionLabLogo = $derived((prefersDarkMode ? IconLinks.orion.dark : IconLinks.orion.light));

	let isModalOpen = $state(false);

	function changeModalState(e) {
		e.preventDefault();
		isModalOpen = !isModalOpen;
	}

	afterNavigate(() => {
		isModalOpen = false;
	});

</script>

<style lang="css">

	.relative-navbar {
			display: block;

			min-height: 50px;
			height: 10vh;

			width: 100vw;
      background-color: var(--background-secondary);
			border-bottom: 0.1vh solid var(--banner-accent);
	}

	.fixed-navbar {
			position: fixed;
      display: grid;
      grid-template-columns: 34% 66%;
      grid-template-rows: 1fr;

      min-height: 50px;
      max-height: 10vh;

      width: 100vw;
      background-color: var(--background-secondary);
      border-bottom: 0.1vh solid var(--banner-accent);
			z-index: 10;
	}

	.portrait-container {
			position: relative;
			display: flex;
			height: 100%;
			width: 100%;
			justify-content: center;
			align-items: center;
			padding: 0 10px 10px 10px;
			object-fit: contain;
	}

	.portrait-container img {
			height: clamp(25px, 9vh, 9vh);
			width: 90%;
			object-fit: contain;
	}

  .navigation {
			position: relative;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(80px, 1fr));
      grid-template-rows: 1fr;

      height: 10vh;
			width: 100%;
      flex-grow: 1;
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
			color: var(--text-standard);
	}

	.navigation a:hover {
			animation: 1s glitch;
	}

	/*
		TODO:
		Add a glitch effect that looks like this: https://codepen.io/aldrie/pen/PojGYLo
		Currently, only stole the keyframes code for one part lmao, needs work
	*/

	@media only screen and (max-width: 768px) {
			.navigation-modal a{
					color: var(--text-standard);
			}
			.navigation {
					display: flex;
					align-items: center;
					justify-content: flex-end;
			}
			.button-container {
					position: fixed;
					padding: 10px;
					z-index: 100;
			}
			.nav-vis-button {
					height: 6vh;
					width: 6vh;

					background-color: var(--banner-standard);
          color:whitesmoke;
					border: 0.1vh solid var(--banner-accent);
					transition: 50ms ease;
			}
			.nav-vis-button:active {
					background-color: var(--banner-accent);
					transform: scale(0.90);
      }
	}

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

<section class="relative-navbar">
	<div class="fixed-navbar">
		<div class="portrait-container">
			<a href={SiteLinks.landingPage} >
				<img src={orionLabLogo} alt="Orion Labs Logo">
			</a>
		</div>
		{#if isMobile}
			<div class="navigation">
				<div class="button-container">
					<button class="nav-vis-button" onclick={changeModalState}>☰</button>
				</div>
				<div class="navigation-modal">
					<Modal bind:isOpen={isModalOpen} title={"I LOVE PENGIS"} showExitButton={false} showTitle={false}>
						<a href={SiteLinks.about}>About Us</a>
						<br/>
						<a href={SiteLinks.staff}>Staff</a>
						<br/>
						<a href={SiteLinks.sus}>amogus ඞ</a>
						<br/>
						<a href={SiteLinks.fortnite}>FORTNITE!!!</a>
					</Modal>
				</div>
			</div>
		{:else}
			<div class="navigation">
				<a href={SiteLinks.about}>About Us</a>
				<a href={SiteLinks.staff}>Staff</a>
				<a href={SiteLinks.sus}>amogus ඞ</a>
				<a href={SiteLinks.fortnite}>FORTNITE!!!</a>
			</div>
		{/if}
	</div>
</section>
