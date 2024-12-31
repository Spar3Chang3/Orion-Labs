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
        --banner-standard: #003366;
        --banner-accent: #0073e6;

        overflow-x: hidden;
    }

    :global(html, body) {
        margin: 0;
    }

    main {
        min-height: 79.8vh;
        max-height: fit-content;
    }
    @media (prefers-color-scheme: dark) {
        main.adaptive {
            background-color: #2B2B2B;
            /*--banner-standard: #003366; should these be changed? Why are they root variables? Is that the right way to do it?*/
            /*--banner-accent: #0073e6;*/
        }
    }


</style>

<header>
    <Header {isMobile}/>
</header>
<main class="adaptive">
    {#if children}
        {@render children({ isMobile })}
    {:else}
        <p>502</p>
    {/if}
</main>
<footer>
    <Footer {isMobile}/>
</footer>