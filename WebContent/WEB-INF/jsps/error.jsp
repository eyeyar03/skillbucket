<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="title">Home - Skill Bucket</c:param>
</c:import>

<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8 alert alert-danger">
		<strong>Oops!</strong> There seems to be a problem. The database might
		be down. Please try again or come back later.
	</div>
	<div class="col-sm-2"></div>
</div>

<c:import url="footer.jsp" />