<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Doctors</title>
<%@ include file="../component/allcss.jsp"%>
</head>

<body>

	<%@ include file="navbar.jsp"%>

	<div class="container mt-4">

		<h3 class="text-center mb-4">Doctor Details</h3>

		<!-- Error message -->
		<c:if test="${not empty errorMsg}">
			<p class="fs-5 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<!-- Success message -->
		<c:if test="${not empty succMsg}">
			<div class="fs-5 text-center text-success" role="alert">
				${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<table class="table table-bordered">
			<thead class="table-success">
				<tr>
					<th>ID</th>
					<th>Full Name</th>
					<th>DOB</th>
					<th>Qualification</th>
					<th>Specialist</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Actions</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="d" items="${doctorList}">
					<tr>
						<td>${d.id}</td>
						<td>${d.fullName}</td>
						<td>${d.dob}</td>
						<td>${d.qualification}</td>
						<td>${d.specialist}</td>
						<td>${d.email}</td>
						<td>${d.mobNo}</td>
						<td><a
							href="<c:url value='/admin/edit_doctor.jsp?id=${d.id}'/>"
							class="btn btn-sm btn-primary"> Edit </a> <a
							href="<c:url value='/deleteDoctor?id=${d.id}'/>"
							class="btn btn-sm btn-danger"> Delete </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
</html>