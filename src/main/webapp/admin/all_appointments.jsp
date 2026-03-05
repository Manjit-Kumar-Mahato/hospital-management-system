<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Appointments</title>

<%@include file="../component/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
}
</style>

</head>

<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">

		<div class="row">

			<div class="col-md-12">

				<div class="card paint-card">

					<div class="card-body">

						<p class="fs-3 text-center">All Appointments</p>

						<table class="table table-bordered table-striped">

							<thead class="table-success">

								<tr>

									<th>Patient Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Disease</th>
									<th>Date</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Address</th>
									<th>Doctor ID</th>
									<th>Status</th>

								</tr>

							</thead>

							<tbody>

								<c:forEach var="ap" items="${appList}">

									<tr>

										<td>${ap.fullName}</td>

										<td>${ap.gender}</td>

										<td>${ap.age}</td>

										<td>${ap.diseases}</td>

										<td>${ap.appoinDate}</td>

										<td>${ap.email}</td>

										<td>${ap.pnNo}</td>

										<td>${ap.address}</td>

										<td>${ap.doctorId}</td>

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

				</div>

			</div>

		</div>

	</div>

</body>
</html>