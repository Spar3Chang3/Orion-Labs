<script lang="js">

	let { name, role, bio, portrait } = $props();

</script>

<style lang="css">
	.member {
			display: grid;
			grid-template-columns: auto;
			grid-template-rows: 1fr 1fr;

			height: fit-content;
			width: 480px;

			justify-content: center;
			justify-items: center;
			align-items: center;

			background-color: var(--banner-standard);
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
			height: 128px;
			width: 128px;
			object-fit: cover;
      border: 0.1rem solid var(--banner-accent);
			box-shadow: 1rem 1rem var(--banner-accent);
	}

	.portrait-container h2 {
			font-family: Hacked, sans-serif;
			font-size: 2rem;
	}
</style>

<div class="member">
	<div class="portrait-container">
		<img src={portrait} alt="Staff Member Portrait" />
		<h2>{name}</h2>
	</div>
	<div class="content">
		<h3>{role}</h3>
		<p>{bio}</p>
	</div>
</div>