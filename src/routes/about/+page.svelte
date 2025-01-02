<script lang="js">
	import { onMount } from 'svelte';
	import { DataLinks } from '$lib/index.js';


	let aboutText = $state("");
	let asciiArt = $state("");

	async function  getAboutText() {
		fetch(DataLinks.about).then((res) => {
			return res.text();
		}).then((data) => {
			aboutText = data;
		});
	}
	async function  getAsciiArt() {
		fetch(DataLinks.asciiart).then((res) => {
			return res.text();
		}).then((data) => {
			asciiArt = data;
		});
	}

	onMount(() => {
		getAboutText();
		getAsciiArt();
	});

</script>
<style lang="css">
    @import url('https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap');

	.aboutUs {
			display: flex;
			color: var(--text-standard);
      background-color: var(--background-standard);

			min-height: 79.8vh;
			max-height: fit-content;
			width: 100vw;

			justify-content: center;
	}

	.content {
			display: flex;
			flex-direction: column;

			height: 100%;
			width: 100%;
			line-height: var(--line-height-standard);
	}

	.content h2 {
			background-color: var(--banner-standard);
			padding: 2rem;
			color: whitesmoke;
			font-family: var(--font-special);
	}

	.ascii {
      padding: 0 2rem 2rem 2rem;
      font-family: "Roboto Mono", serif;
      font-optical-sizing: auto;
      font-weight: 400;
      font-style: normal;
			text-align: center;
	}
	.about-text{
      padding: 2rem 2rem 0 2rem;
			font-family: var(--font-standard);
	}

</style>
<section class="aboutUs">
	<div class="content">
		<h2>
			About Orion Lab
		</h2>
		<p class="about-text" style="white-space: pre; text-wrap: wrap">
			{aboutText}
		</p>
		<p class="ascii" style="white-space: pre; text-wrap: wrap">
			{asciiArt}
		</p>
	</div>
</section>