<script lang="js">
	import { SocialLinks, IconLinks } from '$lib/index.js';

	let {isMobile = false} = $props();

</script>

<style lang="css">


    @media (prefers-color-scheme: dark) {
        .footer.adaptive {
            background-color: black;
            border-top: 0.1vh solid #F0F0F0;
            filter: brightness(100%);/*For some fucking reason applying a filter forces this to display above the darkness in the amongus page*/
        }
        .copyright.adaptive {
            color: white;


        }
        .copyright.adaptive a {
            text-decoration: none;
            color: lightsalmon;
        }
				.social-shelf img {
						/*Should this only affect the github logo? That's the one that needs it.*/
						filter: brightness(150%);
						/*filter: invert(1);*/
            /*filter: drop-shadow(0 0 5px white)*/
				}

    }
    .footer {
        display: grid;
        grid-template-columns: 66% 34%;
        grid-template-rows: 1fr;
        min-height: 50px;
        max-height: 10vh;
        width: 100vw;

        background-color: white;
        font-family: Hacked, sans-serif;
        border-top: 0.1vh solid #1a1a1a;
    }

	.copyright {
			display: flex;
			flex-direction: column;
      min-height: 50px;
			max-height: 10vh;

			justify-content: center;
			align-items: flex-start;

			font-size: 1rem;
			color: grey;
			padding-left: 1rem;
	}
	.copyright a {
			text-decoration: none;
			color: rebeccapurple;
	}

	.social-shelf {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr 1fr;
			grid-template-rows: 1fr;
			height: 10vh;
      min-height: 50px;
			width: 100%;

			justify-content: center;
			align-items: center;
	}

	.social-shelf a {
			height: 6vh;
			width: 6vw;
	}

	.social-shelf a > img {
			height: 100%;
			width: 100%;
			object-fit: contain;
			transition: 100ms ease;
	}

	.social-shelf a > img:hover {
			transform: scale(1.1);
	}

</style>

<section class="footer adaptive">
	<div class="copyright adaptive">
		<p>© 2024 Orion Labs - All Rights Thought About <br>This site is available for viewing at <a href={SocialLinks.github}>GitHub.com</a></p>
	</div>
	<div class="social-shelf adaptive">

		<a href={SocialLinks.github} target="_blank">
			<img src={IconLinks.github} alt="Github Logo"/>
		</a>

		<a href={SocialLinks.discord} target="_blank">
			<img src={IconLinks.discord} alt="Discord Logo"/>
		</a>

		<a href={SocialLinks.gmaps} target="_blank">
			<img src={IconLinks.gmaps} alt="Google Maps"/>
		</a>

		<a href={SocialLinks.uishome} target="_blank">
			<img src={IconLinks.uis} alt="UIS Home" />
		</a>
	</div>
</section>