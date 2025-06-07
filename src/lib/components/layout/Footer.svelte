<script lang="js">
	import { SocialLinks, IconLinks } from '$lib/index.js';
	import { onMount } from 'svelte';

	let { prefersDarkMode = false } = $props();
	let githubLogo = $derived((prefersDarkMode ? IconLinks.github.dark : IconLinks.github.light));
	let uisLogo = $derived((prefersDarkMode ? IconLinks.uis.dark : IconLinks.uis.light));
	let currentYear = $state();

	onMount(() => {
		currentYear = new Date().getFullYear();
	});

</script>

<style lang="css">

    .footer {
        display: grid;
        grid-template-columns: 66% 34%;
        grid-template-rows: 1fr;
        min-height: 50px;
        max-height: 10vh;
        width: 100vw;

        background-color: var(--background-secondary);
        font-family: Hacked, sans-serif;
        border-top: 0.1vh solid var(--banner-accent);
    }

	.copyright {
			display: flex;
			flex-direction: column;
      min-height: 50px;
			max-height: 10vh;

			justify-content: center;
			align-items: flex-start;
			text-align: center;

			font-size: 1rem;
			color: grey;
			padding-left: 1rem;
	}
	.copyright a {
			text-decoration: none;
			color: var(--hyperlink);
	}

	.social-shelf {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr 1fr;
			grid-template-rows: 1fr;
			height: 10vh;
      min-height: 50px;
			width: 100%;

			justify-content: center;
			justify-items: center;
			align-items: center;
	}

	.social-shelf a {
			height: 6vh;
			width: 6vh;
			max-height: 4rem;
			max-width: 4rem;
	}

	.social-shelf a > img {
			height: 100%;
			width: 100%;
			object-fit: contain;
			transition: 100ms ease;
	}

	.social-shelf a > img:hover {
			transform: scale(1.1);
	}

	@media only screen and (max-width: 768px) {
			.footer {
					grid-template-columns: 1fr;
					grid-template-rows: 1fr 1fr;

					max-height: fit-content;

					justify-items: center;
			}

			.copyright {
					width: 100%;
					align-items: center;
					padding: 0;
			}

			.social-shelf {
					width: 100%;

					justify-items: center;
			}

	}
</style>

<section class="footer" role="contentinfo" aria-label="Site footer with copyright and social media">
	<div class="copyright" aria-label="Copyright and repository link">
		<p>
			&copy; {currentYear} Orion Labs – All Rights Thought About
			<br />
			This site is available for viewing at
			<a href={SocialLinks.github} target="_blank" aria-label="View site source on GitHub">
				GitHub.com
			</a>
		</p>
	</div>

	<div class="social-shelf" role="navigation" aria-label="Social media links">
		<a href={SocialLinks.github} target="_blank" aria-label="Orion Labs GitHub profile">
			<img src={githubLogo} alt="GitHub Logo" />
		</a>

		<a href={SocialLinks.discord} target="_blank" aria-label="Join Orion Labs on Discord">
			<img src={IconLinks.discord} alt="Discord Logo" />
		</a>

		<a href={SocialLinks.gmaps} target="_blank" aria-label="View Orion Labs on Google Maps">
			<img src={IconLinks.gmaps} alt="Google Maps Logo" />
		</a>

		<a href={SocialLinks.uishome} target="_blank" aria-label="Visit University of Illinois Springfield homepage">
			<img src={uisLogo} alt="UIS Logo" />
		</a>
	</div>
</section>
