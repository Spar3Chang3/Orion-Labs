<script lang="js">

	function handleButton(event) {
		window.open("/landing-page", "_self");
	}
</script>

<div>
	<button on:click={handleButton}>Press Me</button>
	<p>
		This is a test page for little debugging, to continue to the main page please press the button
	</p>
	<p>
		Go on
	</p>
	<p style="color: red">
		DO IT
	</p>
</div>

<style lang="css">

		div {
				display: flex;
				flex-direction: column;
				align-items: center;
				height: 150vh;

				font-size: x-large;
		}

	button {
			background-color: #3232a1;
			border: none;
			color: white;
			text-align: center;
			font-family: System UI, serif;
			font-size: xx-large;
			border-radius: 6px;

			height: fit-content;
			width: fit-content;
			padding: 1rem;
	}
</style>