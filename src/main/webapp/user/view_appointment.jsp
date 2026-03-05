<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment History</title>

<%@include file="../component/allcss.jsp"%>

</head>

<body>

	<%@include file="../component/navbar.jsp"%>

	<div class="container p-3">

		<p class="text-center fs-3">Appointment History</p>

		<table class="table table-bordered">

			<thead class="table-success">

				<tr>
					<th>Full Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Appointment Date</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Diseases</th>
					<th>Status</th>
				</tr>

			</thead>

			<tbody>

				<c:forEach var="ap" items="${appointList}">

					<tr>

						<td>${ap.fullName}</td>
						<td>${ap.gender}</td>
						<td>${ap.age}</td>
						<td>${ap.appoinDate}</td>
						<td>${ap.email}</td>
						<td>${ap.pnNo}</td>
						<td>${ap.diseases}</td>
						<td>${ap.status}</td>

					</tr>

				</c:forEach>

			</tbody>

		</table>

	</div>

</body>
</html>