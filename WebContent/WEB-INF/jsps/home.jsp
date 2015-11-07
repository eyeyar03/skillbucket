<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="header.jsp" >
	<c:param name="title">Home - Skill Bucket</c:param>
</c:import>

	<div class="jumbotron">
		<div class="row">
			<h1>Skill Bucket</h1>
			<p class="lead">Cras justo odio, dapibus ac facilisis in, egestas
				eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris
				condimentum nibh, ut fermentum massa justo sit amet risus.</p>
			<p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
		</div>
		<div class="row">
			<div class="btn-group">
				<p><a href="${pageContext.request.contextPath}/skills" class="btn btn-default">Show skills</a></p>
				<p><a href="${pageContext.request.contextPath}/addskill" class="btn btn-default">Add a new skill</a></p>
			</div>
		</div>
	</div>

<c:import url="footer.jsp" />
