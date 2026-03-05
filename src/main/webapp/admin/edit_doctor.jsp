</body><%@page import="com.db.DBConnect"%>
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

			<!-- ================= EDIT DOCTOR FORM ================= -->
			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">

						<p class="fs-3 text-center">Edit Doctor Details</p>

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

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						Doctor d = dao2.getDoctorById(id);
						%>

						<form action="../updateDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullName" value="<%=d.getFullName()%>" required
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" value="<%=d.getDob()%>" required
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification"
									value="<%=d.getQualification()%>" required
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option><%=d.getSpecialist()%></option>
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
									name="email" value="<%=d.getEmail()%>" required
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" value="<%=d.getMobNo()%>" required
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" name="password" value="<%=d.getPassword()%>"
									required class="form-control">
							</div>
							<input type="hidden" name="id" value="<%= d.getId() %>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>

						</form>

					</div>
				</div>
			</div>


		</div>
	</div>

</body>
</html>