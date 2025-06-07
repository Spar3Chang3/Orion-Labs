<svelte:head>
    <!-- Prefetch images -->
    <link rel="prefetch" href="/assets/about-text-break.jpg" as="image" />
    <link rel="prefetch" href="/assets/alert.png" as="image" />
    <link rel="prefetch" href="/assets/among-us.svg" as="image" />
    <link rel="prefetch" href="/assets/crewmate.png" as="image" />
    <link rel="prefetch" href="/assets/fortnite.jpg" as="image" />
    <link rel="prefetch" href="/assets/github-logo-dark.svg" as="image" />
    <link rel="prefetch" href="/assets/github-logo-light.svg" as="image" />
    <link rel="prefetch" href="/assets/google-maps-logo.svg" as="image" />
    <link rel="prefetch" href="/assets/discord-logo.svg" as="image" />
    <link rel="prefetch" href="/assets/alert-triangle.svg" as="image" />
    <link rel="prefetch" href="/assets/orion-lab-logo-dark.svg" as="image" />
    <link rel="prefetch" href="/assets/orion-lab-logo-light.svg" as="image" />
    <link rel="prefetch" href="/assets/uis-logo-dark.svg" as="image" />
    <link rel="prefetch" href="/assets/uis-logo-light.svg" as="image" />
    <link rel="prefetch" href="/assets/sus.png" as="image" />

    <!-- Prefetch video -->
    <link rel="prefetch" href="/assets/3d-print-broll.mp4" as="video" />
    <link rel="prefetch" href="/assets/people-broll.mp4" as="video" />
    <link rel="prefetch" href="/assets/teaching-broll.mp4" as="video" />

    <!-- Prefetch audio -->
    <link rel="prefetch" href="/assets/nope-wrong.mp3" as="audio" />
    <link rel="prefetch" href="/assets/sus.mp3" as="audio" />
    <link rel="prefetch" href="/assets/yippee.mp3" as="audio" />

    <!-- Prefetch text/data -->
    <link rel="prefetch" href="/data/aboutUs1.txt" as="fetch" />
    <link rel="prefetch" href="/data/aboutUs2.txt" as="fetch" />
    <link rel="prefetch" href="/data/staffList.json" as="fetch" />
    <link rel="prefetch" href="/data/trimmedascii-gif.txt" as="fetch" />

    <!-- Prefetch portraits -->
    <link rel="prefetch" href="/data/Daryk.jpg" as="image" />
    <link rel="prefetch" href="/data/Edward.jpg" as="image" />
    <link rel="prefetch" href="/data/JoshSmith.jpg" as="image" />
    <link rel="prefetch" href="/data/Brian.jpg" as="image" />

    <!-- Prefetch font -->
    <link rel="prefetch" href="/fonts/cringe.ttf" as="font" type="font/ttf" crossorigin="anonymous" />
</svelte:head>
<script lang="js">
    import Header from '$lib/components/layout/Header.svelte';
    import Footer from '$lib/components/layout/Footer.svelte';
    import { onMount } from 'svelte';

    let { children } = $props();

    let isMobile = $state(false);
    let prefersDarkMode = $state(false);

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
        --hyperlink: #c8b18b;
        --line-height-standard: 1.75rem;
        --font-standard: sans-serif;
        --font-special: Hacked, sans-serif;

        --banner-text-size: 2.5rem;


        overflow-x: hidden;

        @media (prefers-color-scheme: dark) {
            --background-standard: #2B2B2B;
            --background-secondary: #1A1A1A;

            --text-standard: #FFFFFF;
        }

        background-color: var(--background-secondary);
    }

    :global(html, body) {
        margin: 0;
    }

    main {
        min-height: 79.8vh;
        max-height: fit-content;
        background-color: var(--background-standard);
        overflow-x: hidden;
    }

</style>

<header>
    <Header isMobile={isMobile} prefersDarkMode={prefersDarkMode}/>
</header>
<main class="adaptive">
    {#if children}
        {@render children()}
    {:else}
        <p>502</p>
    {/if}
</main>
<footer>
    <Footer prefersDarkMode={prefersDarkMode}/>
</footer>