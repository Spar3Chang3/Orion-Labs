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
			flex-direction: row;
			flex-wrap: wrap;

			min-height: 79.8vh;
			max-height: fit-content;
			width: 100vw;

			align-items: center;
			justify-content: center;
			gap: 1.5rem;
	}
</style>

<section class="staff">
	{#each staff as member}
		<Member name={member.name} role={member.role} bio={member.bio} portrait={member.portrait} />
	{/each}
</section>