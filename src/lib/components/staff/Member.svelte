<script lang="js">
	import '$lib/index.css';
	let { name, role, bio, portrait, url, prefersReducedMotion, animationDelay } = $props();

</script>

<style lang="css">
	.member {
			display: grid;
			grid-template-columns: auto;
			grid-template-rows: 2fr 1fr;

			height: 25rem;
			width: 20rem;

			justify-content: center;
			justify-items: center;
			align-items: center;

			background-color: var(--banner-standard);
			border: 0.1rem solid var(--banner-accent);
			color: whitesmoke;
			font-family: Roboto, sans-serif;
			padding: 1rem;
	}

	.portrait-container {
			display: flex;
			flex-direction: column;

			height: 100%;
			width: 100%;

			justify-content: center;
			align-items: center;


			overflow: hidden;
  }

	.portrait-container img {
			height: 164px;
			width: 164px;
			object-fit: cover;
      border: 0.1rem solid var(--banner-accent);
			box-shadow: 1rem 1rem var(--banner-accent);
			margin-bottom: 0.25rem;
	}

	.portrait-container h2 {
			font-family: Hacked, sans-serif;
			font-size: 2rem;
	}
	.content {
      display: flex;
      flex-direction: column;

      height: 100%;
      width: 100%;

      justify-content: center;
      align-items: center;
	}
	a {
			text-decoration: none;
	}
</style>
<a href={url} target="_blank">
<div class="member {prefersReducedMotion ? '' : 'animate'}" style="animation-delay: {prefersReducedMotion ? '0' : animationDelay}s">
	<div class="portrait-container">
		<img src={portrait} alt="Staff Member Portrait" />
		<h2>{name}</h2>
	</div>
	<div class="content">
		<h3>{role}</h3>
		<p>{bio}</p>
	</div>
</div>
</a>