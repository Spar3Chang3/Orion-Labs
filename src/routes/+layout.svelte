<script lang="js">
    import Header from '$lib/components/layout/Header.svelte';
    import Footer from '$lib/components/layout/Footer.svelte';
</script>

<style lang="css">
    :global(html, body) {
        margin: 0;
    }
</style>

<header>
    <Header/>
</header>
<main>
    <slot/>
</main>
<footer>
    <Footer/>
</footer>