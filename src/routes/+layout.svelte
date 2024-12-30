<script lang="js">
    import Header from '$lib/components/layout/Header.svelte';
    import Footer from '$lib/components/layout/Footer.svelte';
    import { onMount } from 'svelte';

    let { children } = $props();

    let isMobile = $state(false);

    onMount(() => {
        isMobile = window.matchMedia('(max-width: 768px)').matches;
    });
</script>

<style lang="css">

    @font-face {
        font-family: "Hacked";
        src: url("/fonts/cringe.ttf") format("truetype");
        font-weight: normal;
        font-style: normal;
        font-display: swap;
    }

    :root {
        --background-standard: ;
    }

    :global(html, body) {
        margin: 0;
    }

    main {
        min-height: 70vh;
        overflow-x: hidden;
    }

</style>

<header>
    <Header {isMobile}/>
</header>
<main>
    {@render children({ isMobile })}
</main>
<footer>
    <Footer {isMobile}/>
</footer>