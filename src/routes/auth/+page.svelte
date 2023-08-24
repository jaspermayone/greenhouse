<script lang="ts">
  import { page } from "$app/stores";
</script>


{#if $page.data.session && $page.data.session.user}
  <p>
    You are signed in as {$page.data.session.user.name}... want to sign out?
    Click the sign out button next to your avatar at the top right of the page.
  </p>
{/if}
