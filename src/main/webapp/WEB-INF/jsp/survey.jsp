<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- This allows Spring to make our forms awesome (look into for details) --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="pageTitle" value="Registration"/>
<%@include file="common/header.jsp" %>

<div class="survey">
<h2>Survey</h2>
<p>Fill out this survey to vote for your favorite park! <br>
	Please select the park you would like to vote for, enter your email, select your state, and 
	your activity level. </p>

<c:url var="surveyUrl" value="/survey" />
<form:form action="${surveyUrl}" method="POST" modelAttribute="newSurvey">

	<div class="form-group">
	<select name="parkCode">
		<c:forEach var="park" items="${parks}">
			
			<option value="${park.parkCode}"><c:out value="${park.parkName}" /></option>
		</c:forEach>
	</select>
	
	<input name="email" type="text" placeholder="email" />
	
	<select name="stateOfResidence">
		<option value="AL">Alabama</option>
		<option value="AK">Alaska</option>
		<option value="AZ">Arizona</option>
		<option value="AR">Arkansas</option>
		<option value="CA">California</option>
		<option value="CO">Colorado</option>
		<option value="CT">Connecticut</option>
		<option value="DE">Delaware</option>
		<option value="DC">District Of Columbia</option>
		<option value="FL">Florida</option>
		<option value="GA">Georgia</option>
		<option value="HI">Hawaii</option>
		<option value="ID">Idaho</option>
		<option value="IL">Illinois</option>
		<option value="IN">Indiana</option>
		<option value="IA">Iowa</option>
		<option value="KS">Kansas</option>
		<option value="KY">Kentucky</option>
		<option value="LA">Louisiana</option>
		<option value="ME">Maine</option>
		<option value="MD">Maryland</option>
		<option value="MA">Massachusetts</option>
		<option value="MI">Michigan</option>
		<option value="MN">Minnesota</option>
		<option value="MS">Mississippi</option>
		<option value="MO">Missouri</option>
		<option value="MT">Montana</option>
		<option value="NE">Nebraska</option>
		<option value="NV">Nevada</option>
		<option value="NH">New Hampshire</option>
		<option value="NJ">New Jersey</option>
		<option value="NM">New Mexico</option>
		<option value="NY">New York</option>
		<option value="NC">North Carolina</option>
		<option value="ND">North Dakota</option>
		<option value="OH">Ohio</option>
		<option value="OK">Oklahoma</option>
		<option value="OR">Oregon</option>
		<option value="PA">Pennsylvania</option>
		<option value="RI">Rhode Island</option>
		<option value="SC">South Carolina</option>
		<option value="SD">South Dakota</option>
		<option value="TN">Tennessee</option>
		<option value="TX">Texas</option>
		<option value="UT">Utah</option>
		<option value="VT">Vermont</option>
		<option value="VA">Virginia</option>
		<option value="WA">Washington</option>
		<option value="WV">West Virginia</option>
		<option value="WI">Wisconsin</option>
		<option value="WY">Wyoming</option>
	</select>	
	
	<select name="activityLevel">
		<option value="1">Inactive</option>
		<option value="2">Sedentary</option>
		<option value="3">Active</option>
		<option value="4">Extremely Active</option>
	</select>
	
	</div>
	
	<div class="button">
	<input type="submit" value="Register" class="btn btn-default">
	</div>
	
</form:form>

</div>

<%@include file="common/footer.jsp" %>
