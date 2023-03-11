<%@page import="com.google.zxing.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="404.jsp"%>
<%
ServletContext sc1 = request.getServletContext();
User u = (User) sc1.getAttribute("user-login-success-context");
if (u == null) {
	//session.setAttribute("user-login", 404);
	response.sendRedirect("404.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap.min.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Applied candidates</title>
<meta content="" name="description">
<meta content="" name="keywords">


<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Favicons -->
<link href="../assets/img/favicon.png" rel="icon">
<link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../assets/css/style.css" rel="stylesheet">

<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<link
	href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap.min.css"
	rel="stylesheet">


<script>
	$(document).ready(function() {
		$(".toast").toast({
			autohide : false
		});
	});
</script>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,600);

#steps {
	width: 505px;
	margin: 50px auto;
}

.step {
	width: 40px;
	height: 40px;
	background-color: #fff;
	display: inline-block;
	border: 4px solid;
	border-color: black;
	border-radius: 50%;
	color: black;
	font-weight: 600;
	text-align: center;
	line-height: 35px;
}

.step:first-child {
	line-height: 40px;
}

.step:nth-child(n+2) {
	margin: 0 0 0 100px;
	transform: translate(0, -4px);
}

.step:nth-child(n+2):before {
	width: 75px;
	height: 3px;
	display: block;
	background-color: rgb(228, 219, 219);
	transform: translate(-95px, 21px);
	content: '';
}

.step:after {
	width: 150px;
	display: block;
	transform: translate(-55px, 3px);
	color: #818698;
	content: attr(data-desc);
	font-weight: 400;
	font-size: 13px;
}

.step:first-child:after {
	transform: translate(-55px, -1px);
}

.step:before {
	
}

.step.active {
	border-color: #58bb58;
	color: #0c0c0c;
	background-color: #58bb58;
}

.step.active:before {
	background: linear-gradient(to right, #58bb58 0%, #73b5e8 100%);
}

.step.active:after {
	color: #58bb58;
}

.step.active:before {
	color: #58bb58;
}

.step.done {
	background-color: #58bb58;
	border-color: #58bb58;
	color: #fff;
}

.step.done:before {
	background-color: #58bb58;
}

.modal-box {
	width: 800px;
}
</style>
</head>

<body>

	<%@ include file="_header.jsp"%>
	<%@ include file="_sidebar.jsp"%>



	<main id="main" class="main">
<%
	try {
		boolean msg = (boolean) session.getAttribute("not-shortlisted");
		if (msg == false) {
	%>
	<div class="toast-container"
		style="position: absolute; top: 10px; right: 10px;">
		<div class="toast fade show">
			<div class="toast-header bg-success text-white">
				<strong class="me-auto"><i class="bi-globe"></i> Error!</strong> <small>just
					now</small>
				<button type="button" class="btn-close" data-bs-dismiss="toast"></button>
			</div>
			<div class="toast-body">
				<h5>
					<b> Your resume is not yet been shotlisted  </b>
				</h5>
			</div>
		</div>
	</div>

	<%
	}
	} catch (Exception e) {

	}
	session.removeAttribute("not-shortlisted");
	%>

		<div class="pagetitle">
			<h1>Applied Candidates</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="">Home</a></li>
					<li class="breadcrumb-item">User</li>
					<li class="breadcrumb-item active">Applied Jobs</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<table id="example" class="table table-striped table-bordered"
			style="width: 100%">
			<thead>
				<tr>
					<th>SrNo</th>
					<th>Application Id</th>
					<th>JobTitle</th>
					<th>Aptitude Marks</th>
					<th>Resume</th>
					<th>Submitted Date</th>

					<th>Track</th>
				</tr>
			</thead>
			<tbody>
				<%
				UserDAO ud = new UserDAO();
				ResultSet rs = ud.getAllCandidatesByUserId(u.getUser_id());
				int i = 1;
				while (rs.next()) {
					User u1 = ud.getUserDataById(rs.getInt(3));
					ResultSet rs2 = ud.getJobDetailsByJobId(rs.getInt(4));
					if (rs2.next()) {
				%>
				<tr>
					<td><%=i%></td>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs2.getString(4)%></td>
					<td>
						<%
						if (rs.getInt(9) == 0) {
						%> - <%
						} else {
						%> <%=rs.getInt(9)%> <%
 }
 %>
					</td>
					<td><a href="../resume/<%=rs.getString(5)%>" target="_blank"
						class="btn btn-primary">View</a></td>


					<td><%=rs.getString(12)%></td>
					<td><button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#largeModal">
							Track</button></td>
				</tr>
				<%
				i++;
				}
				}
				%>


			</tbody>
			<tfoot>
				<tr>
					<th>SrNo</th>
					<th>Application Id</th>
					<th>JobTitle</th>
					<th>Aptitude Marks</th>
					<th>Resume</th>
					<th>Submitted Date</th>

					<th>Track</th>
				</tr>
			</tfoot>
		</table>
		<div class="modal fade" id="largeModal" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-lg" >
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Application Status</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<div id="steps">
							<div class="step active" data-desc="Application Submitted">1</div>
							<div class="step  " data-desc="Resume Shortlisted">2</div>
							<div class="step " data-desc="Aptitude Passed">3</div>
							<div class="step  " data-desc="Interview Call">4</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End Vertically centered Modal-->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>WorkConnect</span></strong>. All
			Rights Reserved
		</div>
		<div class="credits">

			Designed by <a href="">WorkConnect Team</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/vendor/chart.js/chart.umd.js"></script>
	<script src="../assets/vendor/echarts/echarts.min.js"></script>
	<script src="../assets/vendor/quill/quill.min.js"></script>
	<script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="../assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="../assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="../assets/js/main.js"></script>

	<script src="../assets/css/saber-toast.js"></script>
	<script src='./assets/css/script.js'></script>

	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>



</body>

</html>