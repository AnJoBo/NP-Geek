<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<section class="centeredPanel">

	<div class="detailParkName"><c:out value="${park.parkName}" /></div>
	<h3 class="parkState">
		<c:out value="${park.state}" />
	</h3>

	<c:url value="/img/parks/${park.parkCode.toLowerCase()}.jpg"
		var="imageUrl" />
	<div class="parkDetailTop" style="background-image: url(${imageUrl})">

		<div class="outputParkStats">
			<div class="entryFee">
				<c:out value="Entry Fee: \$${park.entryFee}" />
			</div>
			<div class="Acreage">
				<c:out value="Acreage: ${park.acreage}" />
			</div>
			<div class="ElevationInFeet">
				<c:out value="Elevation: ${park.elevationInFeet}ft" />
			</div>
			<div class="milesOfTrail">
				<c:out value="Miles of trails: ${park.milesOfTrail}mi" />
			</div>
			<div class="numberOfCampsites">
				<c:out value="Campsites: ${park.numberOfCampsites}" />
			</div>
			<div class="climate">
				<c:out value="Climate Type: ${park.climate}" />
			</div>
			<div class="yearFounded">
				<c:out value="Founding Year: ${park.yearFounded}" />
			</div>
			<div class="annualVisitorCount">
				<c:out value="Visitors per year: ${park.annualVisitorCount}" />
			</div>
			<div class="numberOfAnimalSpecies">
				<c:out value="Animal Species: ${park.numberOfAnimalSpecies}" />
			</div>
			<div class="inspirationalQuote">
				<c:out value='"${park.inspirationalQuote}"' />
			</div>
			<div class="inspirationalQuoteSource">
				<c:out value='-${park.inspirationalQuoteSource}' />
			</div>
		</div>

	</div>

	<div class="descriptionRight">
		<div class="parkDescription">
			&#160; &#160;<c:out value="${park.parkDescription}" />
		</div>


		<div class="fiveDayHeader">5 Day Forecast</div>
		<div class="forecastSection">

			<div class="forecast">
				<c:forEach var="day" items="${weather}">
				
					<div class="dayForecast">
					<div class="forToday">TODAY</div>
						<c:url value="/img/weather/${day.forecast}.png" var="forecast" />
						<div class="forecastImgDiv tooltip">
							<img class="forecastImg" alt="forecast" src="${forecast}" />
						</div>

						<c:if test="${sessionScope.tempForm == 'f'}">
							<div class="low"><c:out value="Low: ${day.low}" />&#8457;</div>
							<div class="high"><c:out value="High: ${day.high}" />&#8457;</div>
						</c:if>
						<c:if test="${sessionScope.tempForm == 'c' || sessionScope.tempForm == null}">
							<div class="low"><c:out value="Low: ${day.lowC}" />&#8451;</div>
							<div class="high"><c:out value="High: ${day.highC}" />&#8451;</div>
						</c:if>
						
						<ul class="recommendation">
							<c:if test="${day.forecast == 'snow' }">
								<li>Pack snowshoes!</li>
							</c:if>
							<c:if test="${day.forecast == 'rain' }">
								<li>Pack waterproof shoes!</li>
							</c:if>
							<c:if test="${day.forecast == 'thunderstorms' }">
								<li>Seek shelter and avoid hiking on exposed ridges!</li>
							</c:if>
							<c:if test="${day.forecast == 'sunny' }">
								<li>Pack sunblock!</li>
							</c:if>
							<c:if test="${day.low > 75 || day.high > 75 }">
								<li>Bring extra water!</li>
							</c:if>
							<c:if test="${day.high-day.low > 20 }">
								<li>Wear breathable layers!</li>
							</c:if>
							<c:if test="${day.low < 20 || day.high < 20 }">
								<li>Dangerously COLD!</li>
							</c:if>
						</ul>
						
					</div>
					
				</c:forEach>
				
			</div>
			<div class="tempFormatForm">
			<c:url var="tempForm" value="/parkDetail/${parkCode}" />
				<form action="${tempForm}" method="POST">
					Pick a Temperature Unit: 
					<select name="tempForm">
						<option value="f">Fahrenheit</option>
						<option value="c">Celsius</option>
					</select> <input class="formSubmitButton" type="submit" value="Submit" />
				</form>
			</div>
		</div>
	</div>



</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
