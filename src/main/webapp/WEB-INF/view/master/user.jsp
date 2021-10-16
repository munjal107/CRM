<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>Leads</title>
    <%@include file="../global/head.jsp" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>
<!-- end::Head -->

<body
        class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled
									m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">

    <jsp:include page="../global/header.jsp"/>


    <div
            class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <jsp:include page="../global/navigationbar.jsp"/>

        <!-- Begin:: Main Body Editing -->

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title m-subheader__title--separator">New</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home"><a href="/"
                                                                         class="m-nav__link m-nav__link--icon"> <i
                                    class="m-nav__link-icon la la-home"></i>
                            </a></li>
                            <%--	<li class="m-nav__separator">-</li>
                                <li class="m-nav__item"><a href="" class="m-nav__link">
                                        <span class="m-nav__link-text">Add User</span>
                                </a></li>--%>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="m-content">

                <!--begin::Portlet-->
                <div class="m-portlet m-portlet--tab">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
									<span class="m-portlet__head-icon m--hide"> <i
                                            class="la la-gear"></i>
									</span>
                                <h3 class="m-portlet__head-text ">Add User</h3>
                            </div>
                        </div>
                    </div>


                    <div class="m-portlet__body">

                        <button type="button" class="btn btn-outline-primary"
                                data-toggle="modal" data-target="#m_select2_modal">Add
                            User
                        </button>

                        <br> <br> <br>
                        <table
                                class="table table-striped- table-bordered table-hover table-checkable"
                                id="m_table_1">
                            <tr>
                                <th>Id</th>
                                <th>UserName</th>
                                <th>Role</th>
                                <th>Email</th>
                                <th>Created By</th>
                                <th>Action</th>
                            </tr>
                            <c:forEach var="slist" items="${alist}">
                                <%--${URLEncoder.encode(slist.employeeId, 'UTF-8' )}   ?id=${slist.employeeId} --%>
                                <tr>
                                    <td id="id1">${slist.id}</td>
                                    <td>${slist.username}</td>
                                    <td>${slist.role.name }</td>
                                    <td>${slist.userEmail}<%-- <fmt:formatDate pattern="dd-MM-yyyy" value="${slist.createdOn}" /> --%>
                                    </td>
                                    <td>${slist.createdBy}</td>

                                        <%-- 	<td><a href="<%=<%=request.getContextPath()%>/master/deleteSource?id=${slist.id}">Delete</a></td> --%>
                                    <td><a
                                            href="<%=request.getContextPath()%>/master/deleteUser?id=${slist.id}">

                                        <button class="btn btn-outline-danger m-btn m-btn--custom">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </a> &nbsp;

                                        <button class="btn btn-outline-primary m-btn m-btn--custom"
                                                data-toggle="modal" onclick="edit(this)">
                                            <i class="la la-edit"></i>

                                        </button>
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>

                    </div>

                </div>


            </div>

            <div class="modal fade" id="m_select2_modal" role="dialog"
                 aria-labelledby="" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add User</h5>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true" class="la la-remove"></span>
                            </button>
                        </div>
                        <form autocomplete="off" id="userForm" class="m-form m-form--fit m-form--label-align-right"
                              action="/master/addUser" method="post">
                            <div class="modal-body">

                                <div class="form-group m-form__group row m--margin-top-20">
                                    <label class="col-form-label col-lg-3 col-sm-12">User
                                        Name</label>
                                    <div class="col-lg-9 col-md-9 col-sm-12">
                                        <input class="form-control m-input" type="text"
                                               placeholder="User Name"
                                               name="username">
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label class="col-form-label col-lg-3 col-sm-12">Email
                                    </label>
                                    <div class="col-lg-9 col-md-9 col-sm-12">
                                        <input class="form-control m-input" readonly
                                               onfocus="this.removeAttribute('readonly');"
                                               type="email" placeholder="Email"
                                               name="userEmail">
                                    </div>
                                </div>
                                <%--<div class="form-group m-form__group row">
                                    <label class="col-form-label col-lg-3 col-sm-12">Password
                                        </label>
                                    <div class="col-lg-9 col-md-9 col-sm-12">
                                        <input class="form-control m-input" readonly  onfocus="this.removeAttribute('readonly');"
                                        type="password"	id="example-text-input" placeholder="Password"
                                            name="password" autocomplete="off">
                                    </div>
                                </div>
                            --%>
                                <div class="form-group m-form__group row">
                                    <label class="col-form-label col-lg-3 col-sm-12">Select
                                        Role</label>
                                    <div class="col-lg-9 col-md-9 col-sm-12">
                                        <select class="form-control m-select2" id="m_select2_3_modal"
                                                name="role">
                                            <option value="" disabled selected>Select Role</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary m-btn"
                                        data-dismiss="modal" id="closeButton1">Close
                                </button>
                                <button type="submit" class="btn btn-brand m-btn">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="m_select2_modal1" role="dialog"
                 aria-labelledby="" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit User</h5>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true" class="la la-remove"></span>
                            </button>
                        </div>
                        <form autocomplete="off" id="userForm1" class="m-form m-form--fit m-form--label-align-right"
                              action="/master/editUser" method="post">
                            <div class="modal-body">

                                <div class="form-group m-form__group row m--margin-top-20">
                                    <label class="col-form-label col-lg-3 col-sm-12">User
                                        Name</label>
                                    <div class="col-lg-9 col-md-9 col-sm-12">
                                        <input class="form-control m-input" type="text"
                                               placeholder="User Name" id="Uname1"
                                               name="username">
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label class="col-form-label col-lg-3 col-sm-12">Email
                                    </label>
                                    <div class="col-lg-9 col-md-9 col-sm-12">
                                        <input class="form-control m-input" readonly
                                               onfocus="this.removeAttribute('readonly');"
                                               type="email" placeholder="Email"
                                               name="userEmail" id="Email">
                                    </div>
                                </div>
                                <input type="hidden" id="hiddenid" name="id"/>
                                <div class="form-group m-form__group row">
                                    <label class="col-form-label col-lg-3 col-sm-12">Select
                                        Role</label>
                                    <div class="col-lg-9 col-md-9 col-sm-12">
                                        <select class="form-control m-select2" id="m_select2_3_modal1"
                                                name="role" style="width:100%">
                                            <option value="" disabled selected>Select Role</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn  btn-secondary m-btn"
                                        data-dismiss="modal" id="closeButton2">Close
                                </button>
                                <button type="submit" class="btn btn-brand m-btn">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


        </div>


        <!--END:: Main Body Editing -->
    </div>

    <jsp:include page="../global/footer.jsp"/>

