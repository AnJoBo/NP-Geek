<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />



<section class="centeredPanel">
	
		<c:forEach items="${parks}" var="park">
		
			<div class="parkContainer">
			
				<div class="homeParkImg">
					<c:url value="/detail/${park.parkCode}" var="parkCode"/>
					<a href="parkDetail/${park.parkCode}">
						<img class="parkImage" alt="${park.parkName}" src="img/parks/${park.parkCode.toLowerCase()}.jpg" />
					</a>
				</div>

				<div class="homeParkInfo">
					<div class="parkName"><c:out value="${park.parkName}" /></div>
					<div class="parkState"><c:out value="${park.state}" /></div>
					<div class="homeParkDescription">&#160; &#160;<c:out value="${park.parkDescription}"/></div>
				</div>
			</div>	
						
		</c:forEach>
	
</section>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />