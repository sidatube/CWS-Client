<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.cwsclient.entity.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Employee> list = (ArrayList<Employee>) request.getAttribute("employees");
    if (list == null) {
        list = new ArrayList<>();
    }

%>
<html>
<head>
    <title>Foods</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<ul class="nav align-items-center">
    <li class="nav-item">
        <a class="nav-link active" href="/"> <img src="../../Image/E6ZdPfXX0AAn-vN.jpg" width="100"
                                                  class="rounded-circle">
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/employees">Product</a>
    </li>

</ul>
<div class="container">

    <a href="/employees/create" class="btn btn-outline-primary float-right">Create</a>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Employee's name</th>
            <th scope="col">Salary</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Employee employee : list
            ) {%>
        <tr>
            <td><%=employee.getId()%>
            </td>
            <td><%=employee.getName()%>
            </td>

            <td><%=employee.getSalary()%> VND</td>
            <td>
                <%--                <button>Detail</button>--%>


                <a href="/employees/update?id=<%=employee.getId()%>" class="btn btn-outline-success">Update</a>

            </td>
        </tr>
        <%}%>
        </tbody>
    </table>


</div>
</body>
<script>
</script>
</html>
