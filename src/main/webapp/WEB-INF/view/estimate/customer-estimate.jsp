<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>Vasy CRM</title>
    <%@include file="../global/head.jsp" %>
</head>
<!-- end::Head -->

<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled 
									m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">

    <jsp:include page="../global/header.jsp"/>


    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <jsp:include page="../global/navigationbar.jsp"/>

        <!-- Begin:: Main Body Editing -->

        <div class="m-grid__item m-grid__item--fluid m-wrapper">


            <div class="m-content" id="myContent">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="m-portlet">
                            <div class="m-portlet__body m-portlet__body--no-padding">
                                <div class="m-invoice-2">
                                    <div class="m-invoice__wrapper">
                                        <div class="m-invoice__head"
                                             style="background-image: url(../../assets/app/media/img//logos/bg-6.jpg);">
                                            <div class="m-invoice__container m-invoice__container--centered">
                                                <div class="m-invoice__logo">
                                                    <a href="#">
                                                        <h1>ESTIMATE</h1>
                                                    </a>
                                                    <a href="#">
                                                        <img src="../../assets/app/media/img/logos/logo_client_color.png">
                                                    </a>
                                                </div>
                                                <span class="m-invoice__desc">
															<span>Shapath IV, B/205, </span>
															<span>Sarkhej Gandhinagar Highway</span>
														<span>Ahmedabad,Gujarat 380058</span>
														</span>
                                                <div class="m-invoice__items">
                                                    <div class="m-invoice__item">
                                                        <span class="m-invoice__subtitle">DATE</span>
                                                        <span class="m-invoice__text"><fmt:formatDate
                                                                value="${iData.createdOn}"
                                                                pattern="dd-MM-yyyy  HH:mm:ss"/></span>
                                                    </div>
                                                    <div class="m-invoice__item">
                                                        <span class="m-invoice__subtitle">INVOICE NO.</span>
                                                        <span class="m-invoice__text">IN - ${iData.estimateNo }</span>
                                                    </div>
                                                    <div class="m-invoice__item">
                                                        <span class="m-invoice__subtitle">INVOICE TO.</span>
                                                        <span class="m-invoice__text">${iData.lead.address }.</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-invoice__body m-invoice__body--centered">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <th>PRODUCT</th>
                                                        <th style="text-align: left;">PACKAGE</th>
                                                        <th>RATE</th>
                                                        <th>TAX</th>
                                                        <th>AMOUNT</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    <c:forEach items="${iData.invoicePackages}" varStatus="status"
                                                               var="alist">
                                                        <tr>
                                                            <td>${alist.productName}</td>
                                                            <td style="text-align: left;">${plist[status.index]}</td>

                                                            <td>${rlist[status.index]}
                                                                    <%-- <c:set var = "string1" value = "${plist[status.index] }" />

                                                                    <c:set var = "string2" value = "${fn:toLowerCase(string1)}Rate" />

                                                                    ${alist[string2] } --%>
                                                            </td>
                                                            <td>${alist.tax }</td>
                                                            <td class="m--font-danger">
                                                                    <%--
                                                            <c:set var = "total" value = "${alist[string2]+ alist[string2] * alist.tax /100}" />${total } --%>
                                                                <fmt:parseNumber var="i" type="number"
                                                                                 value="${rlist[status.index]+rlist[status.index] * alist.tax /100}"/>
                                                                <fmt:formatNumber type="number" maxFractionDigits="2"
                                                                                  value="${i}"/>


                                                                    <%-- <c:set var = "total" value = "${rlist[status.index] * alist.tax /100}" /> --%>

                                                            </td>
                                                        </tr>

                                                    </c:forEach>

                                                    <!-- <tr>
                                                        <td>Creative Design</td>
                                                        <td>80</td>
                                                        <td>$40.00</td>
                                                        <td class="m--font-danger">$3200.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Front-End Development</td>
                                                        <td>120</td>
                                                        <td>$40.00</td>
                                                        <td class="m--font-danger">$4800.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Back-End Development</td>
                                                        <td>210</td>
                                                        <td>$60.00</td>
                                                        <td class="m--font-danger">$12600.00</td>
                                                    </tr> -->
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="m-invoice__footer">
                                            <div class="m-invoice__table  m-invoice__table--centered table-responsive">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th>TOTAL AMOUNT</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td class="m--font-danger">&#8377 ${iData.totalAmount }</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="m-portlet">
                            <div class="m-portlet__body m-portlet__body--no-padding"
                                 style="padding:15px 20px 35px 20px">
                                <div class="col-mg-5">
                                    Generate / Print (.PDF):
                                    <span style="text-align:right;float:right;margin-bottom:15px;">
											<a target="_blank" href="/estimate/print-estimate/${iData.estimateNo}">
											<button class="btn btn-primary">Print Estimate</button>
											</a>
											</span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div id="editor"></div>
            </div>
            <%--
            <button onclick="location.href='/invoice/print-invoice/${iData.invoiceNo}'" id="cmd">Generate PDF</button>
            <button id="cmd"><a href="/invoice/print-invoice/${iData.invoiceNo}" >Generate PDF</a></button>
             --%>
        </div>


        <!--END:: Main Body Editing -->
    </div>

    <jsp:include page="../global/footer.jsp"/>

</div>
<!-- end:: Page -->
<script src="<%=request.getContextPath() %>/assets/xepOnline.jqPlugin.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>


<%@include file="../global/include-script.jsp" %>
<!-- 	<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script> -->

<script type="text/javascript">
    $(document).ready(function () {


        var doc = new jsPDF();
        var specialElementHandlers = {
            '#editor': function (element, renderer) {
                return true;
            }
        };

        /* 	$('#cmd').click(function () {
                doc.fromHTML($('#myContent').html(), 15, 15, {
                    'width': 170,
                        'elementHandlers': specialElementHandlers
                });
                doc.save('sample-file.pdf');
            });
             */


    });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>