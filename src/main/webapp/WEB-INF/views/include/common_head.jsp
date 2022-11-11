<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cssPath" value="${pageContext.request.contextPath}/resources/css"/>
<c:set var="imgPath" value="${pageContext.request.contextPath}/resources/images"/>
<c:set var="pluginsPath" value="${pageContext.request.contextPath}/resources/plugins"/>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link rel="stylesheet" href="${cssPath}/common.css">
<link rel="stylesheet" href="${cssPath}/form_component.css">
<link rel="stylesheet" href="${cssPath}/mypage_default.css">
<link rel="stylesheet" href="${cssPath}/mypage_form.css">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<!-- PLUGINS  -->

<!-- font-awesome -->
<link rel="stylesheet" href="${pluginsPath}/font-awesome/all.min.css">
<script src="${pluginsPath}/font-awesome/all.min.js"></script>

<!-- air-datepicker -->
<link rel="stylesheet" href="${pluginsPath}/air-datepicker/css/datepicker.min.css">
<script src="${pluginsPath}/air-datepicker/js/datepicker.min.js"></script>
<script src="${pluginsPath}/air-datepicker/js/datepicker-ko.js"></script>

