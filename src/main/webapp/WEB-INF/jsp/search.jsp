<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>It will be awesome</title>
    <script src="/resources/js/jquery-3.1.1.slim.min.js"></script>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/tether.min.css"/>
    <script src="/resources/js/tether.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>
<nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="/">Spring MVC Crud App</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        </ul>
        <c:url var="searchAction" value="/search/"/>
        <form:form action="${searchAction}" commandName="search" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchString" id="txt">
            <button id="button-id" class="btn btn-outline-success my-2 my-sm-0" type="submit" style="color:white">
                Search
            </button>
        </form:form>
    </div>
</nav>
<section>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <a href="/users/add" class="btn btn btn-primary" style="color:white">Add User</a>
                <span id="count">Total users: ${usersCount}</span>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-content">
                    <p class="lead"></p>
                    <table class="table">
                        <thead class="thead-inverse">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Is Admin?</th>
                            <th>Date of creation</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <th scope="row"><c:out value="${user.id}"/></th>
                                <td><c:out value="${user.name}"/></td>
                                <td><c:out value="${user.age}"/></td>
                                <td><c:if test="${user.isAdmin}">
                                    YES
                                </c:if>
                                    <c:if test="${!user.isAdmin}">
                                        NO
                                    </c:if></td>
                                <td><c:out value="${user.createdDate}"/></td>
                                <td>
                                    <a class="btn btn-secondary" href="<c:url value='/users/${user.id}/edit'/>">
                                        Edit
                                    </a>
                                </td>
                                <td><a href="/users/${user.id}/delete" class="btn btn-secondary"
                                       onclick="return confirm('Are you sure you want to delete this user?');"> <i
                                        class="fa-fa-times"></i>Delete
                                </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- /.container -->
</section>
</body>
</html>