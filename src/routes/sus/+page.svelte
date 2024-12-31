<script lang="js">
	import { onMount } from 'svelte';
	import confetti from 'canvas-confetti';

	let mouseX = $state(0);
	let mouseY = $state(0);

	let transX = $state(0);
	let transY = $state(0);

	let yippee = $state();
	let sus = $state();

	function getRandomInt(min, max) {
		if (min >= max) {
			return 8008135;
		}
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	function handleMouseMove(e) {
		mouseX = e.clientX;
		mouseY = e.clientY;
	}

	function handleSusClick(e) {
		yippee.play();
		confetti({
			origin: {
				x: e.clientX / window.innerWidth,
				y: e.clientY / window.innerHeight
			}
		});
	}

	onMount(() => {

		window.addEventListener('mousemove', handleMouseMove);

		transX = getRandomInt(0, 90);
		transY = getRandomInt(0, 70);

		sus = new Audio("/assets/sus.mp3");
		sus.volume = 0.35;
		sus.loop = true;
		sus.play();

		yippee = new Audio("/assets/yippee.mp3");

		return () => {
			window.removeEventListener('mousemove', handleMouseMove);
			sus.pause();
			sus = null;
		};
	});
</script>

<style lang="css">
    section {
        position: relative;
        width: 100%;
        height: 79.8vh;
        background-size: contain;
				background-repeat: no-repeat;
        overflow: hidden;
    }
		.find-me {
				position: absolute;
		}

		.find-me img {
				position: relative;
				height: 5vh;
				width: 5vw;
				object-fit: contain;
		}

    .overlay {
				display: none;
        background: #000;
        width: 100%;
        height: 79.8vh;
    }
    .light {
        position: fixed;
        width: 100%;
        height: 100%;
    }

		.clickable {
				position: fixed;
				z-index: 10;

				height: 5vh;
				width: 5vw;

				background: transparent;
				border: none;
				cursor: pointer;
		}
</style>

<section class="sus">
	<div class="find-me" style:transform="translate({transX}vw, {transY}vh)">
		<img src="/assets/sus.png" alt="Sussy Baka"/>
	</div>
	<!-- Gradient refuses to origin at mouse point and starts the circumference instead. I'm not smart enough to figure out the problem (probably the header) so I just added an offset -->
	<div class="light" style:background="radial-gradient(circle 6vh at {mouseX}px calc({mouseY}px - 10vh), transparent, #000)"></div>
	<div class="overlay"></div>
	<button class="clickable" onclick={handleSusClick} style:transform="translate({transX}vw, {transY}vh)" aria-label="Ghost Button">
	</button>
</section>