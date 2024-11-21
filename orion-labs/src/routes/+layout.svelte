<script lang="js">
	import Header from '$lib/components/Header.svelte';
</script>
<style lang="css">
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


</style>
<header>
	<Header />
</header>

<main>
	<slot />
</main>

<footer>
<p>ball</p>
</footer>