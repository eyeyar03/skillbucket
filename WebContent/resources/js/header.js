function onLoad() {
	$("#logoutLink").click(function() {
		$("#logoutForm").submit();
	});
}
		
$(document).ready(onLoad);