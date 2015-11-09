<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="title">Skill Bucket</c:param>
</c:import>

<div class="row">

	<div class="col-sm-offset- col-sm-8 alert alert-danger">

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3 class="panel-title">Error</h3>
			</div>
			<div class="panel-body">There seems to be a problem. The
				database might be down. Please try again or come back later.</div>
		</div>

	</div>
</div>

<c:import url="footer.jsp" />