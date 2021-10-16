<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>Leads</title>
    <%@include file="../global/head.jsp" %>


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
                        <h3 class="m-subheader__title m-subheader__title--separator">View</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home"><a href="/"
                                                                         class="m-nav__link m-nav__link--icon"> <i
                                    class="m-nav__link-icon la la-home"></i>
                            </a></li>
                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item"><a href="/estimate/new" class="m-nav__link">
                                <span class="m-nav__link-text">Estimate</span>
                            </a></li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="m-content">
                <div class="m-portlet m-portlet--mobile">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">ESTIMATE</h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <ul class="m-portlet__nav">
                                <li class="m-portlet__nav-item"><a href="/estimate/new"
                                                                   class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--icon m-btn--air">
											<span> <i class="fa fa-wallet"></i> <span>Generate Estimate</span>
										</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="m-portlet__body">

                        <div style="">
                            <!--begin: Datatable -->
                            <table
                                    class="table table-striped- table-bordered table-hover table-checkable"
                                    id="m_table_2" style="overflow: auto">
                                <thead>
                                <tr>
                                    <th>Estimate_number</th>
                                    <th>Corporate Name</th>
                                    <th>Customer Name</th>

                                    <th>Amount</th>
                                    <th>Created By</th>
                                    <th>Package Name</th>
                                    <th>Package Type</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                            </table>

                        </div>

                    </div>
                </div>

                <!-- END EXAMPLE TABLE PORTLET-->
            </div>


        </div>


        <!--END:: Main Body Editing -->
    </div>

    <jsp:include page="../global/footer.jsp"/>


</div>
<!-- end:: Page -->


<%@include file="../global/include-script.jsp" %>


<!--begin::Page Vendors -->
<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js"
        type="text/javascript"></script>

<!--end::Page Vendors -->

<script type="text/javascript"></script>


<script type="text/javascript">


    $(document)
        .ready(
            function () {
                /*  DatatablesDataSourceAjaxClient.init()
                 */
                var t = $("#m_table_2").DataTable(
                    {

                        scrollX: true,
                        scrollCollapse: true,

                        ajax: {
                            url: "/estimate/getAllEstimate",
                            dataSrc: function (d) {

                                return d;
                            }
                        },


                        columns: [{
                            data: "estimateNo"
                        }, {
                            data: "lead.corporateName"
                        }, {
                            data: "lead.customerName"
                        }, {
                            data: "totalAmount"
                        }, {
                            data: "createdBy"
                        }, {
                            data: "invoicePackages"
                        }, {
                            data: "packageName"
                        }, {
                            data: "Action"
                        }],
                        columnDefs:
                            [
                                {
                                    targets: -1,
                                    title: "Actions",
                                    orderable: !1,
                                    render: function (a, t, e, n) {
                                        return '<a href="/estimate/print-estimate/' + e.estimateNo + '" target="_blank" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" title="Print Estimate">\n                          <i class="fa fa-print"></i>\n                        </a> \n\n<a href="/estimate/viewEstimate/' + e.id + '" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" title="Generate Estimate">\n                          <i class="fa fa-wallet"></i>\n                        </a> '
                                    }
                                }, {
                                targets: 5,
                                title: "Product Name",
                                orderable: !1,
                                render: function (a, t, e, n) {
                                    var st = '';
                                    for (var i = 0; i < a.length; i++)
                                        st = st + ' ' + a[i].productName;

                                    return st;

                                }
                            }

                            ]

                    });

            });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>