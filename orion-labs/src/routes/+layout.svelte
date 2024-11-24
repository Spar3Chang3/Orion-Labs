<script lang="js">
	import Header from '$lib/components/Header.svelte';
	import Footer from '$lib/components/Footer.svelte';

</script>


<style lang="css">
	:global(body) {
			margin: 0;
	}

	:root {

			/* #01447b - blue, #c8b08a - liver disease poop brown, #fefefe - White */
			--primary-color: null;
			--secondary-color: null;
			--primary-top: null;
			--secondary-top: null;
			--primary-text-color: null;
			--secondary-text-color: null;
			--tertiary-color: null;
			--highlight-color: null;

	}


	.layout {
			position: relative;
			display: flex;
			flex-direction: column;

			min-height: 100vh;
			max-width: 100vw;
			margin: 0 auto;
			overflow-x: hidden;
			background-color: #4747b8;
	}

	main {
			display: flex;
			flex-direction: column;
			min-height: 80vh;
			width: 100vw;

			justify-content: center;
			justify-items: center;
			align-content: center;
			align-items: center;
	}
</style>

<div class="layout">
	<header>
		<Header />
	</header>

	<main>
		<slot />
	</main>

	<footer>
		<Footer />
	</footer>
</div>