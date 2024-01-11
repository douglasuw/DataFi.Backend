<?php
$language_cookie = isset($_COOKIE['SSLANG']) ? $_COOKIE['SSLANG'] : "br";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta name="robots" content="index, follow">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="title" content="DataFi">
	<meta name="author" content="DataFi - www.DataFi.com.br">
	<meta name="description" content="Desenvolva seu negócio digital com facilidade! Nosso Sistema de Relatório integra-se à API do Facebook e permite que Gerentes de Tráfego Digital criem relatórios personalizados para otimizar suas estratégias de marketing. Obtenha insights valiosos para impulsionar seu sucesso online.">
	<meta name="keywords" content="Sistema de Relatório, API do Facebook, Gerente de Tráfego Digital, Relatórios Personalizados, Estratégias de Marketing, Insights, Sucesso Online, Otimização, Negócio Digital">
	<meta name="theme-color" content="#1c2b39">
	<title>DataFi</title>
	<link rel="shortcut icon" type="image/x-icon" href="_img/favicon.png">
	<!-- FONT -->
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" href="./source/css/log.css?v=<?= time(); ?>">
	<link rel="stylesheet" href="./source/css/log-mobile.css?v=<?= time(); ?>">
	<!-- JS -->
	<script defer="defer" src="./assets/jquery-3.7.1.min.js"></script>
	<script defer="defer" src="./source/lang/language.br.js?v=<?= time(); ?>" id="language-file"></script>
	<script defer="defer" src="./source/lang/language.js?v=<?= time(); ?>"></script>
	<script defer="defer" src="./source/js/common.js?v=<?= time(); ?>"></script>
	<script defer="defer" src="./source/js/log.js?v=<?= time(); ?>"></script>
</head>
<body>

	<header>
		<div id="brand" class="brand-font" onclick="window.location.assign('https://datafi.com.br')">
			<svg class="brand-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0, 0, 400,400"><path d="M189.648 7.009 C 170.993 12.217,161.030 28.552,165.020 47.388 C 166.864 56.095,164.515 60.694,151.613 73.633 C 138.520 86.764,134.503 88.767,124.897 86.960 C 102.980 82.837,84.690 97.230,84.690 118.600 C 84.690 147.338,119.698 161.617,139.910 141.124 C 147.902 133.021,150.637 123.198,148.358 110.786 C 146.507 100.705,148.653 96.530,162.856 82.580 C 175.367 70.294,178.610 68.749,188.509 70.366 C 217.184 75.049,237.418 49.797,225.205 24.569 C 218.979 11.710,202.306 3.476,189.648 7.009 M273.524 87.205 C 252.684 89.730,239.943 111.010,247.546 130.592 C 257.314 155.748,293.612 157.275,305.578 133.033 C 316.693 110.517,298.289 84.205,273.524 87.205 M45.800 167.064 C 16.172 173.399,11.732 214.684,39.332 227.198 C 56.633 235.043,77.001 225.851,82.756 207.600 C 89.962 184.751,69.263 162.047,45.800 167.064 M334.323 167.215 C 307.662 173.770,301.208 208.613,323.724 224.431 C 341.671 237.041,368.164 227.051,372.642 205.986 C 377.715 182.117,357.382 161.544,334.323 167.215 M112.600 248.418 C 78.448 253.708,75.177 300.792,108.277 310.638 C 124.824 315.560,142.383 305.825,147.445 288.923 C 153.966 267.151,134.882 244.967,112.600 248.418 M272.400 248.677 C 253.450 251.863,241.867 269.219,245.757 288.600 C 247.742 298.486,243.737 305.476,227.696 320.123 C 217.677 329.271,215.030 330.137,203.000 328.199 C 179.406 324.400,159.743 347.010,166.822 369.800 C 172.142 386.928,190.504 397.077,206.627 391.802 C 223.892 386.154,233.158 370.662,229.749 353.144 C 227.834 343.302,229.703 339.220,241.771 326.881 C 255.485 312.860,259.522 310.713,269.076 312.362 C 286.070 315.295,299.768 309.088,306.407 295.447 C 318.019 271.590,298.204 244.339,272.400 248.677" stroke="none" fill="#efcc24" fill-rule="evenodd"></path></svg>
			<div><span>Data</span>Fi</div>
		</div>
		<div id="language">
			<div id="language-active" lang-code="br">
				<img id="language-active-icon" src="./source/img/svg/lang-brazil.svg">
				<span id="language-active-name">Português</span>
			</div>
			<div id="language-options" class="hide">
				<div class="language-item" lang-code="br"><img src="./source/img/svg/lang-brazil.svg" title="Português"><span>Português</span></div>
				<div class="language-item" lang-code="en"><img src="./source/img/svg/lang-usa.svg" title="English"><span>English</span></div>
				<div class="language-item" lang-code="es"><img src="./source/img/svg/lang-spain.svg" title="Español"><span>Español</span></div>
				<div class="language-item" lang-code="it"><img src="./source/img/svg/lang-italy.svg" title="Italiano"><span>Italiano</span></div>
				<div class="language-item" lang-code="fr"><img src="./source/img/svg/lang-france.svg" title="Français"><span>Français</span></div>
				<div class="language-item" lang-code="dt"><img src="./source/img/svg/lang-germany.svg" title="Deutsch"><span>Deutsch</span></div>
			</div>
		</div>
	</header>

	<main>
		<div id="box">

			<div id="title" lang-text="2272D6013A5776BF2DC296B45BC45728">Acessar</div>

			<div id="form">
				<!-- <label>Email</label> -->
				<input class="form-data" type="mail" placeholder="Email" lang-placeholder="9CA161FBF1A29E971DFF233A21270D29">
				<!-- <label>Senha</label> -->
				<input class="form-data" type="password" placeholder="Senha" lang-placeholder="229F6DABF6F8D3CD4C8FA2741DCA6E0F">

				<div id="form-remember" lang-title="2419543410670579B0D96595EA61F062" title="Ao deixar essa opção marcada, da próxima vez que você acessar o sistema, o login será automático. Por questões de segurança, o login ficará gravado apenas por 40 dias.">
					<input type="checkbox" id="logRemember">
					<label for="logRemember" lang-text="D3EAC9156422FA7BBD5AA531EBE632D1">Manter-me conectado</label>
				</div>

				<button type="button" lang-text="4F70ADA9134ECCA43B345ABC6A7A2F07">Entrar</button>
			</div>

			<div id="password">
				<span lang-text="1FC894125656CD9B0D8A6A110859C3AF">Esqueceu sua senha?</span> <a lang-text="01810C3EC2E5EBCABAFCB1356F434560" href="">Recuperar senha</a>
			</div>

			<div id="account">
				<span lang-text="5EF592685C8CF7FA380BC016CFE119F3">Ainda não tem uma conta?</span> <a lang-text="72B3064C6FB3A039E365B51057D74D34" href="">Crie sua conta</a>
			</div>

			<div id="terms">
				<a lang-text="A9CD8D881CB8E4E03EC433451384B113" href="">Termos de uso</a> | <a lang-text="11D694FC3E26AE574173345BD6E07064" href="">Política de privacidade</a>
			</div>
			
		</div>
	</main>

</body>
</html>