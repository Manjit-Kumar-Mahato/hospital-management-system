<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Appointments</title>

<%@include file="../component/allcss.jsp"%>

</head>

<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">

		<h3 class="text-center mb-4">All Appointments</h3>

		<table class="table table-bordered">

			<thead class="table-success">

				<tr>
					<th>Patient</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Disease</th>
					<th>Date</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Status</th>
					<th>Action</th>
				</tr>

			</thead>

			<tbody>

				<c:forEach var="ap" items="${appointList}">

					<tr>

						<td>${ap.fullName}</td>
						<td>${ap.gender}</td>
						<td>${ap.age}</td>
						<td>${ap.diseases}</td>
						<td>${ap.appoinDate}</td>
						<td>${ap.email}</td>
						<td>${ap.pnNo}</td>


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

						<td><c:if test="${ap.status=='Pending'}">

								<a
									href="<%=request.getContextPath()%>/updateStatus?id=${ap.id}&status=Approved"
									class="btn btn-success btn-sm">Approve</a>

								<a
									href="<%=request.getContextPath()%>/updateStatus?id=${ap.id}&status=Rejected"
									class="btn btn-danger btn-sm">Reject</a>

							</c:if> <c:if test="${ap.status!='Pending'}">

								<span class="text-muted">No Action</span>

							</c:if></td>

					</tr>

				</c:forEach>

			</tbody>

		</table>

	</div>

</body>
</html>