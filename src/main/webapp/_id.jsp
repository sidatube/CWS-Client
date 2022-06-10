<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.cwsclient.entity.Employee" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    String success = (String) request.getAttribute("success");
    String failure = (String) request.getAttribute("failure");
    Employee employee = (Employee) request.getAttribute("employee");
    if (employee == null) {
        employee = new Employee();
        employee.setId(0);
    }

%>
<html>

<head>
    <meta charset="UTF-8">
    <title><%
        if (employee.getId() > 0) {
    %>Update<%} else {%>Create
        <%}%></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
    .hide {
        display: none;
    }
</style>
<body>
<ul class="nav align-items-center">
    <li class="nav-item">
        <a class="nav-link active" href="/"> <img src="../../Image/E6ZdPfXX0AAn-vN.jpg" width="100"
                                                  class="rounded-circle">
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/employees">Food</a>
    </li>


</ul>
<section class="section">
    <div class="container">
        <a href="/employees" class="btn btn-outline-primary md-3">Back</a>

        <%
            if (employee.getId() == 0) {
        %>
        <form method="post" action="/employees/create" class="needs-validation" name="form-submit" novalidate>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <% if (success != null) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <span><%=success%>! Click <a href="/employees">Here</a> to show list Product </span>
                    </div>
                    <%
                        }
                    %>
                    <% if (failure != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <span><%=failure%>! Try again late</span>
                    </div>
                    <%
                        }
                    %>
                    <label for="foodName">Product name</label>
                    <input type="text" class="form-control" name="name" id="foodName" placeholder="Food"
                           required>
                    <div class="invalid-feedback">
                        Please enter food name.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <label for="Price">Price</label>
                    <input type="number" class="form-control" name="price" id="Price" placeholder="Price"
                           required>
                    <div class="invalid-feedback">
                        Please enter price.
                    </div>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>
        </form>

        <%} else {%>
        <form method="post" action="/employees/update?id=<%=employee.getId()%>" name="form-submit" class="needs-validation"
              novalidate>
            <div class="form-row">
                <input type="hidden" name="id" value="<%=employee.getId()%>">
                <div class="col-md-8 mb-3">
                    <% if (success != null) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <span><%=success%>! Click <a href="/employees">Here</a> to show list </span>
                    </div>
                    <%
                        }
                    %>
                    <% if (failure != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <span><%=failure%>! Try again late</span>
                    </div>
                    <%
                        }
                    %>
                    <label for="foodName">Product name</label>
                    <input type="text" class="form-control" name="name" id="foodName" value="<%=employee.getName()%>"
                           placeholder="Food"
                           required>
                    <div class="invalid-feedback">
                        Please enter food name.
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-8 mb-3">

                    <label for="Price">Price</label>
                    <input type="number" class="form-control" value="<%=employee.getSalary()%>" name="price" id="Price"
                           placeholder="Price"
                           required>
                    <div class="invalid-feedback">
                        Please enter price.
                    </div>
                </div>
            </div>

            <button class="btn btn-primary" type="submit">Submit</button>
        </form>

        <%}%>

    </div>

</section>

<script src="https://upload-widget.cloudinary.com/global/all.js" type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script type="text/javascript">


    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
    // var myWidget = cloudinary.createUploadWidget({
    //         cloudName: 'thanhbc',
    //         uploadPreset: 'xzfsuj2g'
    //     }, (error, result) => {
    //         if (!error && result && result.event === "success") {
    //             console.log('Done! Here is the image info: ', result.info);
    //             var img = document.getElementById("preview-img");
    //             img.classList.remove("hide");
    //             img.src = result.info.url
    //             document.forms['form-submit']['thumbnail'].value = result.info.url
    //
    //         }
    //     }
    // )
    //
    // document.getElementById("upload_widget").addEventListener("click", function () {
    //     myWidget.open();
    // }, false);
</script>

</body>
</html>
