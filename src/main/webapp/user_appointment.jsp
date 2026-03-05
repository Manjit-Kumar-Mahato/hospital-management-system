<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>

<%@ include file="component/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 40vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>

	<%@ include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 p-5">
				<img src="img/doct.jpg" width="80%" height="70%">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">

						<p class="text-center fs-3">Book Appointment</p>

						<!-- Error Message -->
						<c:if test="${not empty errorMsg}">
							<p class="fs-5 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<!-- Success Message -->
						<c:if test="${not empty succMsg}">
							<p class="fs-5 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="add_appoint" method="post">

							<input type="hidden" name="userid" value="${userObj.id}">

							<div class="col-md-6">
								<label>Full Name</label> <input required type="text"
									class="form-control" name="fullName">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="">--select--</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label>Age</label> <input required type="number"
									class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label>Appointment Date</label> <input required type="date"
									class="form-control" name="appoint_date">
							</div>

							<div class="col-md-6">
								<label>Email</label> <input required type="email"
									class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label>Phone No</label> <input maxlength="10" required
									type="number" class="form-control" name="phno">
							</div>

							<div class="col-md-6">
								<label>Diseases</label> <input required type="text"
									class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label>Doctor</label> <select required class="form-control"
									name="doc_id">
									<option value="">--select--</option>

									<c:forEach var="d" items="${doctorList}">
										<option value="${d.id}">${d.fullName}
											(${d.specialist})</option>
									</c:forEach>

								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"></textarea>
							</div>

							<div class="col-md-12 text-center">
								<c:if test="${empty userObj}">
									<a href="ulogin.jsp" class="btn btn-success">Submit</a>
								</c:if>

								<c:if test="${not empty userObj}">
									<button class="btn btn-success">Submit</button>
								</c:if>
							</div>

						</form>

					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>