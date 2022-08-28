<!DOCTYPE html>
<html lang="pt-BR">
	<?php 
		require_once __DIR__.'/../head'._INDEX; 
	?>
	<body class="load animated.delay-2s">
		<div class="msg-box" style="display: none;">
			<span class="msg-alert " id="resposta"></span>
		</div>
		<span class="load-fullsreen">
			<div class="ani-load p-2 animated pulse ">
				<div class="p-2 m-b-4" style="max-width: 220px;display: inline-block;">
					<img src="\imagens/icon.png" alt="Gestão Inteligente" />
				</div>
				<div class="p-2" style="max-width: 100px;display: inline-block;">
					<div class="load-ani"></div>
				</div>			
			</div>
		</span>
		<?php
			require_once __DIR__.'/main'._INDEX; 
		?>
	</body>
</html>