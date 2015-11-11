<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${param.title}</title>

<link href='<c:url value="/resources/css/bootstrap.min.css"/>'
	rel="stylesheet">
<link href="<c:url value='resources/css/main.css'/>" rel="stylesheet">

</head>
<body>

	<div class="container">
		<div class="header clearfix">
			<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<c:url value='/'/>">Skill Bucket</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active" id="nav-home-label"><a href="<c:url value='/'/>">Home</a></li>
						<li id="nav-skills-label"><a href="<c:url value='/skills'/>">Skills</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li role="presentation" class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#"
							role="button" aria-haspopup="true" aria-expanded="false">
								<c:out value="${username}"></c:out><span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/accountsettings'/>">My Account</a></li>
								<li>
									<c:url var="logoutUrl" value="/logout" />
									<form action="${logoutUrl}" method="post" id="logoutForm">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>
									<a href="#" id="logoutLink">Logout</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			</nav>

		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src='<c:url value="/resources/js/header.js" />'></script>