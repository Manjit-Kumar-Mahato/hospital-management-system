<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>

<%@include file="../component/allcss.jsp"%>

</head>

<body>

	<%@include file="../component/navbar.jsp"%>

	<!-- check if user logged in -->
	<c:if test="${empty userObj}">
		<c:redirect url="../user_login.jsp" />
	</c:if>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card shadow">
					<div class="card-body">

						<h4 class="text-center mb-4">Change Password</h4>

						<!-- Success Message -->
						<c:if test="${not empty succMsg}">
							<div class="alert alert-success text-center">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<!-- Error Message -->
						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger text-center">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="<%=request.getContextPath()%>/changeUserPassword"
							method="post">

							<input type="hidden" name="uid" value="${userObj.id}">

							<div class="mb-3">
								<label class="form-label">Old Password</label> <input
									type="password" name="oldPassword" class="form-control"
									required>
							</div>

							<div class="mb-3">
								<label class="form-label">New Password</label> <input
									type="password" name="newPassword" class="form-control"
									required>
							</div>

							<button type="submit" class="btn btn-success w-100">
								Change Password</button>

						</form>

					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>