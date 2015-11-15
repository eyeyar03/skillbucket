<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="header.jsp">
	<c:param name="title">Home - Skill Bucket</c:param>
</c:import>

<div class="container">
	<div class="homepage">
		
		<div class="row featurerow jumbotron">
			<div class="col-sm-offset-1 col-sm-10">
				<h1 class="main-heading">Skill Bucket</h1>
				<p class="lead">Skill Bucket is the visual way of organizing and
					managing your skills in one place.</p>
				<p>
					<a class="btn btn-lg btn-success" href="<c:url value='/signup'/>"
						role="button">Sign up today</a>
				</p>
			</div>
		</div>
	
		<hr class="featurette-divider">
		
		<div class="row featurerow">
			<div class="col-sm-7">
				<h2 class="featurette-heading">Know exactly what you can do.</h2>
				<p class="lead">Profile each of your skills in one place and visualize how you can market yourself successfully.</p>
			</div>
		</div>
		
		<hr class="featurette-divider">
	
		<div class="row featurerow">
			<div class="col-sm-offset-5 col-sm-7">
				<h2 class="featurette-heading">Stay marketable.</h2>
				<p class="lead">It's a competitive world out there! And what other way to stay in the game than keeping your skills current. Skill Bucket helps you do just that.</p>
			</div>
		</div>
		
		<hr class="featurette-divider">
		
		<div class="row featurerow">
			<div class="col-sm-7">
				<h2 class="featurette-heading">Stay focused.</h2>
				<p class="lead">With all the various skills you have and acquire, you can get lost on the way. Remind yourself where to focus on with Skill Bucket.</p>
			</div>
		</div>
		
		<hr class="featurette-divider">
		
		<footer>
	        <p class="pull-right"><a href="#">Back to top</a></p>
	        <p>&copy; 2015 Skill Bucket &middot; <a href="#">About</a> </p> 
	    </footer>
		
	</div>
</div> 

<c:import url="footer.jsp" />