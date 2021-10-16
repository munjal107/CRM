<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>Leads</title>
    <%@include file="../global/head.jsp" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                            <%--<li class="m-nav__separator">-</li>
                            <li class="m-nav__item"><a href="" class="m-nav__link">
                                    <span class="m-nav__link-text">Add Package</span>
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
                                <h3 class="m-portlet__head-text ">Add Package</h3>
                            </div>
                        </div>
                    </div>


                    <div class="m-portlet__body">

                        <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                data-target="#m_modal_5">Add Package
                        </button>

                        <br>
                        <br>
                        <br>
                        <table class="table table-striped- table-bordered table-hover table-checkable" id="m_table_1">
                            <tr>
                                <th>Package Id</th>
                                <th>Product Name</th>

                                <th>Trial Rate</th>
                                <th>Basic Rate</th>
                                <th>Intermediate Rate</th>
                                <th>Advanced Rate</th>

                                <th>Tax</th>
                                <th>Action</th>
                            </tr>
                            <c:forEach var="slist" items="${alist}">
                                <%--${URLEncoder.encode(slist.employeeId, 'UTF-8' )}   ?id=${slist.employeeId} --%>
                                <tr>
                                    <td id="id1">${slist.id}</td>
                                    <td>${slist.productName}</td>

                                    <td>${slist.trialRate}<%-- <fmt:formatDate pattern="dd-MM-yyyy" value="${slist.createdOn}" /> --%>
                                    </td>
                                    <td>${slist.basicRate}</td>
                                    <td>${slist.intermediateRate}</td>
                                    <td>${slist.advanceRate}</td>

                                    <td>${slist.tax}</td>

                                        <%-- 	<td><a href="<%=<%=request.getContextPath()%>/master/deleteSource?id=${slist.id}">Delete</a></td> --%>
                                    <td>
                                        <a href="<%=request.getContextPath()%>/master/deletePackage?id=${slist.id}">

                                            <button class="btn btn-outline-danger m-btn m-btn--custom"><i
                                                    class="fas fa-trash"></i></button>
                                        </a>
                                        &nbsp;

                                        <button class="btn btn-outline-primary m-btn m-btn--custom" data-toggle="modal"
                                                onclick="edit(this)">
                                            <i class="la la-edit"></i>

                                        </button>

                                    </td>
                                </tr>

                            </c:forEach>
                        </table>

                    </div>

                </div>


            </div>

            <!--begin::Modal-->
            <div class="modal fade" id="m_modal_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content" style="width:450px">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Package</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/master/addPackage" method="post" id=addpackage>
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Product Name:</label>
                                    <input type="text" class="form-control" id="recipient-name" name="productName">
                                </div>
                                <!-- <div class="form-group ">
                                    <label for="recipient-name" class="form-control-label">Package Name:</label>
                                    <input type="text" class="form-control" id="recipient-name" name="packageName">
                                </div> -->

                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Trial Rate:</label>
                                    <input type="number" class="form-control" id="recipient-name" name="trialRate">
                                </div>

                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Basic Rate:</label>
                                    <input type="number" class="form-control" id="recipient-name" name="basicRate">
                                </div>

                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Intermediate Rate:</label>
                                    <input type="number" class="form-control" id="recipient-name"
                                           name="intermediateRate">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Advanced Rate:</label>
                                    <input type="number" class="form-control" id="recipient-name" name="advanceRate">
                                </div>

                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Tax:</label>
                                    <input type="number" step="any" class="form-control" id="recipient-name" name="tax">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <!--end::Modal-->

            <!--begin::Modal-->
            <div class="modal fade" id="m_modal_6" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content" style="width:450px">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Package</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/master/editPackage" id="editpackage">
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Product Name:</label>
                                    <input type="text" class="form-control" id="productName" name="productName">
                                    <input type="hidden" name="id" id="hiddenid">
                                </div>
                                <!-- <div class="form-group ">
                                    <label for="recipient-name" class="form-control-label">Package Name:</label>
                                    <input type="text" class="form-control" id="recipient-name" name="packageName">
                                </div> -->

                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Trial Rate:</label>
                                    <input type="text" class="form-control" id="trialRate" name="trialRate">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Basic Rate:</label>
                                    <input type="number" class="form-control" id="basicRate" name="basicRate">
                                </div>

                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Intermediate Rate:</label>
                                    <input type="number" class="form-control" id="intermediateRate"
                                           name="intermediateRate">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Advanced Rate:</label>
                                    <input type="number" class="form-control" id="advancedRate" name="advanceRate">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="form-control-label">Tax:</label>
                                    <input type="number" step="any" class="form-control" id="tax" name="tax">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <!--end::Modal-->


        </div>


        <!--END:: Main Body Editing -->
    </div>

    <jsp:include page="../global/footer.jsp"/>

