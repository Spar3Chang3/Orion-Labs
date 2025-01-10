<script lang="js">
	import Matter from 'matter-js';
	import { onMount } from 'svelte';

	let Engine = $state();
	let Render = $state();
	let Runner = $state();
	let Bodies = $state();
	let Composite = $state();
	let Composites = $state();
	let Body = $state();
	let Constraint = $state();

	let engine = $state();
	let render = $state();
	let runner = $state();
	let world = $state();
	//https://github.com/liabru/matter-js/blob/master/examples/chains.js <-----
	function init() {
		Engine = Matter.Engine;
		Render = Matter.Render;
		Runner = Matter.Runner;
		Bodies = Matter.Bodies;

		Composite = Matter.Composite;
		Composites = Matter.Composites;
		Constraint = Matter.Constraint;
		Body = Matter.Body;


		engine = Engine.create();
		world = engine.world;

		render = Render.create({
			element: document.getElementById('physics'),
			engine: engine,
			options: {
				height: 862,
				width: 1920,
				showCollisions: true,
			}
		});

		Render.run(render);

		runner = Runner.create();
		Runner.run(runner, engine);
		//
		// let boxA = Bodies.rectangle(400, 200, 80, 80);
		// let boxB = Bodies.rectangle(450, 50, 80, 80);
		// let ground = Bodies.rectangle(450, 900, 900, 60, {
		// 	isStatic: true,
		// 	friction: 0.1,
		// 	render: {
		// 		fillStyle: '#FFFFFF'
		// 	}
		// });
		//
		// Composite.add(engine.world, [boxA, boxB, ground]);

		let group = Body.nextGroup(true);

		let anchor = { x: 450, y: 200 };

		let rope = Composites.stack(450, 200, 1, 5, 10, 10, function(x, y) {
			return Bodies.rectangle(x, y, 20, 50, { collisionFilter: { group: group } });
		});

		Composites.chain(rope, 0.5, 0, -0.5, 0, { stiffness: 0.8, length: 2, render: { type: 'line' } });
		Composite.add(rope, Constraint.create({
			bodyB: rope.bodies[0],
			pointB: { x: -25, y: 0 },
			pointA: anchor,
			// pointA: { x: rope.bodies[0].position.x, y: rope.bodies[0].position.y },
			stiffness: 0.5
		}));

		Composite.add(world, [rope]);
	}

	onMount(() => {
		init();
	});

</script>

<style>
	.physics {
			min-height: 79.8vh;
			width: 100vw;
	}
</style>

<section id="physics" class="physics">

</section>