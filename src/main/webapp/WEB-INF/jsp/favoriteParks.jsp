<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />



<section class="centeredPanel">
	
	<div class="favHeader">Favorite Parks</div>
	
	<div class="favParkList">
		<c:forEach items="${parks}" var="park">
		
			<c:url value="/detail/${park.parkCode}" var="parkCode"/>
			<c:url value="/img/parks/${park.parkCode.toLowerCase()}.jpg" var="imageUrl" />
			
			<a href="parkDetail/${park.parkCode}">
			<div class="parkContainer" style="background-image: url(${imageUrl})" >

				<div class="output">
					<div class="parkName"><c:out value="${park.parkName}" /></div>
					<div class="parkState"><c:out value="${park.state}" /></div>
					<div class="parkCount">Votes for this park: <c:out value="${park.voteCount}"/></div>
				</div>
				
			</div></a>		
				
		</c:forEach>
	</div>
</section>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />