<script>
	import { beforeNavigate } from '$app/navigation';
	import { updated } from '$app/stores';

	import '../app.scss';

	beforeNavigate(({ willUnload, to }) => {
		if ($updated && !willUnload && to?.url) {
			location.href = to.url.href;
		}
	});
</script>

<div class="container">
	<div class="bg">
		<img src="background.svg" alt="Greenhouse Background" />
	</div>
	<div class="content">
		<slot />
	</div>
</div>

<style>
	.bg {
		position: fixed;
		top: -50%;
		left: -50%;
		width: 150%;
		height: 150%;
	}
	.bg img {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		margin: auto;
		min-width: 50%;
		min-height: 50%;
	}
</style>
