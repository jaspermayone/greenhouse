<script>
  import Password from "$lib/components/Password.svelte";
  export var shalll = 0;
</script>

<!-- <div class="bg">
	<img src="backround.svg" alt="">
  </div> -->

{#if shalll === 1}
  <p>Logged In</p>
{:else}
  <Password />
{/if}

<style>
  /* .bg {
  position: fixed;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
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
} */
</style>
