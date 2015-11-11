function onLoad() {

	$("#password").keyup(checkPasswordsMatch);
	$("#confirmpassword").keyup(checkPasswordsMatch);

	$("#signupform").submit(canSubmit);
}

function canSubmit() {
	var password = $("#password").val();
	var confirmpassword = $("#confirmpassword").val();
	
	if(password != confirmpassword) {
		alert($('#unmatchedMsg').val());
		return false;
	}
	else {
		return true;
	}
}

function checkPasswordsMatch() {
	var password = $("#password").val();
	var confirmpassword = $("#confirmpassword").val();
	var matchedMsg = $('#matchedMsg').val();
	var unmatchedMsg = $('#unmatchedMsg').val();

	var matchedMsgSpan = $('<span>').text(matchedMsg).append(" <span class='glyphicon glyphicon-ok' aria-hidden='true'></span>");
	var unmatchedMsgSpan = $('<span>').text(unmatchedMsg).append(" <span class='glyphicon glyphicon-remove' aria-hidden='true'></span>");
	var messageDiv = $("#passwordmatch");
	
	if (password.length < 1 || confirmpassword < 1) {
		messageDiv.html("");
		return;
	}

	if (password.length > 3 || confirmpassword.length > 3) {
		
		if (password == confirmpassword) {
			messageDiv.html(matchedMsgSpan);
			messageDiv.addClass("alert-success");
			messageDiv.removeClass("alert-danger");
		} else {
			messageDiv.html(unmatchedMsgSpan);
			messageDiv.addClass("alert-danger");
			messageDiv.removeClass("alert-success");
		}
	}
	
}

$(document).ready(onLoad);
