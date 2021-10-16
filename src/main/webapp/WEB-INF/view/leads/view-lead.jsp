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
                        <h3 class="m-subheader__title m-subheader__title--separator">New</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home"><a href="/"
                                                                         class="m-nav__link m-nav__link--icon"> <i
                                    class="m-nav__link-icon la la-home"></i>
                            </a></li>
                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item"><a href="/enquiry/new" class="m-nav__link">
                                <span class="m-nav__link-text">Enquiry</span>
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
                                <h3 class="m-portlet__head-text">Leads</h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <ul class="m-portlet__nav">
                                <li class="m-portlet__nav-item"><a href="/enquiry/new"
                                                                   class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--icon m-btn--air">
											<span> <i class="fa fa-link"></i> <span>New
													Lead</span>
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
                                    id="m_table_1" style="overflow: auto">
                                <thead>
                                <tr>
                                    <th>Serial Number</th>
                                    <th>Date</th>
                                    <th>Created By</th>
                                    <th>Lead Source</th>
                                    <th>Corporate Name</th>
                                    <th>Customer Name</th>
                                    <th>Mobile Number</th>
                                    <th>City</th>
                                    <th>Status</th>
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
<script
        src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js"
        type="text/javascript"></script>

<!--end::Page Vendors -->

<script type="text/javascript">
    /* var DatatablesDataSourceAjaxClient =
    {
            init: function() {
                $("#m_table_1").DataTable(
                {
                    responsive: !0,
                    ajax:
                    {
                        url: "/location/countries/"
                    },
                    columns: [
                    {
                        data: "id"
                    },
                    {
                        data: "createdOn"
                    },
                    {
                        data: "leadSourceId"
                    }
                    ,
                    {
                        data: "corporateName"
                    }
                    ,
                    {
                        data: "customerName"
                    }
                    ,
                    {
                        data: "mobileNo"
                    }
                    ,
                    {
                        data: "city"
                    }
                    ,
                    {
                        data: "leadstatus"
                    }
                    ,
                    {
                        data: "Actions"
                    }
                   ]

                })
            }
        };
     */

    $(document)
        .ready(
            function () {
                /*  DatatablesDataSourceAjaxClient.init()
                 */
                $("#m_table_1")
                    .DataTable(
                        {

                            scrollX: true,
                            scrollCollapse: true,

                            ajax: {
                                url: "/enquiry/getLeads",
                                dataSrc: function (d) {
                                    return d
                                }
                            },


                            columns: [{
                                data: "id"
                            }, {
                                data: "createdOn"
                            }, {
                                data: "createdBy"
                            }, {
                                data: "ls.sourceName"
                            }, {
                                data: "corporateName"
                            }, {
                                data: "customerName"
                            }, {
                                data: "mobileNo"
                            }, {
                                data: "city.cityName"
                            }, {
                                data: "leadStatus"
                            }

                                , {
                                    data: "Action"
                                }],
                            columnDefs:
                                [
                                    {
                                        targets: -1,
                                        title: "Actions",
                                        orderable: !1,
                                        render: function (a, t, e,
                                                          n) {
                                            return '<a class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" href="/enquiry/editLead/' + e.id + '" title="Edit Lead">\n       <i class="la la-edit"></i></a>\n <a href="/activity/view/' + e.id + '" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" title="Add Activity">\n                          <i class="la la-list-ul"></i>\n                        </a> \n'
                                        }
                                    },
                                    {
                                        targets: 1,
                                        title: "Date",
                                        orderable: !1,
                                        render: function (a, t, e,
                                                          n) {
                                            return '<p>' + moment(a).format('DD-MM-YYYY HH:mm:ss');
                                            +'</p>'
                                        }
                                    },
                                    {
                                        targets: -2,
                                        title: "Status",
                                        orderable: !1,
                                        render: function (a, t, e,
                                                          n) {
                                            return '<div class="m-section__content"> <span class="m-badge m-badge--accent" style="padding:2px 9px 2px 9px;">' + a + '</span></div> '
                                        }
                                    }
                                ]

                        });

            });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>