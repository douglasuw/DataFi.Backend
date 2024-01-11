async function languageUpdateScript(codeLang) {
	const dataAtual = new Date();
	const timestamp = dataAtual.getTime();
	const scriptElement = document.getElementById('language-file');
	const novoScriptElement = document.createElement('script');
	novoScriptElement.src = "./source/lang/language."+codeLang+".js?v="+timestamp;
	novoScriptElement.id = 'language-file';
	scriptElement.parentNode.replaceChild(novoScriptElement, scriptElement);
	await new Promise(resolve => {
		novoScriptElement.addEventListener('load', resolve);
	});
}

function languageReplaceStrings() {
	const attributes = ['text', 'title', 'placeholder'];
	attributes.forEach(attribute => {
		$(`[lang-${attribute}]`).each(function() {
			let langValue = $(this).attr(`lang-${attribute}`);
			if (languageString[langValue]) {
				if (attribute === 'text') {
					$(this).text(languageString[langValue]);
				} else {
					$(this).attr(attribute, languageString[langValue]);
				}
			}
		});
	});
}

function languageCheckCookie() {
	if (cookieGet("SSLANG")) {
		languageUpdateScript(cookieGet("SSLANG")).then(() => {
			languageReplaceStrings();
			logLanguageUpdate(cookieGet("SSLANG"));
		});
	}
}