</div>
<!-- end:: Page -->


<%@include file="../global/include-script.jsp" %>


<script type="text/javascript">

    function edit(row) {

        console.log($(row).closest('tr').html());

        var pk = $(row).closest('tr');

        var id = $(pk).find('td:eq(0)').text();

        var Pname = $(pk).find('td:eq(1)').text();

        var Trate = $(pk).find('td:eq(2)').text();

        var Brate = $(pk).find('td:eq(3)').text();

        var Irate = $(pk).find('td:eq(4)').text();

        var Arate = $(pk).find('td:eq(5)').text();

        var Tax = $(pk).find('td:eq(6)').text();

        $("#hiddenid").val(id);

        $("#productName").val(Pname);

        $("#trialRate").val(Trate);

        $("#basicRate").val(Brate);

        $("#intermediateRate").val(Irate);

        $("#advancedRate").val(Arate);

        $("#tax").val(Tax);

        $("#m_modal_6").modal('show')
    }

    $(document).ready(function () {


        /* getAllCountryAjax(); */

        $("#durationSelect").select2({
            placeholder: "Select Duration"
        });

        $("#durationSelect1").select2({
            placeholder: "Select Duration"
        });

        $("#addpackage").formValidation({
            framework: 'bootstrap',
            excluded: ":disabled",
            icon: null,
            fields: {
                productName: {
                    validators: {
                        notEmpty: {
                            message: 'Product cannot be empty'
                        },
                        regexp: {
                            regexp: /^[a-zA-z\s]+$/i,
                            message: 'Corporate Name can consist of alphabetical characters and spaces only'
                        }
                    }
                },
                trialRate: {
                    validators: {
                        notEmpty: {
                            message: 'Trial Rate cannot be empty'
                        }
                    }
                },

                basicRate: {
                    validators: {
                        notEmpty: {
                            message: 'Basic Rate cannot be empty'
                        }
                    }
                },

                intermediateRate: {
                    validators: {
                        notEmpty: {
                            message: 'Intermediate Rate cannot be empty'
                        }
                    }
                },

                advanceRate: {
                    validators: {
                        notEmpty: {
                            message: 'Advanced Rate cannot be empty'
                        }
                    }
                },

                tax: {
                    validators: {
                        notEmpty: {
                            message: 'Tax cannot be empty'
                        }
                    }
                }
            }
        })

        $("#editpackage").formValidation({
            framework: 'bootstrap',
            excluded: ":disabled",
            icon: null,
            fields: {
                productName: {
                    validators: {
                        notEmpty: {
                            message: 'Product cannot be empty'
                        },
                        regexp: {
                            regexp: /^[a-zs]+$/i,
                            message: 'Customer Name can consist of alphabetical characters and spaces only'
                        }
                    }
                },
                trialRate: {
                    validators: {
                        notEmpty: {
                            message: 'Trial Rate cannot be empty'
                        }
                    }
                },

                basicRate: {
                    validators: {
                        notEmpty: {
                            message: 'Basic Rate cannot be empty'
                        }
                    }
                },

                intermediateRate: {
                    validators: {
                        notEmpty: {
                            message: 'Intermediate Rate cannot be empty'
                        }
                    }
                },

                advanceRate: {
                    validators: {
                        notEmpty: {
                            message: 'Advanced Rate cannot be empty'
                        }
                    }
                },

                tax: {
                    validators: {
                        notEmpty: {
                            message: 'Tax cannot be empty'
                        }
                    }
                }
            }
        })

    });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>