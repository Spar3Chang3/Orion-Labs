<script>

	let { isOpen = $bindable(), title = "Penis", showExitButton = false, showTitle = true, children } = $props();
	function closeModal() {
		isOpen = false;
	}

	function handleEscape(event) {
		if (event.key === 'Escape') {
			closeModal();
		}
	}

	// Close modal when clicking outside
	function handleOutsideClick(event) {
		if (event.target.classList.contains('modal-backdrop')) {
			closeModal();
		}
	}
</script>

<svelte:window onkeydown={handleEscape}/>

	<div
		class="modal-backdrop"
		style:visibility="{isOpen ? 'visible' : 'hidden'}"
		style:opacity="{isOpen ? 1 : 0}"
		onclick={handleOutsideClick}
		onkeydown={handleOutsideClick}
		role="tabpanel"
		aria-labelledby={showTitle ? "modal-title" : undefined}
		aria-label={!showTitle ? title : undefined}
		tabindex="0"
	>
		<div class="modal">
			{#if showTitle}
				<div class="modal-header">
					<h2 aria-label="Modal Title: {title}" aria-hidden="{showTitle}">{title}</h2>
					{#if showExitButton}
						<button class="close-button" onclick={closeModal} aria-label="Close modal">×</button>
					{/if}
				</div>
			{/if}
			<div class="modal-content" aria-label="Modal Content">
				{@render children()}
			</div>
		</div>
	</div>

<style>
    .modal-backdrop {
        position: fixed;
				top: 0;
				right: 0;
				height: 100%;
				width: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: space-evenly;
        align-items: flex-start;
        z-index: 100;

        color: var(--text-standard);

				transition: opacity 250ms;
				transform: translateY(10.1vh);
    }

    .modal {
				position: relative;
        background-color: var(--background-secondary);
        border-radius: 4px;
        width: 100vw;
        max-height: 90vh;
        overflow-y: auto;
				padding: 25px 0 25px 0;
    }

    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }

    .close-button {

        background: none;
        border: none;
        cursor: pointer;
        padding: 0;
        margin: 0;
				font-size: 2rem;
				color: var(--text-standard);
    }

    .close-button:hover {
        opacity: 0.7;
    }
</style>