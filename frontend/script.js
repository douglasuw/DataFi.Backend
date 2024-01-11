// Global
const fb_url = "https://graph.facebook.com/v17.0/";
const fb_token = "EAAEYdxdYQooBO57tsxhPA7v5HUMPQNYka6nZBg9CDkgSAF8HAnV6TqVuQHcUezZB5Qub5LOOBpZAUtQutVmla5DyQZBHTErGORBkDo1eFhsZAHcZBY6LEZBnOAWSpm8Oj4YpO1XRRDd1kes5GIZAYdk59kSmE51Ut1JZBgB0MidxZCtbVFYgYMQmaTZCmbv";
// var fb_token = null;

// Listar BMs
function BMsBuscar() {
	// $("#report-account .report-section-result").html("Carregando Business Managers ...");
	return new Promise(function(resolve, reject) {
		var url_complement = "me/businesses";
		$.ajax({
			type: "GET",
			dataType: "json",
			cache: false,
			url: fb_url + url_complement,
			data: {
				access_token: fb_token
			},
			success: function(data) {
				BMsListar(data.data);
                resolve();
			},
			error: function(xhr, status, error) {
				var errorMessage = JSON.parse(xhr.responseText).error.message;
				console.log(errorMessage);
                reject();
			}
		});
    });
}

function BMsListar(data) {
	$("#meta-account-bm").empty();
	$.each(data, function(index,element){
		let item = `<option value="${element.id}">${element.name}</option>`;
		$("#meta-account-bm").append(item);
	});
}

$("#bms-btn").click(function(){
	BMsBuscar().then(() => {
		contasAnunciosBuscar().then(() => {
			resultadosBuscarContaAnuncio().then(() => {
				campanhasBuscar();
			});
		});
	});
});
$("#meta-account-bm").change(function(){
	contasAnunciosBuscar().then(() => {
		resultadosBuscarContaAnuncio().then(() => {
			campanhasBuscar();
		});
	});
});

// Listar contas de anúncios
function contasAnunciosBuscar() {
	// $("#report-account .report-section-result").html("Carregando Contas de Anúncios ...");
	return new Promise(function(resolve, reject) {
		var url_complement = $("#meta-account-bm").val() + "/owned_ad_accounts";
		$.ajax({
			type: "GET",
			dataType: "json",
			cache: false,
			url: fb_url + url_complement,
			data: {
				fields: "id,name,account_status,business_name,account_id,business,age,balance,currency,owner,amount_spent",
				access_token: fb_token
			},
			success: function (data) {
				contasAnunciosListar(data.data);
				resolve();
			},
			error: function (xhr, status, error) {
				var errorMessage = JSON.parse(xhr.responseText).error.message;
				console.log(errorMessage);
				reject();
			}
		});
	});
}

function contasAnunciosListar(data) {
	$("#meta-account-account").empty();
	$.each(data, function(index,element){
		let item = `<option value="${element.id}">${element.name}</option>`;
		$("#meta-account-account").append(item);
	});
}

$("#contas-anuncios-btn").click(function(){
	contasAnunciosBuscar().then(() => {
		resultadosBuscarContaAnuncio().then(() => {
			if ($("#meta-account-account").val() != null) {
				campanhasBuscar();
			}
		});
	});
});
$("#meta-account-account").change(function(){
	resultadosBuscarContaAnuncio().then(() => {
		if ($("#meta-account-account").val() != null) {
			campanhasBuscar();
		}
	});
});


// Listar campanhas da conta de anúncio selecinada
function campanhasBuscar() {
	var url_complement = $("#meta-account-account").val();
	$.ajax({
		type: "GET",
		dataType: "json",
		cache: false,
		url: fb_url + url_complement,
		data: {
			fields: "campaigns{id,name}"
			,access_token: fb_token
		},
		success: function(data) {
			campanhasListar(data);
		},
		error: function(xhr, status, error) {
			var errorMessage = JSON.parse(xhr.responseText).error.message;
			console.log(errorMessage);
		}
	});
}

function campanhasListar(data) {
	$("#meta-account-campaign").empty();
	$.each(data.campaigns.data, function(index,element){
		let item = `<option value="${element.id}">${element.name}</option>`;
		$("#meta-account-campaign").append(item);
	});
}

$("#campanhas-btn").click(function(){
	campanhasBuscar();
});


