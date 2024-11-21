<script lang="js">
	import logo from "$lib/branding/OrionLabLogo.svg";
	import { socialLinks } from '$lib/utils.js';
</script>

<section class="main-header">
	<div class="header-content">
		<a href="https://uis.edu/orion-lab/" style="height: 100%; width: 100%;">
			<div class="logo" style="background-image: url({logo}); cursor: pointer;">
			</div>
		</a>

		<div class="nav-bar">
			<div class="site-links">
			</div>
			<div class="social-links">
				<div class="header-link">
					<a href={socialLinks.youtube} >YouTube</a> <a href={socialLinks.instagram}>Instagram</a>
				</div>
<!--				<div class="header-link"-->
<!--				</div>-->
			</div>
		</div>
	</div>

</section>

<style lang="css">
		a {
				text-decoration: none;
		}


	.main-header {

			position: relative;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 10vh;
			width: 100vw;
			font-size: 2rem;
	}
  .header-content {
			top: 0;
      background-color: #F4F4F4;
			position: fixed;
			display: inline-grid;
      grid-template-columns: auto auto;
			/*justify-content: flex-start; !*This will matter when we add more divs and content*!*/
			align-items: center;
			height: 10vh;
			width: 100vw;
			padding: .5rem;
  }
	.logo {
			justify-self: flex-start;
			height: inherit;
			width: 33vw;
			/*min-height: 10vh;*/
			/*aspect-ratio: auto;*/
			background-size: contain;
			background-position: center;
			background-repeat: no-repeat;
	}

	.nav-bar {
			justify-self: flex-end;
	}

	.header-link {
			width: fit-content;
			margin: 0;

	}
	@media only device and (max-width: 768px) {
			.main-header {
					font-size: 1.5rem;
			}
	}
</style>