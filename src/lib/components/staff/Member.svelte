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
<a href={url} target="_blank" aria-label={`View more about ${name}, ${role}`}>
	<div class="member {prefersReducedMotion ? '' : 'animate'}" style="animation-delay: {prefersReducedMotion ? '0' : animationDelay}s" role="group" aria-label={`${name}, ${role}`}>
		<div class="portrait-container" aria-label={`${name}'s portrait`}>
			<img src={portrait} alt={`Portrait of ${name}`} />
			<h2 aria-label="Staff name">{name}</h2>
		</div>
		<div class="content" aria-label="Staff details">
			<h3 aria-label="Role">{role}</h3>
			<p aria-label="Biography">{bio}</p>
		</div>
	</div>
</a>