<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="header.jsp">
	<c:param name="title">Log in - Skill Bucket</c:param>
</c:import>

<div class="container maincontainer">
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
			
			<form class="form-horizontal actualform" name="f"
				action="<c:url value='/login'/>" method='POST' role="form">
				<p class="lead">Log in to Skill Bucket</p>
				<c:if test="${param.error != null}">
					<div class="alert alert-danger">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Oops!</strong> There was a problem logging in. Please check that your username and password are correct.
					</div>
				</c:if>
				<div class="form-group">
					<div class="col-sm-12">
						<input type="text" class="form-control" name="username" placeholder="Username" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input type="password" class="form-control" name="password" placeholder="Password" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<div class="checkbox">
						    <label>
						      <input type="checkbox" name="remember-me"> Remember me
						   	</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-primary btn-md btn-block">Log
							in</button>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<div class="text-center">Don't have an account yet? <a href='<c:url value="/signup"/>'>Create an account</a></div>
		</div>
	</div>
</div>

<c:import url="footer.jsp" />