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

	.about {
			display: flex;
			flex-direction: column;
			color: var(--text-standard);
      background-color: var(--background-standard);

			min-height: 79.8vh;
			max-height: fit-content;
			width: 100vw;

			align-items: center;
	}

	.content {
			display: flex;
			flex-direction: column;

			height: 100%;
			width: 100%;
			line-height: var(--line-height-standard);
			font-family: var(--font-standard);
	}

	.about h2 {
			height: fit-content;
			width: 100vw;

			background-color: var(--banner-standard);
			padding: 2rem;
			color: whitesmoke;
			font-family: var(--font-special);
			font-size: var(--banner-text-size);
			margin: 0 auto;
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
<section class="about">
	<h2>
		About Orion Lab
	</h2>
	<div class="content">
		<p class="about-text" style="white-space: pre; text-wrap: wrap">
			{aboutText}
		</p>
		<p class="ascii" style="white-space: pre; text-wrap: wrap">
			{asciiArt}
		</p>
	</div>
</section>