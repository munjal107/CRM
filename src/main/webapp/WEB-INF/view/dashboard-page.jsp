<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-- begin::Head -->
<head>
    <title>Vasy CRM</title>
    <meta charset="UTF-8"/>
    <%@include file="global/head.jsp" %>
</head>
<!-- end::Head -->

<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled 
									m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">

    <jsp:include page="global/header.jsp"/>


    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <jsp:include page="global/navigationbar.jsp"/>

        <!-- Begin:: Main Body Editing -->

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <!-- BEGIN: Subheader -->
            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title m-subheader__title--separator">Dashboard</h3>
                    </div>

                </div>
            </div>

            <!-- END: Subheader    enter all the content here -->
            <div class="m-content">

                <c:if test="${sessionScope.authorities == 'ROLE_ADMIN' }">

                    <div class="col-xl-6">
                        <!--begin:: Widgets/Daily Sales-->
                        <div class="m-widget14">
                            <div class="m-widget14__header m--margin-bottom-30">
                                <h3 class="m-widget14__title">
                                    Last 15 Day Sales
                                </h3>
                                <span class="m-widget14__desc">
													Day Wise Sales Details
													</span>
                            </div>
                            <div class="m-widget14__chart" style="height:120px;">
                                <canvas id="daywise_sales"></canvas>
                            </div>
                        </div>
                        <!--end:: Widgets/Daily Sales-->
                    </div>


                    <div class="m-widget14__header m--margin-bottom-30">
                        <h3 class="m-widget14__title">
                            All Stats
                        </h3>

                    </div>

                    <!--begin:: Widgets/Stats-->
                    <div class="m-portlet  m-portlet--unair">
                        <div class="m-portlet__body  m-portlet__body--no-padding">
                            <div class="row m-row--no-padding m-row--col-separator-xl">
                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::Total Profit-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Total Profit
                                            </h4><br>

                                            <span class="m-widget24__stats m--font-brand">
													&#8377
													<fmt:formatNumber type="number" maxFractionDigits="2"
                                                                      value="${totalProfit}"/>
												</span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-brand" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::Total Profit-->
                                </div>

                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::New Orders-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Total Leads
                                            </h4><br>

                                            <span class="m-widget24__stats m--font-danger">
                                                    ${totalLeads}
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-danger" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::New Orders-->
                                </div>
                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::New Feedbacks-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Total Customers
                                            </h4><br>
                                            <span class="m-widget24__desc">

												</span>
                                            <span class="m-widget24__stats m--font-info">
                                                    ${totalCustomers}
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-info" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::New Feedbacks-->
                                </div>

                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::New Users-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Customer Feedbacks
                                            </h4><br>
                                            <span class="m-widget24__desc">

												</span>
                                            <span class="m-widget24__stats m--font-success">
                                                    ${totalSupport }
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-success" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::New Users-->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--end:: Widgets/Stats-->


                    <div class="m-widget14__header m--margin-bottom-24">
                        <h4 class="m-widget14__title">
                            Last 7 Days Stats
                        </h4>

                    </div>

                    <!--begin:: Widgets/Stats-->
                    <div class="m-portlet  m-portlet--unair">
                        <div class="m-portlet__body  m-portlet__body--no-padding">
                            <div class="row m-row--no-padding m-row--col-separator-xl">
                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::Total Profit-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Profit
                                            </h4><br>

                                            <span class="m-widget24__stats m--font-brand">
													&#8377
													<fmt:formatNumber type="number" maxFractionDigits="2"
                                                                      value="${weekProfit}"/>
												</span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-brand" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::Total Profit-->
                                </div>

                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::New Orders-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Leads
                                            </h4><br>

                                            <span class="m-widget24__stats m--font-danger">
                                                    ${weekLeads}
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-danger" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::New Orders-->
                                </div>
                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::New Feedbacks-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Customers
                                            </h4><br>
                                            <span class="m-widget24__desc">

												</span>
                                            <span class="m-widget24__stats m--font-info">
                                                    ${weekCustomers}
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-info" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::New Feedbacks-->
                                </div>

                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::New Users-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Customer Feedbacks
                                            </h4><br>
                                            <span class="m-widget24__desc">

												</span>
                                            <span class="m-widget24__stats m--font-success">
                                                    ${weekSupport }
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-success" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::New Users-->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--end:: Widgets/Stats-->


                </c:if>

                <c:if test="${sessionScope.authorities == 'ROLE_USER' }">

                    <div class="m-portlet  m-portlet--unair">
                        <div class="m-portlet__body  m-portlet__body--no-padding">
                            <div class="row m-row--no-padding m-row--col-separator-xl">
                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::Total Profit-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Activity to Do
                                            </h4><br>

                                            <span class="m-widget24__stats m--font-brand">
                                                    ${activityCount}
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-brand" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::Total Profit-->
                                </div>

                                <div class="col-md-12 col-lg-6 col-xl-3">

                                    <!--begin::New Orders-->
                                    <div class="m-widget24">
                                        <div class="m-widget24__item">
                                            <h4 class="m-widget24__title">
                                                Total Leads
                                            </h4><br>

                                            <span class="m-widget24__stats m--font-danger">
                                                    ${leadsCreated}
                                            </span>
                                            <div class="m--space-10"></div>
                                            <div class="progress m-progress--sm">
                                                <div class="progress-bar m--bg-danger" role="progressbar"
                                                     style="width: 100%;" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>

                                        </div>
                                    </div>

                                    <!--end::New Orders-->
                                </div>


                            </div>
                        </div>
                    </div>

                </c:if>

            </div>
        </div>


        <!--END:: Main Body Editing -->
    </div>

    <jsp:include page="global/footer.jsp"/>

</div>
<!-- end:: Page -->

<%@include file="global/include-script.jsp" %>

<script type="text/javascript">

    $(document).ready(function () {

        var e = $("#daywise_sales");
        if (0 != e.length) {
            var t = {
                labels: ['${sales_date}'],
                datasets: [{backgroundColor: mApp.getColor("success"), data: [${sales_data}]}]
            };
            new Chart(e, {
                type: "bar",
                data: t,
                options: {
                    title: {display: !1},
                    tooltips: {intersect: !1, mode: "nearest", xPadding: 10, yPadding: 10, caretPadding: 10},
                    legend: {display: !1},
                    responsive: !0,
                    maintainAspectRatio: !1,
                    barRadius: 4,
                    scales: {
                        xAxes: [{display: !1, gridLines: !1, stacked: !0}],
                        yAxes: [{display: !1, stacked: !0, gridLines: !1}]
                    },
                    layout: {padding: {left: 0, right: 0, top: 0, bottom: 0}}
                }
            })
        }

    });

</script>
</body>
</html>