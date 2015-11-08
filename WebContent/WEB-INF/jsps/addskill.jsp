<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<c:import url="header.jsp">
	<c:param name="title">Add Skill</c:param>
</c:import>

<div class="row">
	<div class="col-sm-3"></div>

	<div class="col-sm-6 jumbotron">
		<c:if test="${errorMsg!=''}">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Oops!</strong> <c:out value="${errorMsg}"/> 
			</div>
		</c:if>
		<c:if test="${successMsg!=''}">
			<div class="alert alert-success fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Success!</strong> <c:out value="${successMsg}"/> 
			</div>
		</c:if>

		<sf:form modelAttribute="skill" method="post" action="${pageContext.request.contextPath}/doaddskill"
			class="form-horizontal" role="form">

			<div class="form-group">
				<sf:label class="control-label col-sm-2" path="name">Skill:</sf:label>
				<div class="col-sm-10">
					<sf:input type="text" class="form-control" name="name" path="name" 
					placeholder="Enter skill. e.g. MS Excel, Public Speaking, HTML" required="required"/><br/>
					<sf:errors path="name" cssClass="alert-danger"></sf:errors>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="level">Level:</label>
				<div class="col-sm-10">
					<sf:select name="level" class="form-control" path="level" required="required">
						<sf:option value="">Select</sf:option>
						<c:forEach var="option" items="${levels}">
							<sf:option value="${option}">${option}</sf:option>
						</c:forEach>
					</sf:select><br/>
					<sf:errors path="level" cssClass="alert-danger"></sf:errors>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Category:</label>
				<div class="col-sm-10">
					<sf:input type="text" class="form-control" name="category"
						placeholder="Enter category" path="category" required="required"/><br/>
					<sf:errors path="category" cssClass="alert-danger"></sf:errors>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Priority:</label>
				<div class="col-sm-10">
					<sf:input type="number" class="form-control" name="priority"
						placeholder="Enter priority rank, 1 being highest" path="priority" 
						required="required"/><br/>
					<sf:errors path="priority" cssClass="alert-danger"></sf:errors>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Add Skill</button>
				</div>
			</div>
		</sf:form>
	</div> <!-- .col-sm-6 -->

	<div class="col-sm-3"></div>

</div> <!-- .row -->

<c:import url="footer.jsp" />