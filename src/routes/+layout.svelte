<script lang="js">
    import Header from '$lib/components/layout/Header.svelte';
    import Footer from '$lib/components/layout/Footer.svelte';
    import { onMount } from 'svelte';

    let { children } = $props();

    let isMobile = $state(false);
    let prefersDarkMode = $state(false);

    //Stolen from Claude? Perhaps. But I understand it and didn't want to write it all out
    //creates a query, then an event listener to change when updated
    //I may be able to just do this from $derived, but eh this works
    function setupMediaListeners() {
        const mobileQuery = window.matchMedia('(max-width: 768px)');
        const darkModeQuery = window.matchMedia('(prefers-color-scheme: dark)');

        // Set initial values
        isMobile = mobileQuery.matches;
        prefersDarkMode = darkModeQuery.matches;

        const updateMobile = (e) => isMobile = e.matches;
        const updateDarkMode = (e) => prefersDarkMode = e.matches;

        // Add listeners
        mobileQuery.addEventListener('change', updateMobile);
        darkModeQuery.addEventListener('change', updateDarkMode);

        // Return cleanup function
        return () => {
            mobileQuery.removeEventListener('change', updateMobile);
            darkModeQuery.removeEventListener('change', updateDarkMode);
        };
    }


    onMount(() => {
        const cleanup = setupMediaListeners();
        return cleanup;
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
        --background-standard: #F5F5F5;
        --background-secondary: #FFFFFF;

        --banner-standard: #003366;
        --banner-accent: #0073e6;

        --text-standard: #000000;

        overflow-x: hidden;

        @media (prefers-color-scheme: dark) {
            --background-standard: #2B2B2B;
            --background-secondary: #1A1A1A;

            --text-standard: #FFFFFF;
            main.adaptive {
                background-color: #2B2B2B;
            }
        }
    }

    :global(html, body) {
        margin: 0;
    }

    main {
        min-height: 79.8vh;
        max-height: fit-content;
    }


</style>

<header>
    <Header isMobile={isMobile} prefersDarkMode={prefersDarkMode}/>
</header>
<main class="adaptive">
    {#if children}
        {@render children({ isMobile })}
    {:else}
        <p>502</p>
    {/if}
</main>
<footer>
    <Footer isMobile={isMobile} prefersDarkMode={prefersDarkMode}/>
</footer>