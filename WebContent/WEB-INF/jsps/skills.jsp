<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<c:import url="header.jsp">
	<c:param name="title">Profile - Skill Bucket</c:param>
</c:import>

<input id="updateAttempt" type="hidden" value="${updateAttempt}">

<div class="container">
	<div class="row skills">
		<div class="col-sm-6">
			<div class="row">
				<c:if test="${errorMsg!=null && errorMsg!=''}">
					<div class="alert alert-danger">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Oops!</strong> <c:out value="${errorMsg}"/> 
					</div>
				</c:if>
				<c:if test="${successMsg!=null && successMsg!=''}">
					<div class="alert alert-success fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Yeah!</strong> <c:out value="${successMsg}"/> 
					</div>
				</c:if>
				<ul id="sortable">
				<c:forEach var="skill" items="${skills}">
				<%-- Set skill_id variable for reference by individual update modal --%>
				<c:set var="skill_id" value="skill_${skill.id}"></c:set>
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
									<tr>
										<td><small>Priority</small></td>
										<td><c:out value="${skill.priority}"></c:out></td>
									</tr>
								</table>
								<div class="panel-footer">
									<button id="updateSkillBtn" type="button" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#${skill_id}">Update</button>
									<a href="<c:url value='/skills?id=${skill.id}'/>" class="btn btn-default btn-xs deleteSkillBtn"
										role="button">Delete</a>
								</div>
							</div>
							
							<!-- Modal -->
							
							<div class="modal fade" id="${skill_id}" tabindex="-1" role="dialog" aria-labelledby="updateSkillLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" id="modalClose" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="updateSkillLabel">Update Skill</h4>
							      </div>
							      
							      <c:url value="/skills?update=true" var="updateSkillUrl"/>
							      <sf:form id="updateForm" modelAttribute="updateskill" method="post" action="${updateSkillUrl}" 
							        class="form-horizontal actualform" role="form">
							        
							        <div class="modal-body">

										<c:if test="${errorUpdateMsg!=null && errorUpdateMsg!=''}">
											<div class="alert alert-danger">
												<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
												<strong>Oops!</strong> <c:out value="${errorUpdateMsg}"/> 
											</div>
										</c:if>
										<sf:input type="hidden" class="form-control" name="id" path="id" value="${skill.id}"/>
												
								        <div class="form-group">
											<label class="control-label col-sm-2" for="name">Skill:</label>
											<div class="col-sm-10">
												<sf:input type="text" class="form-control" name="name" path="name" 
												value="${skill.name}" required="required"/><br/>
												<sf:errors path="name" cssClass="alert-danger"></sf:errors>
											</div>
										</div>
							
										<div class="form-group">
											<label class="control-label col-sm-2" for="level">Level:</label>
											<div class="col-sm-10">
											<c:set var="levelSelect" value="level_${skill.id}"></c:set>
												<sf:select id="${levelSelect}" name="level" class="form-control" path="level" required="required">
													<sf:option value="">Select</sf:option>
													<c:forEach var="option" items="${levels}">
														<sf:option value="${option}">${option}</sf:option>
													</c:forEach>
												</sf:select><br/>
												<sf:errors path="level" cssClass="alert-danger"></sf:errors>
											</div>
										</div>
							
										<div class="form-group">
											<label class="control-label col-sm-2" for="category">Category:</label>
											<div class="col-sm-10">
												<sf:input type="text" class="form-control" name="category"
													path="category" value="${skill.category}" required="required"/><br/>
												<sf:errors path="category" cssClass="alert-danger"></sf:errors>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="priority">Priority:</label>
											<div class="col-sm-10">
												<sf:input type="number" class="form-control" name="priority"
													path="priority" value="${skill.priority}" required="required"/><br/>
												<sf:errors path="priority" cssClass="alert-danger"></sf:errors>
											</div>
										</div>
								      
								      </div> <!-- modal-body -->
								      
								      <div class="modal-footer">
								        <button type="button" id="modalCancel" class="btn btn-default" data-dismiss="modal">Cancel</button>
								        <button id="saveChangesBtn" type="submit" class="btn btn-primary">Save changes</button>
								      </div>
								      
							      </sf:form>
							      
							    </div>
							  </div>
							  <%-- Select level value for each modal --%>
								<script type="text/javascript">
									$("#${levelSelect}").val("${skill.level}");
								</script>
							</div> <!-- Modal -->
					</li>
				</c:forEach>
				</ul>
			</div>
			
		</div>
		<div class="col-sm-offset-1 col-sm-5">
			<div class="row">
				<div class="col-sm-12">
					<p>
						<a class="btn btn-lg btn-primary" href="<c:url value='/addskill'/>"
							role="button">Add Skill</a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<h4>Tips</h4>
					<ul class="list-group">
						<li class="list-group-item">Drag-and-drop skills to rearrange.</li>
					</ul>
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
function displayModal(){
	console.log("displayModal called");
	$( "#updateSkillBtn" ).click();
}
function onLoad() {
    $( "#sortable" ).sortable({ 
        placeholder: "ui-sortable-placeholder" 
    });
    $( "#saveChangesBtn" ).click(function() {
    	$( "#updateForm" ).submit();
    });
    $( "#modalCancel" ).click(function() {
    	$("div.alert-danger").hide();
    });
    $( "#modalClose" ).click(function() {
    	$("div.alert-danger").hide();
    });
    if ($( "#updateAttempt" ).val() === "true") {
    	displayModal();
    }
    $('.deleteSkillBtn').on('click', function () {
        return confirm('Are you sure you want to delete this skill?');
    });
}
$(document).ready(onLoad);
</script>

<c:import url="footer.jsp" />