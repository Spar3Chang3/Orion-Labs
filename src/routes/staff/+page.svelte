<script lang="js">
	import { onMount } from 'svelte';
	import { DataLinks } from '$lib/index.js';
	import Member from '$lib/components/staff/Member.svelte';
	import Loader from '$lib/components/layout/Loader.svelte';

	let staff = $state([]);
	let dataLoaded = $state(false);
	let prefersReducedMotion = $state();

	async function getStaff() {
		await fetch(DataLinks.staff).then((res) => {
			return res.json();
		}).then((data) => {
			staff = data;
			dataLoaded = true;
		}).catch((err) => {
			console.error("Could not fetch the corresponding staff data: ", err);
		})
	}

	onMount(() => {
		prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
		getStaff();
	});

</script>

<style lang="css">

	.staff {
			display: flex;
			flex-direction: column;

			min-height: 79.8vh;
			max-height: fit-content;
			width: 100vw;

			align-items: center;
	}

	.staff h2 {
			height: fit-content;
			width: 100vw;

			padding: 2rem;
			margin: 0 auto;

			background-color: var(--banner-standard);
			font-family: var(--font-special);
			font-size: var(--banner-text-size);
			color: whitesmoke;
	}

	.content {
			display: flex;
			flex-direction: row;
			flex-wrap: wrap;

			height: 100%;
			width: 100%;

			justify-content: center;
			gap: 1.5rem;
			padding: 2rem;
			line-height: var(--line-height-standard);
	}
</style>

<section class="staff">
	{#if dataLoaded}
		<h2>Staff Members</h2>
		<div class="content">
			{#each staff as member, index}
				<Member name={member.name} role={member.role} bio={member.bio} portrait={member.portrait} url={member.url} prefersReducedMotion={prefersReducedMotion} animationDelay={0.1 * index} />
			{/each}
		</div>
	{:else}
		<Loader/>
	{/if}
</section>