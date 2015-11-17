<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="header.jsp">
	<c:param name="title">Sign up - Skill Bucket</c:param>
</c:import>

<div class="container maincontainer">
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
			<c:url value="/dosignup" var="doSignUpUrl"/>
			<sf:form id="signupform" modelAttribute="user" method="post" action="${doSignUpUrl}"
				class="form-horizontal actualform" role="form">
				<p class="lead">Join Skill Bucket today.</p>
				<c:if test="${errorMsg != null}">
					<div class="alert alert-danger">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Oops!</strong> <c:out value="${errorMsg}" /> 
					</div>
				</c:if>
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="text" name="firstName" path="firstName" class="form-control" 
						placeholder="First Name" required="required"/>
						<sf:errors path="firstName" cssClass="alert-danger"></sf:errors>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="text" name="lastName" path="lastName" class="form-control" 
						placeholder="Last Name" required="required"/>
						<sf:errors path="lastName" cssClass="alert-danger"></sf:errors>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="text" name="title" path="title" class="form-control" 
						placeholder="Title (e.g., Engineer, Student, Chef)" required="required"/>
						<sf:errors path="title" cssClass="alert-danger"></sf:errors>
					</div>
				</div>				
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="text" name="email" path="email" class="form-control" 
						placeholder="Email address" required="required"/>
						<sf:errors path="email" cssClass="alert-danger"></sf:errors>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="text" name="username" path="username" class="form-control" 
						placeholder="Username" required="required"/>
						<sf:errors path="username" cssClass="alert-danger"></sf:errors>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="password" id="password" name="password" path="password" class="form-control" 
						placeholder="Password" required="required"/>
						<sf:errors path="password" cssClass="alert-danger"></sf:errors>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input type="password" class="form-control" id="confirmpassword" name="confirmpassword"
							placeholder="Confirm password" required/>
						<div id="passwordmatch"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-success btn-md btn-block">
							Create Account</button>
					</div>
       			</div>
			</sf:form>
			<div class="text-center"><a href="<c:url value="/login"/>">Have an account? Log in</a></div>
		</div> <!-- .jumbotron -->
	</div> <!-- .row -->
</div> <!-- .container -->

<c:import url="footer.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" ></script>
<script type="text/javascript">
function canSubmit() {
	"use strict";
	var signupPasswords = {
			password: $("#password").val(),
			confirmpassword: $("#confirmpassword").val()
	};
	
	if(signupPasswords.password !== signupPasswords.confirmpassword) {
		alert("<fmt:message key='Unmatchedpasswords.user.password' />");
		return false;
	} else {
		return true;
	}
}

function checkPasswordsMatch() {
	"use strict";
	var checkPasswords = {
	    password: $('#password').val(),
	    confirmpassword: $('#confirmpassword').val(),
		messageDiv: $('#passwordmatch'),
		checkGlyph: " <span class='glyphicon glyphicon-ok' aria-hidden='true'></span>",
		timesGlyph: " <span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
	};
	
	if (checkPasswords.password.length < 1 || checkPasswords.confirmpassword < 1) {
		checkPasswords.messageDiv.html("");
		return;
	}

	if (checkPasswords.password.length > 3 || checkPasswords.confirmpassword.length > 3) {
		
		if (checkPasswords.password === checkPasswords.confirmpassword) {
			checkPasswords.messageDiv.text("<fmt:message key='Matchedpasswords.user.password' />").append(checkPasswords.checkGlyph);
			checkPasswords.messageDiv.addClass("alert-success");
			checkPasswords.messageDiv.removeClass("alert-danger");
		} else {
			checkPasswords.messageDiv.text("<fmt:message key='Unmatchedpasswords.user.password' />").append(checkPasswords.timesGlyph);
			checkPasswords.messageDiv.addClass("alert-danger");
			checkPasswords.messageDiv.removeClass("alert-success");
		}
	}
}

function onLoad() {
	"use strict";
	$("#password").keyup(checkPasswordsMatch);
	$("#confirmpassword").keyup(checkPasswordsMatch);
	$("#signupform").submit(canSubmit);
}

$(document).ready(onLoad);

</script>

</body>
</html>