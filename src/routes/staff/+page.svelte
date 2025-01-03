<script lang="js">
	import { onMount } from 'svelte';
	import { DataLinks } from '$lib/index.js';
	import Member from '$lib/components/staff/Member.svelte';

	let staff = $state([]);

	async function getStaff() {
		await fetch(DataLinks.staff).then((res) => {
			return res.json();
		}).then((data) => {
			staff = data;
		}).catch((err) => {
			console.error("Could not fetch the corresponding staff data: ", err);
		})
	}

	onMount(() => {
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
			width: 100%;

			padding: 2rem;
			margin: 0 auto;

			background-color: var(--banner-standard);
			font-family: var(--font-special);
			font-size: var(--banner-text-size);
			color: var(--text-standard);
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
	<h2>Staff Members</h2>
	<div class="content">
		{#each staff as member}
			<Member name={member.name} role={member.role} bio={member.bio} portrait={member.portrait} url={member.url} />
		{/each}
	</div>
</section>