// Resultados
function resultadosBuscarContaAnuncio() {
	// $("#report-account .report-section-result").html("Montando relatório ...");
	$("#report #report-account .report-section-result .report-data:not(.template)").remove();
	$("#report-account .report-section-loading").show();
	return new Promise(function(resolve, reject) {
		var url_complement = $("#meta-account-account").val()+"/insights";
		$.ajax({
			type: "GET",
			dataType: "json",
			cache: false,
			url: fb_url + url_complement,
			data: {
				time_range: {
					"since": $("#resultados-data-inicio").val()
					,"until": $("#resultados-data-fim").val()
				}
				,fields: "spend,impressions,clicks,cpc,ctr,cpp,cpm,frequency,date_start,date_stop,website_ctr"
				,access_token: fb_token
			},
			success: function(data) {
				resultadosApresentarContaAnuncio(data.data[0]);
				resolve();
			},
			error: function(xhr, status, error) {
				var errorMessage = JSON.parse(xhr.responseText).error.message;
				console.log(errorMessage);
				reject();
			}
		});
	});
}

function resultadosApresentarContaAnuncio(data) {
	// $("#report-account .report-section-result").empty();
	$("#report #report-account .report-section-result .report-data:not(.template)").remove();
	$("#report-account .report-section-loading").show();
	$.each(data, function(index,element){
		if (index == "website_ctr") {
			element = element[0].value
		}
		const $item = $("#report #report-account .report-section-result .report-data.template").clone().removeClass("template");

		let reportStatus = keyWords.find(item => item[0] === index)[3] == true ? "1" : "0";
		let reportStatusSelected = keyWords.find(item => item[0] === index)[3] == true ? "selected" : "";

		$item.attr("report", reportStatus);
		$item.find(".report-data-check").addClass(reportStatusSelected);
		$item.find(".report-data-category").text(keyWords.find(item => item[0] === index)[1]);
		$item.find(".report-data-name").text(retornKeyWordsText(index));
		$item.find(".report-data-value").text(formatterResult(index,element));
		$("#report-account .report-section-result").append($item);
	});
	$("#report-account .report-section-loading").hide();
}

$("#report-action-getresult").click(function(){
	BMsBuscar().then(() => {
		contasAnunciosBuscar().then(() => {
			resultadosBuscarContaAnuncio().then(() => {
				campanhasBuscar();
			});
		});
	});
	alert(fb_token);
});

$(".resultados-data").change(function(){
	resultadosBuscarContaAnuncio();
});


// array strings
const keyWords = [
	["date_start", "date", "Data de início", true],
	["date_stop", "date", "Data de fim", true],
	["spend", "coin", "Valor gasto", true],
	["impressions", "number", "Impressões", true],
	["clicks", "number", "Número de cliques", true],
	["cpc", "coin", "Custo por clique", true],
	["ctr", "percent", "Visualização e clique", false],
	["cpp", "coin", "Custo de 1.000 pessoas", false],
	["cpm", "coin", "Custo de 1.000 impressões", false],
	["frequency", "decimal", "Frequência de visualização", true],
	["website_ctr", "percent", "Clicaram/viram o link", true],
	["objective", "text", "Objetivo da campanha", false],
];
function retornKeyWordsText(sigla) {
  const correspondencia = keyWords.find(item => item[0] === sigla);
  return correspondencia ? correspondencia[2] : sigla;
}


// formatter
function formatterResult(keyword,value) {
	const type = keyWords.find(item => item[0] === keyword)[1];
	if (type === "number") {
		const partes = value.toString().split('.');
		const parteInteira = partes[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.');
		const parteDecimal = partes[1] ? ',' + partes[1] : '';
		return parteInteira + parteDecimal;
	}
	if (type === "decimal") {
		return parseFloat(value).toFixed(2).replace('.', ',');
	}
	if (type === "coin") {
		const valorFormatado = parseFloat(value).toLocaleString('pt-BR', {
			style: 'currency',
			currency: 'BRL'
		});
		return valorFormatado;
	}
	if (type === "percent") {
		return (value * 100).toFixed(2).replace('.', ',') + '%';
	}
	if (type === "date") {
		const partes = value.split("-");
		if (partes.length === 3) {
			const ano = partes[0];
			const mes = partes[1];
			const dia = partes[2];
			return dia + "/" + mes + "/" + ano;
		}
		return value;
	}
	if (type === "text") {
		return value;
	}
}


// init
$(document).ready(function(){

	// datas
	const hoje = new Date();
	const dataOitoDiasAtras = new Date(hoje);
	dataOitoDiasAtras.setDate(hoje.getDate() - 8);
	const dataDiaAnterior = new Date(hoje);
	dataDiaAnterior.setDate(hoje.getDate() - 1);
	const dataOitoDiasAtrasFormatada = dataOitoDiasAtras.toISOString().split('T')[0];
	const dataDiaAnteriorFormatada = dataDiaAnterior.toISOString().split('T')[0];
	$("#resultados-data-inicio").val(dataOitoDiasAtrasFormatada);
	$("#resultados-data-fim").val(dataDiaAnteriorFormatada);

	// carga dos dados
	BMsBuscar().then(() => {
		contasAnunciosBuscar().then(() => {
			resultadosBuscarContaAnuncio();
			campanhasBuscar();
		});
	});

});

