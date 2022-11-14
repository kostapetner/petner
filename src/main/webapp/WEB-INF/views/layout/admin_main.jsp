<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="cssPath"
	value="${pageContext.request.contextPath}/resources/css" />
<c:set var="imgPath"
	value="${pageContext.request.contextPath}/resources/images" />
<c:set var="pluginsPath"
	value="${pageContext.request.contextPath}/resources/plugins" />

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="${cssPath}/common.css">
<!--  <link rel="stylesheet" href="${pluginsPath}/bootstrap/css/bootstrap.min.css"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="${cssPath}/admin_page.css">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/dashboard/">
<title>${title}</title>
<script>
    /* global bootstrap: false */
    (() => {
      'use strict'
      const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
      tooltipTriggerList.forEach(tooltipTriggerEl => {
        new bootstrap.Tooltip(tooltipTriggerEl)
      })
    })()

    var collapseElementList = [].slice.call(document.querySelectorAll('.collapse'))
    var collapseList = collapseElementList.map(function (collapseEl) {
      return new bootstrap.Collapse(collapseEl)
    })
    </script>
<style>
.position_in {
	position: inherit
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
</head>
<body>
	<div id="wrapper">
		<!-- HEADER BASIC -->
		<c:import url='/WEB-INF/views/include/admin_header.jsp' />

		<!-- SIDEBAR BASIC -->
		<c:import url='/WEB-INF/views/include/admin_sidebar.jsp' />


		<!-- CONTAINER -->
		<div class="container-fluid">
			<div class="row">
				<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
					<c:import url='/WEB-INF/views/${page}.jsp' />
				</main>
			</div>
		</div>

		<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

		<script
			src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
			integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
			integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
			crossorigin="anonymous"></script>
		<script src="dashboard.js"></script>
</body>
</html>
