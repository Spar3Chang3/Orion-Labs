<script lang="js">
    import { onMount } from 'svelte';
    import { VideoLinks } from '$lib/index.js';

    let {isMobile} = $props();
</script>
<style lang="css">
    .landing-page {
        display: flex;
        flex-direction: column;
        height: 100%;
        width: 100vw;

        justify-content: center;
        align-items: center;
    }

    .intro {
        position: relative;
        display: flex;
        flex-direction: column;
        height: fit-content;
        width: 100%;

        padding: 0.5rem;
        background-color: grey;
    }

    .intro h2, .intro p {
        padding-left: 0.5rem;
        padding-right: 0.5rem;
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
        z-index: -1;
    }

    .promotion-text {
        display: flex;
        min-height: 720px;
        width: 100vw;

        justify-content: center;
        align-items: center;

        text-decoration: none;

        font-family: Hacked, sans-serif;
        font-size: 4rem;
        color: whitesmoke;
        text-shadow: 2px 2px 4px var(--banner-accent);
    }

</style>

<section class="landing-page">
    <div class="intro">
        <h2>Where Innovation Meets Collaboration</h2>
        <p>Welcome to the University of Illinois-Springfield's (UIS) Computer Science Department, home to the cutting-edge Orion Lab. Since its grand opening in January 2023, the Orion Lab has been fostering a vibrant hub of research, education, and recreation, conveniently nestled in the lower level of the Health and Sciences Building (HSB). As a dynamic space designed to adapt to the evolving needs of our esteemed UIS community, the Orion Lab is poised to ignite endless possibilities.&nbsp; </p>
    </div>

    <div class="promotion-video">
        <video autoplay muted loop playsinline>
            <source src={VideoLinks.printer} type="video/mp4" />
        </video>
        <div class="promotion-text">
            <p>Infinite Opportunity</p>
        </div>
    </div>

    <div class="promotion-video">
        <video autoplay muted loop playsinline>
            <source src={VideoLinks.people} type="video/mp4" />
        </video>
        <a href="/staff" class="promotion-text">
            <p>Passionate People</p>
        </a>
    </div>

    <div class="promotion-video">
        <video autoplay muted loop playsinline>
            <source src={VideoLinks.teaching} type="video/mp4" />
        </video>
        <div class="promotion-text">
            <p>Actual Answers</p>
        </div>
    </div>
</section>
