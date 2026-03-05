<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>

<%
AppointmentDao dao2 = new AppointmentDao(DBConnect.getConn());

int apCount = dao2.getTotalAppointment();
%>

<%
SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
int spCount = dao.countSpecialist();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@ include file="../component/allcss.jsp"%>

<style>
.point-card {
	transition: transform .3s ease, box-shadow .3s ease;
	box-shadow: 0 4px 10px rgba(0, 0, 0, .15);
	border-radius: 12px;
	cursor: pointer;
}

.point-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 25px rgba(0, 0, 0, .25);
}
</style>
</head>

<body>
	<%@ include file="navbar.jsp"%>

	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">

		<p class="text-center fs-3">Admin Dashboard</p>

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

		<div class="row mt-4">

			<!-- Doctor -->
			<div class="col-md-4">
				<a href="<c:url value='/view_doctors'/>"
					style="text-decoration: none;">
					<div class="card point-card">
						<div class="card-body text-center text-primary">
							<i class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4">
								Doctor <br> ${doctorCount}
							</p>
						</div>
					</div>
				</a>
			</div>

			<!-- User -->
			<div class="col-md-4">
				<a href="<c:url value='/view_users'/>"
					style="text-decoration: none;">
					<div class="card point-card">
						<div class="card-body text-center text-warning">
							<i class="fas fa-user-circle fa-3x"></i><br>
							<p class="fs-4">
								User <br> ${userCount}
							</p>
						</div>
					</div>
				</a>
			</div>

			<!-- Total Appointment -->
			<div class="col-md-4">

				<a href="<%=request.getContextPath()%>/admin_appointments"
					style="text-decoration: none">

					<div class="card point-card">

						<div class="card-body text-center text-success">

							<i class="far fa-calendar-check fa-3x"></i>

							<p class="fs-4">
								Total Appointment <br>
								<%=apCount%>
							</p>

						</div>
					</div>

				</a>

			</div>
		</div>

		<div class="row mt-4">

			<!-- Specialist -->
			<div class="col-md-4">
				<div class="card point-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-danger">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4">
							Specialist <br>
							<%=spCount%>
						</p>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="<%=request.getContextPath()%>/addSpecialist"
						method="post">
						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control" required>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>