<script lang="js">
	import { socialLinks, icons } from '$lib/utils.js';
</script>

<section class="main-header">

	<div class="header-content">

		<div class="spacer"></div>

		<div class="logo-container">
			<a href="https://uis.edu/orion-lab/">
				<img class="logo" src="{icons.orionLogo}" alt="brand logo"/>
			</a>
		</div>

		<div class="nav-bar">
			<div class="site-links">
			</div>
			<div class="social-links">
				<div class="header-link">
					<a href={socialLinks.youtube} >YouTube</a> <a href={socialLinks.instagram}>Instagram</a>
				</div>
			</div>
		</div>

		<div class="spacer"></div>

	</div>

</section>

<style lang="postcss">
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
			margin-bottom: 2rem;
      background-color: #F4F4F4;
  }

	.spacer {
			height: inherit;
	}

  .header-content {
			top: 0;
      background-color: #F4F4F4;
			position: fixed;
			display: inline-grid;
      grid-template-columns: 2.5vw auto auto 2.5vw;
			grid-template-rows: 10vh;
			height: 10vh;
			width: 100vw;
  }

		.logo-container {
				height: inherit;
				justify-self: flex-start;
		}

	.logo {
			height: 90%;
			width: 90%;
	}

	.nav-bar {
			display: grid;
			grid-template-columns: 1fr 1fr;
			align-content: center;
			justify-content: space-around;
			justify-self: flex-end;
	}

	.header-link {
			width: fit-content;
	}
	@media only device and (max-width: 768px) {
			.main-header {
					font-size: 1.5rem;
			}
	}
</style>