<?php
if (isset($_COOKIE['SSID'])) {
	header("location:painel.html");
} else {
	header("location:log.php");
}
?>