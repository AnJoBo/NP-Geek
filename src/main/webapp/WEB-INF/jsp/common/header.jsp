<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>National Park Geek Inc</title>
    <c:url value="/css/npGeek.css" var="cssHref" />
    <link rel="stylesheet" href="${cssHref}">
</head>

<body>
    <header>
    		<c:url value="/" var="homePageHref" />
    		<div class="logo">
    		<c:url value="/img/logo.png" var="logoSrc" />
        <a href="${homePageHref}">
        		<img src="${logoSrc}" alt="National Park Geek logo" />
        </a>
        </div>
        <h1>National Park Database</h1>
    </header>
    <nav>
        <h2>"What a country chooses to save is what a country chooses to say about itself."</h2>
      			<p>- Mollie Beattie, Director of U.S. Fish and Wildlife Service</p>
        <p> </p>
        <ul>
        		<c:url value="/" var="homePageLink" />
            <li><a href="${homePageLink}">Home</a></li>
            <c:url value="/survey" var="surveyPageLink" />
            <li><a href="${surveyPageLink}">Survey</a></li>
     
        </ul>
    </nav>
    
    <div class="cb-slideshow">