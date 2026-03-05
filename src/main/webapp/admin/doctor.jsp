<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.entity.Doctor"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor</title>

<%@ include file="../component/allcss.jsp"%>

<style>
.point-card {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	border-radius: 12px;
}

.point-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
}
</style>
</head>

<body>

	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">

			<!-- ================= ADD DOCTOR FORM ================= -->
			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">

						<p class="fs-3 text-center">Add Doctor</p>

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

						<form action="../addDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullName" required class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" required class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" required class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option>--select--</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									name="email" required class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" required class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" name="password" required class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>

						</form>

					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>