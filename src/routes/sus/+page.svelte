<script lang="js">
	import { onMount } from 'svelte';

	let x = $state(0);
	let y = $state(0);

	onMount(() => {
		const handleMouseMove = (event) => {
			x = event.pageX;
			y = event.pageY;
		};

		window.addEventListener('mousemove', handleMouseMove);

		let sus = new Audio("/assets/sus.mp3");
		sus.volume = 0.35;
		sus.play();
		return () => {
			window.removeEventListener('mousemove', handleMouseMove);
			sus.pause();
			sus = null;
		};
	});
</script>

<style lang="css">
    body {
        margin: 0;
        padding: 0;
    }
    section {
        position: relative;
        width: 100%;
        height: 79.8vh;
        background-image: url('/assets/sus.png');
        background-size: contain;
				background-repeat: no-repeat;
        overflow: hidden;
    }
    .overlay {
        background: #000;
        width: 100%;
        height: 79.8vh;
    }
    .light {
        position: absolute;
        width: 100%;
        height: 100%;
    }

    .overlay {
        display: none;
    }

    .light {
        background: radial-gradient(circle at 0 0, transparent, #000 30%);
    }
</style>

<section class="sus">
	<div class="light" style={`background: radial-gradient(circle at ${x}px ${y}px, transparent, #000 30%)`}></div>
	<div class="overlay"></div>
</section>