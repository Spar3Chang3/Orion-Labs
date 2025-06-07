<script lang="js">
	import { onMount } from 'svelte';
	import { DataLinks } from '$lib/index.js';
	import '$lib/index.css';
	import Loader from '$lib/components/layout/Loader.svelte';

	let aboutText1 = $state("");
	let aboutText2 = $state("");
	let asciiPrint = $state("Ascii Loading...");
	let ascii = $state([]);
	let interval = $state();
	let index = $state(0);

	let dataLoaded = $state(false);

	let prefersReducedMotion = $state();

	async function  getAboutText() {
		fetch(DataLinks.about1).then((res) => {
			return res.text();
		}).then((data) => {
			aboutText1 = data;
		}).then(() => {
			fetch(DataLinks.about2).then((res) => {
				return res.text();
			}).then((data) => {
				aboutText2 = data;
			}).then(() => {
				dataLoaded = true;
			});
		});

		//Is this dumb? yes. Does it work? I think so.
	}

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
		prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

		getAboutText();
		getAndParseAsciiArt().then(() => {
			if (prefersReducedMotion) {
				asciiPrint = ascii[0];
			} else {
				interval = setInterval(() => {
					asciiPrint = ascii[index];
					index++;
					index = (index % ascii.length);
				}, 100);
			}
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

	.about-text {
			line-height: var(--line-height-standard);
			font-size: 1.15rem;
	}

	.text-break-img {
			max-height: 16rem;
			width: auto;
			object-fit: contain;
			margin-top: 1rem;
	}

    .text-break-lbl {
        display: block;
        text-align: center;
        margin-bottom: -1rem;
        font-size: 0.9rem;
				color: var(--text-standard);
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
			min-height: 20rem;

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
<section class="about" aria-label="About Orion Lab section">
	{#if dataLoaded}
		<h2 aria-label="Section heading: About Orion Lab">
			About Orion Lab
		</h2>
		<div class="content" aria-label="About Orion Lab content">
			<p
				class="about-text {prefersReducedMotion ? '' : 'animate'}"
				style="white-space: pre; text-wrap: wrap;"
				aria-label="Introduction paragraph"
			>
				{aboutText1}
			</p>

			<img
				id="text-break"
				class="text-break-img {prefersReducedMotion ? '' : 'animate'}"
				src="/assets/about-text-break.jpg"
				alt="Group photo of Orion Lab attendees"
				aria-describedby="img-label"
				style="animation-delay: 0.15s"
			/>

			<label
				id="img-label"
				for="text-break"
				class="text-break-lbl {prefersReducedMotion ? '' : 'animate'}"
				style="animation-delay: 0.15s"
			>
				A picture of some of the Orion Lab attendees
			</label>

			<p
				class="about-text {prefersReducedMotion ? '' : 'animate'}"
				style="white-space: pre; text-wrap: wrap; animation-delay: 0.25s;"
				aria-label="Additional paragraph about Orion Lab"
			>
				{aboutText2}
			</p>

			<div
				class="ascii-wrapper {prefersReducedMotion ? '' : 'animate'}"
				style="animation-delay: 0.35s"
				role="region"
				aria-label="ASCII animation area"
			>
				<p
					class="ascii"
					style="white-space: pre; text-wrap: nowrap"
					aria-label="ASCII art animation"
				>
					{asciiPrint}
				</p>
				<p class="license" aria-label="License information">
					<a href="https://skfb.ly/oPTUp" target="_blank" aria-label="3D model link: old PC low poly game model">
						"old PC low poly game model"
					</a> by creosine is licensed under
					<a href="http://creativecommons.org/licenses/by/4.0/" target="_blank" aria-label="Creative Commons Attribution license">
						Creative Commons Attribution
					</a>.
					<br />
					This model has been transformed into a gif, then into ASCII. Why? I don't know, it looks cool.
				</p>
			</div>
		</div>
	{:else}
		<Loader aria-label="Loading about page content" />
	{/if}
</section>
