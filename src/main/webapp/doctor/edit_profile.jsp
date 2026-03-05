<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../component/allcss.jsp"%>
<%@include file="navbar.jsp"%>

<%
com.entity.Doctor d = (com.entity.Doctor) session.getAttribute("doctObj");
%>

<div class="container p-5">
	<div class="row">
		<div class="col-md-4 offset-md-4">

			<div class="card">
				<div class="card-body">

					<p class="fs-3 text-center">Edit Profile</p>

					<c:if test="${not empty succMsg}">
						<p class="text-center text-success fs-5">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg}">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<form action="<%=request.getContextPath()%>/updateDoctorProfile"
						method="post">

						<input type="hidden" name="id" value="<%=d.getId()%>">

						<div class="mb-3">
							<label>Full Name</label> <input type="text" class="form-control"
								name="fullname" value="<%=d.getFullName()%>">
						</div>

						<div class="mb-3">
							<label>Email</label> <input type="email" class="form-control"
								name="email" value="<%=d.getEmail()%>">
						</div>

						<div class="mb-3">
							<label>Phone</label> <input type="text" class="form-control"
								name="mobno" value="<%=d.getMobNo()%>">
						</div>

						<div class="mb-3">
							<label>Password</label> <input type="text" class="form-control"
								name="password" value="<%=d.getPassword()%>">
						</div>

						<button class="btn btn-success col-md-12">Update</button>

					</form>

				</div>
			</div>

		</div>
	</div>
</div>