// message
function showMessage(text) {
	$("#message span").text(text);
	$("#message").fadeIn();
	setTimeout(() => {
		$("#message").fadeOut()
	}, 3000);
}
$("#message svg").click(() => {
	$("#message").fadeOut();
});


// WhatsApp
function isMobileDevice() {
	return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}


// whatsapp send
$("#whatsappSend").click(() => {
	var mensagem = "📋 *Relatório de anúncios* %0A%0A";
	$(".report-data").filter("[report='1']").each((index, element) => {
		let name = $(element).find(".report-data-name").text();
		let value = $(element).find(".report-data-value").text();
		mensagem += "✅ ```"+name+"``` %0A*" +value+ "* %0A%0A";
	});

	const numeroTelefone = "+55numerodetelefone";
	let linkWhatsApp = null;
	if (isMobileDevice()) {
		linkWhatsApp = `https://wa.me/${numeroTelefone}/?text=${mensagem}`;
	} else {
		linkWhatsApp = `https://web.whatsapp.com/send?text=${mensagem}`;
	}

	window.open(linkWhatsApp);
});

// whatsapp copy
$("#whatsappCopy").click(() => {
	var mensagem = "📋 *Relatório de anúncios* \n\n";
	$(".report-data").filter("[report='1']").each((index, element) => {
		let name = $(element).find(".report-data-name").text();
		let value = $(element).find(".report-data-value").text();
		mensagem += "✅ ```"+name+"``` \n*" +value+ "* \n\n";
	});
	const $tempInput = $('<textarea>');
	$tempInput.val(mensagem);
	$('body').append($tempInput);
	$tempInput.select();
	document.execCommand('copy');
	$tempInput.remove();
	showMessage("Relatório copiado com sucesso!");
});


// header nav
$("#header-nav-menu").click(() => {
	if ($("#header-nav-menu").attr("opened") == "0") {
		$("#header-nav").css("left","0");
		$("#header-nav-menu").attr("opened","1");
	} else {
		$("#header-nav").css("left","-100%");
		$("#header-nav-menu").attr("opened","0");
	}
});


// result change on-off
$("#report").on("click", ".report-data-check", function() {
	console.log($(this).parents('.report-data').attr('report'))
	if ($(this).hasClass("selected")) {
		$(this).parents('.report-data').attr('report','0');
		$(this).removeClass("selected");
	} else {
		$(this).parents('.report-data').attr('report','1');
		$(this).addClass("selected");
	}
});