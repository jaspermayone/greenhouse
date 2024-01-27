<script lang="ts">
	import Password from '$lib/components/Password.svelte';
	export var shalll = 0;
</script>

{#if shalll === 1}
	<p>Logged In</p>
{:else}
	<Password />
{/if}
