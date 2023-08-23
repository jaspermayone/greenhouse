<script>
	import '@fontsource/aleo';
</script>

<div class="container">
	<slot />
</div>

<style>
	:global(body) {
		font-family: 'Aleo', serif;
		background-image: url('./backround.svg');
		background-position: center;
		background-size: cover;
		background-repeat: no-repeat;
		background-attachment: fixed;
		justify-content: center;
		width: 100%;
		height: 100vh;
	}
</style>
