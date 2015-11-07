<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="header.jsp" >
	<c:param name="title">Skills</c:param>
</c:import>

<c:forEach var="skill" items="${skills}">
	<p>Skill Name: <c:out value="${skill.name}"></c:out><p/>
	<p>Skill Level: <c:out value="${skill.level}"></c:out><p/>
	<p>Skill Category: <c:out value="${skill.category}"></c:out><p/>
	<p>Skill Priority: <c:out value="${skill.priority}"></c:out><p/>
</c:forEach>

<c:import url="footer.jsp" />