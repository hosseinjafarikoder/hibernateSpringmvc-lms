<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>BookList</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">
        <h2>This is Book List</h2>
        <hr />

        <input type="button" value="Add Book"
               onclick="window.location.href='showBookForm'; return false;"
               class="btn btn-primary" />
        <br/><br/>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Book List</div>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>Name</th>
                        <th>Author Name</th>

                    </tr>

                    <!-- loop over and print our customers -->
                    <c:forEach var="tempBook" items="${theBooks}">

                        <!-- construct an "update" link with customer id -->
                        <c:url var="updateLink" value="/updateBookForm">
                            <c:param name="bookId" value="${tempBook.id}" />
                        </c:url>

                        <!-- construct an "delete" link with customer id -->
                        <c:url var="deleteLink" value="/deleteBook">
                            <c:param name="bookId" value="${tempBook.id}" />
                        </c:url>

                        <tr>
                            <td>${tempBook.name}</td>
                            <td>${tempBook.authorName}</td>

                            <td>
                                <!-- display the update link --> <a href="${updateLink}">Update</a>
                                | <a href="${deleteLink}"
                                     onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                            </td>

                        </tr>

                    </c:forEach>

                </table>

            </div>
        </div>
    </div>

</div>
</body>
</html>