<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="header.jsp">
	<c:param name="title">Home - Skill Bucket</c:param>
</c:import>

		<div class="jumbotron">

			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<h1>Skill Bucket</h1>
					<p class="lead">Cras justo odio, dapibus ac facilisis in,
						egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor
						mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-lg btn-success" href="<c:url value='/signup'/>"
							role="button">Sign up today</a>
					</p>
				</div>
				<div class="col-sm-1"></div>
			</div>

		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js" />'></script>

</body>
</html>