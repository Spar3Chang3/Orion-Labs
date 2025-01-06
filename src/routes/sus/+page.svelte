<script lang="js">
	import { onMount } from 'svelte';
	import confetti from 'canvas-confetti';
	import { IconLinks } from '$lib/index.js';

	const crewAmount = 30;

	let mouseX = $state(0);
	let mouseY = $state(0);

	let transX = $state(0);
	let transY = $state(0);

	let yippee = $state();
	let nope = $state();
	let sus = $state();

	let crewPos = $state([]);

	function getRandomInt(min, max) {
		if (min >= max) {
			return 8008135;
		}
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}

	function getRandomAvoidedInt(min, xMax, yMax, avoidedX, avoidedY) {
		let result = [];

		do {
			result[0] = getRandomInt(min, xMax);
			result[1] = getRandomInt(min, yMax);
		} while (Math.abs((result[0]/result[1]) - (avoidedX/avoidedY)) < 0.1);

		return result;
	}

	function handleMouseMove(e) {
		mouseX = e.clientX;
		mouseY = e.clientY;
	}

	function handleSusClick(e) {
		yippee.currentTime = 0;
		yippee.play();
		confetti({
			origin: {
				x: e.clientX / window.innerWidth,
				y: e.clientY / window.innerHeight
			}
		});
	}

	function handleCrewClick(e) {
		e.preventDefault();
		nope.currentTime = 0;
		nope.play();
	}

	function initCrew() {
		let tempX;
		let tempY;
		let cords;

		for (let i=0; i < crewAmount; i++) {
			cords = getRandomAvoidedInt(0, 100, 80, transX, transY); //Inputs: Min value (top-right) | max X | max Y | transformed X coordinates | Transformed Y coordinates.
			tempX = cords[0];
			tempY = cords[1];
			crewPos = [...crewPos, {
				x: tempX,
				y: tempY
			}];
		}
	}

	onMount(() => {

		window.addEventListener('mousemove', handleMouseMove);

		transX = getRandomInt(0, 90);
		transY = getRandomInt(0, 70);

		initCrew();

		sus = new Audio("/assets/sus.mp3");
		sus.volume = 0.35;
		sus.loop = true;
		sus.play();

		nope = new Audio("/assets/nope-wrong.mp3");
		nope.volume = 0.25;

		yippee = new Audio("/assets/yippee.mp3");

		return () => {
			window.removeEventListener('mousemove', handleMouseMove);
			sus.pause();
			sus = null;
			yippee = null;
		};
	});
</script>

<style lang="css">
		.sus {
				/*Force light background for the sanctity of the effect in dark mode.*/
				background-color: #FFFFFF;
		}

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
        width: 5vh;

        max-height: 4rem;
        max-width: 4rem;
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
        height: 79.8vh;
    }

		.clickable {
				position: fixed;
				z-index: 10;

				height: 5vh;
				width: 5vh;

				max-height: 4rem;
				max-width: 4rem;

				background: transparent;
				border: none;
				cursor: pointer;
		}
</style>

<section class="sus">
	<div class="find-me" style:transform="translate({transX}vw, {transY}vh)" style:scale="1.1">
		<img src="/assets/sus.png" alt="Sussy Baka"/>
	</div>
	{#each crewPos as crewmember}
		<div class="find-me" style:transform="translate({crewmember.x}vw, {crewmember.y}vh)">
			<img src={IconLinks.crew} alt="Chill Guy" style:filter="hue-rotate({getRandomInt(90, 300)}deg)"/>
		</div>
	{/each}
	<!-- Gradient refuses to origin at mouse point and starts the circumference instead. I'm not smart enough to figure out the problem (probably the header) so I just added an offset -->
	<div class="light" style:background="radial-gradient(circle 6vh at {mouseX}px calc({mouseY}px - 10vh), transparent, #000)"></div>
	<div class="overlay"></div>
	<button class="clickable" onclick={handleSusClick} style:transform="translate({transX}vw, {transY}vh)" style:scale="1.1" aria-label="Ghost Button">
	</button>
	{#each crewPos as crewmember}
		<button class="clickable" onclick={handleCrewClick} style:transform="translate({crewmember.x}vw, {crewmember.y}vh)" aria-label="Ghost Button"></button>
	{/each}
</section>