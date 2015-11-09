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

<title>Sign up - Skill Bucket</title>

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
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/login"/>">Have an account? Log in</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6 jumbotron">
			<p class="lead">Join Skill Bucket today.</p>
			<c:url value="/dosignup" var="doSignUpUrl"/>
			<sf:form modelAttribute="user" method="post" action="${doSignUpUrl}"
				class="form-horizontal" role="form">
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="text" name="username" path="username" class="form-control" 
						placeholder="Username" required="required"/>
						<sf:errors path="username" cssClass="alert-danger"></sf:errors>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<sf:input type="password" name="password" path="password" class="form-control" 
						placeholder="Password" required="required"/>
						<sf:errors path="password" cssClass="alert-danger"></sf:errors>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input type="password" class="form-control" name="confirmpassword"
							placeholder="Confirm password" required/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-primary btn-md btn-block">
							Create Account</button>
					</div>
       			</div>
		      
			</sf:form>
		</div> <!-- .jumbotron -->

</div> <!-- .row -->

<c:import url="footer.jsp" />