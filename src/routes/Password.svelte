<div class="center-container">
	<div class="box">
		<div class="columns">
			<div class="column">
				<p>Please enter your password <br> to gain access...</p>
			</div>
			<div class="column is-narrow">
				<span class="icon-text has-text-success">
					<span class="icon">
						<i class="fas fa-circle-check" />
					</span>
				</span>
			</div>
		</div>
    <div class="password">
		<input
			class="input is-primary"
			type="password"
			id="password"
			name="password"
			placeholder="Enter your password"
		/>
  </div>
	</div>
</div>

<style>

  .password {
    margin-top: -2vh;
  }

	.center-container {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;
	}
</style>
