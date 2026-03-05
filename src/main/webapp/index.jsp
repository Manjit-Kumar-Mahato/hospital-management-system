<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
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
	<%@include file="component/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/1st.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/2nd.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/3rd.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/4th.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>
		<div class="row">

			<div class="col-md-8 p-5">
				<div class="row g-4">

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Clean Enviroment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="img/doc.png" height="380px" width="420px">
			</div>
		</div>
	</div>

	<hr>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		
		<div class="row">
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img src="img/doc.png" height="300px" width="250px">
						<p class="fw-bold fs-5">Manjit Kumar</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img src="img/doc.png" height="300px" width="250px">
						<p class="fw-bold fs-5">Manjit Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img src="img/doc.png" height="300px" width="250px">
						<p class="fw-bold fs-5">Manjit Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img src="img/doc.png" height="300px" width="250px">
						<p class="fw-bold fs-5">Manjit Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>


		</div>
	</div>


	<%@ include file="component/footer.jsp" %>
</body>
</html>