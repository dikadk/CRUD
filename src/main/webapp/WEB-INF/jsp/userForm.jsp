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
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/tether.min.css"/>
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
    </div>
</nav>
<section>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-content">
                    <p class="lead"></p>

                    <form:form method="POST" action="/users/submit">
                        <table class="table">
                            <thead class="thead-inverse">
                                <form:hidden path="id"/>
                            <tr>
                                <td><form:label path="name" >Name</form:label></td>
                                <td><form:input path="name" data-validation="length" data-validation-length="min1"/></td>
                            </tr>
                            <tr>
                                <td><form:label path="age">Age</form:label></td>
                                <td><form:input path="age" data-validation="number"
                                                data-validation-allowing="positive" /></td>
                            </tr>
                            <tr>
                                <td><form:label path="isAdmin">Is user admin?</form:label></td>
                                <td><form:checkbox path="isAdmin"/></td>
                            </tr>
                            <tr>
                                <td><form:label path="createdDate">Date of creation</form:label></td>
                                <td><form:input path="createdDate" id="createdDate" data-validation="date" data-validation-format="yyyy-MM-dd" placeholder="yyyy-MM-dd"/></td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <input type="submit" class="btn btn-secondary" value="Submit"/>
                                </td>
                            </tr>
                        </table>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</section>

<script src="/resources/js/jquery-3.1.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script src="/resources/js/tether.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script>
    $.validate();
</script>
</body>

</html>