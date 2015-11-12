<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="title">Skill Bucket</c:param>
</c:import>

<div class="row">

	<div class="col-sm-offset-2 col-sm-8">
	
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Success</h3>
			</div>
			<div class="panel-body">
				<c:url value="/login" var="loginUrl" />
				Your account has been created. Go back to the <a
					href="${loginUrl}">login page</a>.
			</div>
		</div>

	</div>
</div>

<c:import url="footer.jsp" />