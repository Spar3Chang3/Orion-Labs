<style lang="css">
	.load-container {
      display: grid;

      height: 79.8vh;
      width: 100vw;

			place-items: center;
	}

  .loader {
      width: 6rem;
      height: 6rem;
      stroke: #0073e6;
      animation: spin 1s linear infinite;
  }

  @keyframes spin {
      from {
          transform: rotate(0deg);
      }
      to {
          transform: rotate(360deg);
      }
  }

</style>
<div class="load-container">
	<svg class="loader" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg" fill="none">
		<circle
			cx="25"
			cy="25"
			r="20"
			stroke-width="5"
			stroke-linecap="round"
			stroke-dasharray="90 150"
		>
		</circle>
	</svg>
</div>