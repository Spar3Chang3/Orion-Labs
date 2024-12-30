<script lang="js">
	import { SocialLinks } from '$lib/index.js';

	let {isMobile = false} = $props();

</script>

<style lang="css">

		.footer {
				display: grid;
				grid-template-columns: 33% 66%;
				grid-template-rows: 1fr;
				height: 15vh;
				width: 100vw;

				background-color: grey;
		}

	.copyright {
			font-size: .7rem;
			color: darkgray;
			padding-left: 1rem;
	}
	.copyright a {
			text-decoration: none;
			color: gray;
	}

</style>

<section class="footer">
	<div class="copyright">
		<p>© 2024 Orion Labs - All Rights Thought About</p>
		<p>This site is available for viewing at <a href={SocialLinks.github}>GitHub.com</a></p>
	</div>
	<div class="social-shelf">

	</div>
</section>