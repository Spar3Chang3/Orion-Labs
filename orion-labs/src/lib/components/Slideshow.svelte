<script>
	import { onMount } from "svelte";
	import PhotoSwipeLightbox from "photoswipe/lightbox";
	import "photoswipe/style.css";

	export let galleryID;
	export let directoryURL; // URL of the directory containing images
	export let imageNumber

	let images = [];
	let currentIndex = 0; // Tracks the current image in the slideshow
	let lightbox;

	// Fetch images from the directory listing
	async function fetchImages() {
		try {
			const response = await fetch(directoryURL);
			const text = await response.text();

			// // Parse directory listing
			// const parser = new DOMParser();
			// const doc = parser.parseFromString(text, "text/html");
			// const imageLinks = Array.from(doc.querySelectorAll("a"))
			// 	.map((link) => link.href)
			// 	.filter((url) => /\.(jpg|jpeg|png|gif|webp)$/i.test(url)); //So I guess this is regex but js. Yummy

			for (let i=0;i<imageNumber;i++) {
				images.push({
					largeURL: `${directoryURL}/slideshow${i}.png`,
					width: 0,
					height: 0,
				})
			}

		} catch (error) {
			console.error("Error fetching directory listing:", error);
		}
	}

	// Dynamically determine image dimensions
	async function fetchImageDimensions(image) {
		return new Promise((resolve) => {
			const img = new Image();
			img.onload = () => resolve({ width: img.width, height: img.height });
			img.onerror = () => resolve({ width: 0, height: 0 }); // Handle errors gracefully
			img.src = image.largeURL;
		});
	}

	async function populateDimensions() {
		for (let image of images) {
			const dimensions = await fetchImageDimensions(image);
			image.width = dimensions.width;
			image.height = dimensions.height;
		}
	}

	// Preload the next image in the slideshow
	//What's wrong with it tho. How index out of bounds
	function preloadImage(index) {
		if (index >= 0 && index < images.length) {
			const img = new Image();
			img.src = images[index].largeURL;
		}
	}

	// Navigate to the next image
	function nextSlide() {
		currentIndex = (currentIndex + 1) % images.length; // Loop back to start
		preloadImage(currentIndex + 1);
	}

	// Navigate to the previous image
	function previousSlide() {
		currentIndex = (currentIndex - 1 + images.length) % images.length; // Loop to end
		preloadImage(currentIndex - 1);
	}

	function preloadInitialImages() {
		if (images.length > 0) {
			preloadImage(currentIndex); // Current image
			preloadImage((currentIndex + 1) % images.length); // Next image
			preloadImage((currentIndex - 1 + images.length) % images.length); // Previous image (wrap around)
		}
	}

	// Initialize PhotoSwipe
	async function initLightbox() {
		lightbox = new PhotoSwipeLightbox({
			gallery: "#" + galleryID,
			children: "a",
			pswpModule: () => import("photoswipe"),
		});
		lightbox.init();
	}

	// Lifecycle: Fetch images, populate dimensions, and initialize the lightbox
	onMount(async () => {
		await fetchImages();
		await populateDimensions();
		preloadInitialImages();
		await initLightbox();

		return () => {
			if (lightbox) {
				lightbox.destroy();
			}
		};
	});
</script>

<style>
    .slideshow-container {
        width: 100%;
        max-width: 800px;
        margin: auto;
        position: relative;
        background: black;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .slideshow-image {
        width: 100%;
        object-fit: contain; /* Ensure the image scales nicely */
        aspect-ratio: 16 / 9; /* Set a consistent aspect ratio */
    }

    .controls {
        display: flex;
        justify-content: space-between;
        margin-top: 10px;
        width: 100%;
    }

    .control-button {
        padding: 10px 20px;
        background-color: #333;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }

    .control-button:hover {
        background-color: #555;
    }
</style>

<div class="slideshow-container">
	{#if images.length > 0}
		<a
			href={images[currentIndex].largeURL}
			data-pswp-width={images[currentIndex].width}
			data-pswp-height={images[currentIndex].height}
			target="_blank"
			rel="noreferrer"
		>
			<img
				src={images[currentIndex].largeURL}
				alt="slideshow"
				class="slideshow-image"
			/>
		</a>
		<div class="controls">
			<button class="control-button" on:click={previousSlide}>Previous</button>
			<button class="control-button" on:click={nextSlide}>Next</button>
		</div>
	{/if}
</div>
