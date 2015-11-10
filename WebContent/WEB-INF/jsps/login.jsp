<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Log in - Skill Bucket</title>

<link href='<c:url value="/resources/css/bootstrap.min.css"/>' rel="stylesheet">
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
					<li class="active"><a href="<c:url value='/'/>">Home</a></li>
					<li><a href="#about">About</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>

<div class="row">
	<div class="col-sm-offset-3 col-sm-6 jumbotron">
		<p class="lead">Log in to Skill Bucket</p>
		<c:if test="${param.error != null}">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Oops!</strong> There was a problem logging in.
			</div>
		</c:if>
		<form class="form-horizontal" name="f"
			action="<c:url value='/login'/>" method='POST' role="form">
			<div class="form-group">
				<div class="col-sm-12">
					<input type="text" class="form-control" name="username" placeholder="Username">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<input type="password" class="form-control" name="password" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<button type="submit" class="btn btn-primary btn-md btn-block">Log
						in</button>
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<div class="text-center"><a href='<c:url value="/signup"/>'>Create account</a></div>
	</div>
</div>

<c:import url="footer.jsp" />