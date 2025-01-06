<script lang="js">
    import { VideoLinks, SiteLinks } from '$lib/index.js';

    let {isMobile = false} = $props();

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
        padding-top: 1rem;
        padding-bottom: 1rem;
    }

    .intro p, .outro p {
        line-height: var(--line-height-standard);
    }

    .intro h2, .outro h2 {
        font-family: var(--font-special);
        text-rendering: optimizeLegibility;
        font-size: var(--banner-text-size);
    }



    .intro p, h2, .outro p, h2 {
        padding-left: 2rem;
        padding-right: 2rem;
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
        <a href={SiteLinks.about} class="promotion-text">
            <p>Infinite Opportunity</p>
        </a>
    </div>

    <div class="promotion-video">
        <video autoplay muted loop playsinline>
            <source src={VideoLinks.people} type="video/mp4" />
        </video>
        <a href={SiteLinks.staff} class="promotion-text">
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

    <div class="outro">
        <h2>Visit Us</h2>
        <p>Even if you don't want to join, drop by and say hi. Orion Lab offers something for everyone, whether that be friends, fun, or fictional doomsday plans</p>
    </div>
</section>
