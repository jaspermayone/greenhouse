<div class="center-container">
	<div class="box">
		<form method="POST" action="/login">
			<input type="text" name="user" />
			<input type="password" name="password" />
			<button type="submit">Login</button>
		</form>
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
