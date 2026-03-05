<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>

<%@include file="../component/allcss.jsp"%>

<style>
.point-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
	transition: 0.3s;
}

.point-card:hover {
	transform: scale(1.05);
}
</style>

</head>

<body>

	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container p-5">

		<h2 class="text-center mb-4">Doctor Dashboard</h2>

		<div class="row">

			<!-- Total Appointments -->

			<div class="col-md-4">

				<div class="card point-card">

					<div class="card-body text-center text-primary">

						<i class="fas fa-calendar-check fa-3x"></i>

						<h4 class="mt-3">Total Appointments</h4>

						<h3>${totalApp}</h3>

					</div>

				</div>

			</div>

			<!-- Pending Appointments -->

			<div class="col-md-4">

				<div class="card point-card">

					<div class="card-body text-center text-warning">

						<i class="fas fa-clock fa-3x"></i>

						<h4 class="mt-3">Pending</h4>

						<h3>${pendingApp}</h3>

					</div>

				</div>

			</div>

			<!-- Approved Appointments -->

			<div class="col-md-4">

				<div class="card point-card">

					<div class="card-body text-center text-success">

						<i class="fas fa-check-circle fa-3x"></i>

						<h4 class="mt-3">Approved</h4>

						<h3>${approvedApp}</h3>

					</div>

				</div>

			</div>

		</div>

		<br>

		<div class="container mt-5">

			<h3 class="text-center mb-4">Today's Appointments</h3>

			<table class="table table-bordered table-hover">

				<thead class="table-success">

					<tr>

						<th>Patient</th>
						<th>Gender</th>
						<th>Age</th>
						<th>Disease</th>
						<th>Date</th>
						<th>Status</th>

					</tr>

				</thead>

				<tbody>

					<c:forEach var="ap" items="${todayList}">

						<tr>

							<td>${ap.fullName}</td>
							<td>${ap.gender}</td>
							<td>${ap.age}</td>
							<td>${ap.diseases}</td>
							<td>${ap.appoinDate}</td>
							<td><c:choose>

									<c:when test="${ap.status=='Pending'}">
										<span class="badge bg-warning text-dark">Pending</span>
									</c:when>

									<c:when test="${ap.status=='Approved'}">
										<span class="badge bg-success">Approved</span>
									</c:when>

									<c:otherwise>
										<span class="badge bg-danger">Rejected</span>
									</c:otherwise>

								</c:choose></td>

						</tr>

					</c:forEach>

				</tbody>

			</table>

		</div>

		<div class="row mt-4">

			<div class="col-md-12 text-center">

				<a href="<%=request.getContextPath()%>/doctor_appointments"
					class="btn btn-primary btn-lg"> View Appointments </a>

			</div>

		</div>

	</div>

</body>
</html>