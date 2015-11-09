<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="title">Profile - Skill Bucket</c:param>
</c:import>

<div class="row">
	<div class="col-sm-offset-1 col-sm-10">
		<div class="row">
			<c:forEach var="skill" items="${skills}">
				<div class="col-sm-6 col-md-4">
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
							<a href="<c:url value='/viewSkill'/>" class="btn btn-primary btn-xs"
								role="button">View &raquo;</a> 
							<a href="<c:url value='/updateSkill'/>" class="btn btn-default btn-xs"
								role="button">Update</a>
						</div>
					</div>
				</div>
			</c:forEach>
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

<c:import url="footer.jsp" />