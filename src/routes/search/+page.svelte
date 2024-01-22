<div class="top-left-container">
	<div class="box">
		<i class="fa-solid fa-user-lock" />
	</div>
</div>

<div class="top-center">
	<div class="box">
		<img src="/logo.png" alt="Project Greenhouse Logo" width="50" height="50" />
	</div>
</div>

<div class="top-right-container">
	<div class="box">
		<i class="fa-solid fa-box-archive" />
	</div>
</div>

<div class="center-container">
	<div class="box">
		<div class="search-container">
			<div class="field">
				<div class="control">
					<input class="input" type="text" placeholder="Enter your search term..." />
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.center-container {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.top-left-container {
		position: fixed;
		top: -45%;
		left: -47.5%;
		transform: translate(0, 0);
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;
	}

	.top-right-container {
		position: fixed;
		top: -45%;
		left: 47.5%;
		transform: translate(0, 0);
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;
	}

	.top-center {
		position: fixed;
		top: -42.5%;
		left: 0%;
		transform: translate(0, 0);
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;
	}

	.search-container {
		width: 150vh;
		margin: 0 auto;
		padding: 10px;
	}
</style>