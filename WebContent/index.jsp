<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="clases.Persona"%>
<% Persona e = new Persona ("Juan", "Rayman Tutamcamon", 35, 2.09f);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Documents</title>
</head>
<body>
<h1>Datos</h1>
	
	<h3><%= e.getNombre() %></h3>
	<h3><%= e.getApellidos() %></h3>
	<h3><%= e.getEdad() %></h3>
	<h3><%= e.getAltura() %></h3>
</body>
</html>