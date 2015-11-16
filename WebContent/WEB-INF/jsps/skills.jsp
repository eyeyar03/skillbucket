<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="title">Profile - Skill Bucket</c:param>
</c:import>

<div class="container">
	<div class="row skills">
		<div class="col-sm-offset-1 col-sm-8">
			<div class="row">
				<ul id="sortable">
				<c:forEach var="skill" items="${skills}">
					<li class="ui-state-default">
							<div class="panel panel-default">
								<!-- Default panel contents -->
								<div class="panel-heading">
									<h2 class="panel-title">
										<c:out value="${skill.name}"></c:out>
									</h2>
								</div>
								<table class="table">
									<tr>
										<td><small>Level</small></td>
										<td><c:out value="${skill.level}"></c:out></td>
									</tr>
									<tr>
										<td><small>Category</small></td>
										<td><c:out value="${skill.category}"></c:out></td>
									</tr>
								</table>
								<div class="panel-footer">
									<a href="<c:url value='/updateSkill'/>" class="btn btn-primary btn-xs"
										role="button">Update &raquo;</a> 
									<a href="<c:url value='/deleteSkill'/>" class="btn btn-default btn-xs"
										role="button">Delete</a>
								</div>
							</div>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<p>
						<a class="btn btn-lg btn-primary" href="<c:url value='/addskill'/>"
							role="button">Add Skill</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<hr class="featurette-divider">
	
	<footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2015 Skill Bucket &middot; <a href="#">About</a> </p> 
	</footer>
	    
</div>
<script src="<c:url value="/resources/js/jquery-ui.min.js"/>" ></script>
<script>
$(function() {
    $( "#sortable" ).sortable({ 
        placeholder: "ui-sortable-placeholder" 
    });
});
</script>

<c:import url="footer.jsp" />