<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Users</title>
<%@ include file="../component/allcss.jsp"%>
</head>

<body>

<%@ include file="navbar.jsp"%>

<div class="container mt-4">

    <h3 class="text-center mb-4">User Details</h3>

    <table class="table table-bordered">
        <thead class="table-success">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="u" items="${userList}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.fullname}</td>
                    <td>${u.email}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>