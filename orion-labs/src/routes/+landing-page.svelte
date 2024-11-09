<!-- src/App.svelte -->
<script>
    let features = [
        { title: "Real-time Collaboration", description: "Work together seamlessly, no matter where you are." },
        { title: "AI-Powered Insights", description: "Get actionable insights powered by advanced AI." },
        { title: "Secure Communication", description: "Your data is safe with end-to-end encryption." },
    ];
</script>

<style>
    main {
        text-align: center;
        padding: 2rem;
        background: url('/path-to-your-abstract-background.jpg') no-repeat center center fixed;
        background-size: cover;
        color: white;
    }

    h1 {
        font-size: 3rem;
        margin-bottom: 1rem;
    }

    .feature {
        margin: 2rem 0;
        padding: 1rem;
        background: rgba(0, 0, 0, 0.5);
        border-radius: 10px;
    }
</style>

<main>
    <header>

    </header>

    <section>
        {#each features as feature}
            <div class="feature">
                <h2>{feature.title}</h2>
                <p>{feature.description}</p>
            </div>
        {/each}
    </section>

    <footer>
        <p>© 2024 Orion Labs. All rights reserved.</p>
    </footer>
</main>
