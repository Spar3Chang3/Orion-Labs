<script lang="js">
	import { page } from '$app/state';
	import { IconLinks } from '$lib/index.js';
</script>

<style lang="css">
	.error {
			display: flex;
			flex-direction: column;

			min-height: 79.8vh;
			width: 100vw;

			justify-content: center;
			align-items: center;
			text-align: center;

      font-family: var(--font-special);
			color: var(--text-standard);
	}

	.error-content {
			display: flex;
			flex-direction: row;
			width: fit-content;

			font-size: 2rem;
			animation: glitch .5s infinite alternate;
	}

	.error-symbol {
			height: 15vh;
	}

	.error-symbol img {
			height: 100%;
			width: 100%;
	}

  @keyframes glitch {
      0% {
          text-shadow: -4px 6px 0 var(--banner-accent), 4px -6px 0 var(--banner-standard);
          transform: translateY(-0.5rem);
      }
      40% {
          text-shadow: 4px -6px 0 var(--banner-standard), -4px 6px 0 var(--banner-accent);
      }
      70% {  text-shadow: none; transform: none; }
  }
</style>

<section class="error">
	<div class="error-symbol">
		<img src={IconLinks.alert} alt="Alert Icon"/>
	</div>
	<div class="error-content">
		<h2>{page.status}</h2>
		<h1>&nbsp;│&nbsp;</h1>
		<h2>{page.error.message}</h2>
	</div>
</section>