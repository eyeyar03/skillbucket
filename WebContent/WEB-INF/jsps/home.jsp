<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Home - Skill Bucket</title>

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
					<a class="navbar-brand" href="#">Skill Bucket</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="<c:url value='/'/>">Home</a></li>
						<li><a href="#about">About</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<c:url value='/login'/>">Log in</a></li>
						<li><a href="<c:url value='/signup'/>">Sign up</a></li>
					</ul>
				</div>
			</div>
			</nav>

			<h3 class="text-muted">Skill Bucket</h3>
		</div>

		<div class="jumbotron">

			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<h1>Skill Bucket</h1>
					<p class="lead">Cras justo odio, dapibus ac facilisis in,
						egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor
						mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-lg btn-success" href="<c:url value='/signup'/>"
							role="button">Sign up today</a>
					</p>
				</div>
				<div class="col-sm-1"></div>
			</div>
			<!-- .row -->

		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js" />'></script>

</body>
</html>