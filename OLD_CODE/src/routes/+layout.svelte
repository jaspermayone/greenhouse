<div class="container">
  <div class="bg">
    <img src="backround.svg" alt="Greenhouse Background" />
  </div>
  <div class="content">
    <slot />
  </div>
</div>

<style>
  :global(body) {
    font-family: "Shantell Sans", sans-serif;
    font-size: 16px;
  }

  .container {
    display: flex;
    flex-direction: column;
    height: 100vh; /* Adjust as needed */
  }

  .bg {
    position: relative;
    flex: 1;
    overflow: hidden;
  }

  .bg img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .content {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
