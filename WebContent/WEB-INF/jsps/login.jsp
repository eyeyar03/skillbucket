<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<c:import url="header.jsp">
	<c:param name="title">Login - Skill Bucket</c:param>
</c:import>

<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-6 jumbotron">
		<h3>Login</h3>
		<c:if test="${param.error != null}">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Oops!</strong> There was a problem logging in.
			</div>
		</c:if>
		  <sf:form class="form-horizontal" name="f" action="${pageContext.request.contextPath}/login"
			method='POST' role="form">
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="username">Username:</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" name="username" placeholder="Enter username">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="password">Password:</label>
		      <div class="col-sm-10">          
		        <input type="password" class="form-control" name="password" placeholder="Enter password">
		      </div>
		    </div>
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="submit" class="btn btn-default">Submit</button>
		      </div>
		    </div>
		     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		  </sf:form>
	</div>
	<div class="col-sm-3"></div>
</div>

<c:import url="footer.jsp" />