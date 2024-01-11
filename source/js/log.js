// click out
$(document).click(function(event) {
	if (!$(event.target).closest('#language-active').length) {
		$("#language-options").addClass("hide");
	}
});

// language
$(document).ready(() => {
	let lang = $("#language-active").attr("lang-code");
	$(".language-item[lang-code='"+lang+"']").addClass("hide");
	languageCheckCookie();
});
$("#language-active").click(() => {
	$("#language-options").toggleClass("hide");
});
$(".language-item").click(function() {
	let lang = $(this).attr("lang-code");
	logLanguageUpdate(lang);
});
function logLanguageUpdate(code) {
	let text = $(".language-item[lang-code='"+code+"']").find("span").text();
	let image = $(".language-item[lang-code='"+code+"']").find("img").attr("src");
	$("#language-active img").attr("lang-code",code).attr("src",image);
	$("#language-active span").text(text);
	$(".language-item").removeClass("hide");
	$(".language-item[lang-code='"+code+"']").addClass("hide");
	languageUpdateScript(code).then(() => {
		languageReplaceStrings();
		cookieSet("SSLANG",code,1);
	});
}
