// click out
$(document).click(function(event) {
	if (!$(event.target).closest('#language-active').length) {
		$("#language-options").addClass("hide");
	}
});

// cookie
function cookieSet(name, value, days) {
	const expires = new Date();
	expires.setTime(expires.getTime() + (days * 24 * 60 * 60 * 1000));
	const cookie = `${name}=${value};expires=${expires.toUTCString()};path=/;SameSite=None`;
	document.cookie = cookie;
}
function cookieGet(name) {
	const cookies = document.cookie.split(';');
	for (let i = 0; i < cookies.length; i++) {
		const cookie = cookies[i].trim();
		if (cookie.startsWith(name + '=')) {
			const value = cookie.substring(name.length + 1);
			return value;
		}
	}
	return null;
}
function cookieDelete(name) {
	document.cookie = `${name}=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/;`;
}