</div>
<!-- end:: Page -->


<%@include file="../global/include-script.jsp" %>
<script
        src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/select2.js"
        type="text/javascript"></script>

<script type="text/javascript">
    // 		$("#m_select2_3_modal").select2({
    // 			placeholder : "Select Role"
    // 		});
    $("#closeButton1").click(function () {
        $("#userForm").trigger("reset");
    });
    $("#closeButton2").click(function () {
        $("#userForm").trigger("reset");
    });

    $.get("/master/getRole", function (data, status) {

        $('#m_select2_3_modal').empty();
        console.log(data);
        $("#m_select2_3_modal").append($('<option>', {
            value: '',
            text: '--Select Role--'
        }));

        $.each(data, function (key, value) {
            $("#m_select2_3_modal").append($('<option>', {
                value: value.id,
                text: value.name
            }));
        });
    });

    $.get("/master/getRole", function (data, status) {

        $('#m_select2_3_modal1').empty();
        console.log(data);
        $("#m_select2_3_modal1").append($('<option>', {
            value: '',
            text: '--Select Role--'
        }));

        $.each(data, function (key, value) {
            $("#m_select2_3_modal1").append($('<option>', {
                value: value.id,
                text: value.name
            }));
        });
    });

    function edit(row) {

        console.log($(row).closest('tr').html());

        var lead = $(row).closest('tr');

        var Uname = $(lead).find('td:eq(1)').text();

        var id = $(lead).find('td:eq(0)').text();

        var Email = $(lead).find('td:eq(3)').text();


        $("#Uname1").val(Uname);
        $("#Email").val(Email);


        var email = $(lead).find('td:eq(0)').text();

        $('#m_select2_3_modal1').select2(
            {placeholder: "Select Role"}
        );
        $('#m_select2_3_modal').select2(
            {placeholder: "Select Role"}
        );


        $("#hiddenid").val(id);

        $("#m_select2_modal1").modal('show')
    }

    $(document).ready(function () {

        $("#userForm").formValidation({
            framework: 'bootstrap',
            excluded: ":disabled",
            icon: null,
            fields: {
                username: {
                    validators: {

                        regexp: {
                            regexp: /^[0-9a-zA-z\s]+$/i,
                            message: 'Corporate Name can consist of alphanumeric characters and spaces only'
                        },
                        notEmpty: {
                            message: 'Username cannot be empty'
                        },
                        remote: {
                            message: 'Username already exist',
                            url: '/master/checkUser',
                            type: 'POST'

                        }
                    }
                },
                userEmail: {
                    validators: {
                        notEmpty: {
                            message: 'Email cannot be empty'
                        },
                        remote: {
                            message: 'Email already exist',
                            url: '/master/checkUserEmail',
                            type: 'POST'

                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'Email cannot be empty'
                        },
                        stringLength: {
                            min: 8,
                            message: 'Password must contain atleast 8 characters'
                        }
                    }
                },
                role: {
                    validators: {
                        notEmpty: {
                            message: 'Select Role'
                        }
                    }
                }
            }
        });


        $("#userForm1").formValidation({
            framework: 'bootstrap',
            excluded: ":disabled",
            icon: null,
            fields: {
                username: {
                    validators: {
                        notEmpty: {
                            message: 'Username cannot be empty'
                        },
                        remote: {
                            message: 'Username already exist',
                            url: '/master/checkUser',
                            type: 'POST'

                        }
                    }
                },
                userEmail: {
                    validators: {
                        notEmpty: {
                            message: 'Email cannot be empty'
                        },
                        remote: {
                            message: 'Email already exist. ',
                            url: '/master/checkUserEmail',
                            type: 'POST'

                        }
                    }
                },
                role: {
                    validators: {
                        notEmpty: {
                            message: 'Select Role'
                        }
                    }
                }
            }
        });
    });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>