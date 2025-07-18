<script lang="js">
    import { onMount } from 'svelte';
    import { VideoLinks, SiteLinks } from '$lib/index.js';
    import '$lib/index.css';

    let prefersReducedMotion = $state(false);
    let prefersContrast = $state(false);

    onMount(() => {
        prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
        prefersContrast = window.matchMedia("(prefers-contrast: more)").matches;

        console.log(prefersReducedMotion);
    });
</script>
<style lang="css">
    .landing-page {
        display: flex;
        flex-direction: column;
        height: 100%;
        width: 100vw;

        justify-content: center;
        align-items: center;
        background-color: var(--background-standard);
    }

    .intro, .outro {
        position: relative;
        display: flex;
        flex-direction: column;
        height: fit-content;
        width: 100%;

        flex-wrap: wrap;
        background-color: var(--banner-standard);
        color: whitesmoke;
        font-family: var(--font-standard);
        padding-bottom: 1rem;
    }

    .intro p, .outro p {
        line-height: var(--line-height-standard);
        font-size: 1.15rem;
    }

    .intro h2, .outro h2 {
        font-family: var(--font-special);
        text-rendering: optimizeLegibility;
        font-size: var(--banner-text-size);
    }



    .intro p, h2, .outro p, h2 {
        padding-left: 2rem;
        padding-right: 2rem;
        margin-bottom: 0.5rem;
    }

    .promotion-video {
        position: relative;
        display: flex;
        height: fit-content;
        width: 100%;

        justify-content: center;
        align-items: center;
    }
    .promotion-video video {
        position: absolute;
        height: 100%;
        width: 100%;

        object-fit: cover;
        z-index: 1;
    }

    .promotion-text {
        display: flex;
        min-height: 720px;
        width: 100vw;

        justify-content: center;
        align-items: center;
        text-align: center;

        text-decoration: none;

        font-family: var(--font-special);
        font-size: 4rem;
        color: whitesmoke;
        text-shadow: 4px 4px 2px var(--banner-accent);
        z-index: 2;
    }

    .hero-blur {
        backdrop-filter: blur(6px);
        -webkit-backdrop-filter: blur(6px); /* Safari support */

        background-color: rgba(0, 115, 230, 0.25); /* semi-transparent for contrast */
        padding: 2rem 3rem;
    }

    @media only screen and (max-width: 768px) {
        .hero-blur {
            padding: 1.25rem 1.5rem;
        }
    }
</style>

<section class="landing-page" aria-label="Landing page for the Orion Lab at UIS">
    <div class="intro" aria-label="Introduction section">
        <h2 aria-label="Section heading">Where Innovation Meets Collaboration</h2>
        <p aria-label="Introductory description">
            Welcome to the University of Illinois-Springfield's (UIS) Computer Science Department, home to the cutting-edge Orion Lab. Since its grand opening in January 2023, the Orion Lab has been fostering a vibrant hub of research, education, and recreation, conveniently nestled in the lower level of the Health and Sciences Building (HSB). As a dynamic space designed to adapt to the evolving needs of our esteemed UIS community, the Orion Lab is poised to ignite endless possibilities.
        </p>
    </div>

    <div class="promotion-video" aria-label="Promotional video: Infinite Opportunity">
        <video autoplay="{!prefersReducedMotion}" muted loop playsinline aria-hidden="true">
            <source src={VideoLinks.printer} type="video/mp4" />
        </video>
        <a href={SiteLinks.about} class="promotion-text" aria-label="Learn more about the Orion Lab">
            <p class="hero-blur" aria-label="Promotional message" style="{prefersContrast ? 'background-color: var(--banner-accent)' : ''}">Infinite Opportunity</p>
        </a>
    </div>

    <div class="promotion-video" aria-label="Promotional video: Passionate People">
        <video autoplay="{!prefersReducedMotion}" muted loop playsinline aria-hidden="true">
            <source src={VideoLinks.people} type="video/mp4" />
        </video>
        <a href={SiteLinks.staff} class="promotion-text" aria-label="Meet the Orion Lab staff">
            <p class="hero-blur" aria-label="Promotional message" style="{prefersContrast ? 'background-color: var(--banner-accent)' : ''}">Passionate People</p>
        </a>
    </div>

    <div class="promotion-video" aria-label="Promotional video: Actual Answers">
        <video autoplay="{!prefersReducedMotion}" muted loop playsinline aria-hidden="true">
            <source src={VideoLinks.teaching} type="video/mp4" />
        </video>
        <div class="promotion-text" aria-label="Highlight: Actual Answers">
            <p class="hero-blur" aria-label="Promotional message" style="{prefersContrast ? 'background-color: var(--banner-accent)' : ''}">Actual Answers</p>
        </div>
    </div>

    <div class="outro" aria-label="Closing message section">
        <h2 aria-label="Section heading">Visit Us</h2>
        <p aria-label="Closing invitation">
            Even if you don't want to join, drop by and say hi. Orion Lab offers something for everyone, whether that be friends, fun, or fictional doomsday plans
        </p>
    </div>
</section>

