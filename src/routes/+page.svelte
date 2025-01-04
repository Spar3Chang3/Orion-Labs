<meta http-equiv="Refresh" content="4;/landing-page">
<style>
	.redirect {
			display: flex;
			flex-direction: column;

			height: 79.8vh;
			width: 100vw;

			justify-content: center;
			align-items: center;

			color: var(--text-standard);
			background-color: var(--background-standard);
	}
	.content {
			display: flex;
			flex-direction: column;

			justify-content: center;
			align-items: center;
			text-align: center;

      font-family: var(--font-special);

			font-size: var(--banner-text-size);
			animation: glitch .4s infinite alternate;
	}

  @keyframes glitch {
      0% {
          text-shadow: -4px 6px 0 var(--banner-accent), 4px -6px 0 var(--banner-standard);
          transform: translateY(-0.5rem);
      }
      40% {
          text-shadow: 4px -6px 0 var(--banner-standard), -4px 6px 0 var(--banner-accent);
      }
      70% {  text-shadow: none; transform: none; }
  }

</style>
<title>Connecting to page</title>

<section class="redirect">
	<div class="content">
		<h1>You are being redirected</h1>
		<h2>Please wait...</h2>
	</div>
</section>