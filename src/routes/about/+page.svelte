<script lang="js">
	import { onMount } from 'svelte';
	import { DataLinks } from '$lib/index.js';

	let aboutText = $state("");
	let asciiPrint = $state("Ascii Loading...");
	let ascii = $state([]);
	let interval = $state();
	let index = $state(0);

	async function  getAboutText() {
		fetch(DataLinks.about).then((res) => {
			return res.text();
		}).then((data) => {
			aboutText = data;
		});
	}

	// async function  getAsciiArt() {
	// 	fetch(DataLinks.asciiart).then((res) => {
	// 		return res.text();
	// 	}).then((data) => {
	// 		asciiArt = data;
	// 	});
	// }

	async function getAndParseAsciiArt() {
		await fetch(DataLinks.ascii).then((res) => {
			return res.text();
		}).then((data) => {
			ascii = data.split('~~~');
		}).catch((err) => {
			console.error("Could not fetch the corresponding ascii data: ", err);
		});
	}

	onMount(() => {
		getAboutText();
		getAndParseAsciiArt().then(() => {
			interval = setInterval(() => {
				asciiPrint = ascii[index];
				index++;
				index = (index % ascii.length);
			}, 100);
		});

		return(() => {
			if (interval) {
				clearInterval(interval);
			}
		});
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

	.license {
			padding: 1rem;
			z-index: 10;
	}

	.ascii-wrapper {
			position: relative;
			display: flex;
      flex-direction: column;

      justify-content: center;
      align-items: center;
			overflow: hidden;
	}

	.license a {
			color: var(--hyperlink);
			text-decoration: none;
	}

	.ascii {
			position: relative;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 35vh;

			overflow: hidden;
			text-wrap: nowrap;
      font-family: "Roboto Mono", serif;
      font-optical-sizing: auto;
      font-weight: 400;
			font-size: 0.4rem;
			line-height: 0.5rem;
      font-style: normal;
	}

	.about-text {
      padding: 2rem 2rem 0 2rem;
			font-family: var(--font-standard);
	}

	@media only screen and (max-width: 768px) {
			.ascii {
					height: 40vh;
			}
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
		<div class="ascii-wrapper">
			<p class="ascii" style="white-space: pre; text-wrap: nowrap">
				{asciiPrint}
			</p>
			<p class="license"><a href="https://skfb.ly/oPTUp" target="_blank">"old PC low poly game model"</a> by creosine is licensed under <a href="http://creativecommons.org/licenses/by/4.0/" target="_blank">Creative Commons Attribution.</a> <br>This model has been transformed into a gif, then into ASCII. Why? I don't know, it looks cool.</p>
		</div>
	</div>
</section>