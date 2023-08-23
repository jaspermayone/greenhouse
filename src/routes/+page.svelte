<script>
	import Password from './Password.svelte';
	var sh = 0;
</script>

{#if sh === 1}
	<p>Logged In</p>
{:else}
	<Password />
{/if}
