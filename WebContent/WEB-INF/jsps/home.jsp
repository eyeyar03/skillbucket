<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="header.jsp" >
	<c:param name="title">Home - Skill Bucket</c:param>
</c:import>

<h2>Skill Bucket Application</h2>

<p><a href="${pageContext.request.contextPath}/skills">Show skills</a></p>
<p><a href="${pageContext.request.contextPath}/createskill">Create a new skill</a></p>


