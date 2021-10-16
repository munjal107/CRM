<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>Leads</title>
    <%@include file="../global/head.jsp" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <style>
        .m-timeline-2:before {
            content: '';
            position: absolute;
            left: 8.89rem;
            width: 0.214rem;
            height: 100%;
        }

        .m-timeline-2 .m-timeline-2__items .m-timeline-2__item .m-timeline-2__item-cricle {
            border-radius: 50%;
            border: 0.89rem solid white;
            z-index: 1;
            top: 0.2rem;
            left: 8.1rem;
            position: relative;
        }

        .m-timeline-2 .m-timeline-2__items .m-timeline-2__item .m-timeline-2__item-text {
            display: table-cell;
            vertical-align: top;
            padding-bottom: 0.3rem;
            padding-left: 10rem;
        }
    </style>
</head>

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
                            <li class="m-nav__item m-nav__item--home"><a href="#"
                                                                         class="m-nav__link m-nav__link--icon"> <i
                                    class="m-nav__link-icon la la-home"></i>
                            </a></li>
                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item"><a href="" class="m-nav__link">
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
                                <h3 class="m-portlet__head-text">
                                    Enquiry Details
                                </h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <ul class="m-portlet__nav">
                                <li class="m-portlet__nav-item">
                                    <div class="m-section__content">

                                        <span class="m-badge m-badge--accent"
                                              style="padding:2px 9px 2px 9px;">${lead.leadStatus}</span>
                                    </div>

                                </li>
                                <li class="m-portlet__nav-item">
                                    <!-- <a href="#" class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--icon m-btn--air" data-toggle="modal"  data-target="#m_modal_4">
                                        <span>
                                            <i class="fa fa-link"></i>
                                            <span>New Activity</span>
                                        </span>
                                    </a>
                                     -->
                                    <c:if test="${lead.leadStatus.equalsIgnoreCase('invoice')}">
                                        <div class="col-lg-4 col-md-9 col-sm-12">
                                            <a href="/corporate/view"
                                               class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--icon m-btn--air"><span>
														<i class="fa fa-briefcase"></i>
														<span>Customer</span>
													</span></a>
                                        </div>
                                    </c:if>
                                    <c:if test="${!lead.leadStatus.equalsIgnoreCase('invoice')}">
                                        <div class="col-lg-4 col-md-9 col-sm-12">
                                            <a href=""
                                               class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--icon m-btn--air"
                                               data-toggle="modal" data-target="#m_select2_modal"><span>
														<i class="la la-list-ul"></i>
														<span>New Activity</span>
													</span></a>
                                        </div>
                                    </c:if>

                                </li>

                            </ul>
                        </div>
                    </div>
                    <form class="m-form m-form--fit m-form--label-align-left ">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group row">
                                <label class="col-lg-1 col-form-label">Name:</label>
                                <label class="col-lg-5 col-form-label">${lead.corporateName}</label>
                                <label class="col-lg-1 col-form-label">Country:</label>
                                <label class="col-lg-5 col-form-label">${lead.country.countryName}</label>

                            </div>
                            <div class="form-group m-form__group row">
                                <label class="col-lg-1 col-form-label">Contact Name:</label>
                                <label class="col-lg-5 col-form-label">${lead.customerName}</label>
                                <label class="col-lg-1 col-form-label">State:</label>
                                <label class="col-lg-5 col-form-label">${lead.state.stateName}</label>

                            </div>
                            <div class="form-group m-form__group row">
                                <label class="col-lg-1 col-form-label">Contact Number</label>
                                <label class="col-lg-5 col-form-label">${lead.mobileNo}</label>
                                <label class="col-lg-1 col-form-label">City:</label>
                                <label class="col-lg-5 col-form-label">${lead.city.cityName}</label>
                            </div>
                            <div class="form-group m-form__group row">
                                <label class="col-lg-1 col-form-label">Email:</label>
                                <label class="col-lg-5 col-form-label">${lead.email}</label>
                                <label class="col-lg-1 col-form-label">Lead Source:</label>
                                <label class="col-lg-5 col-form-label">${lead.ls.sourceName}</label>

                            </div>
                        </div>
                    </form>
                </div>
                <div class="m-portlet m-portlet--full-height ">
                    <div class="m-portlet__body">
                        <div class="m-scrollable" data-scrollable="false" data-height="380" data-mobile-height="300"
                             align="left">

                            <!--Begin::Timeline 2 -->
                            <div class="m-timeline-2">
                                <div class="m-timeline-2__items  m--padding-top-25 m--padding-bottom-30">
                                    <c:forEach var="slist" items="${activities}">
                                        <div class="m-timeline-2__item m--margin-top-55 ">
														<span class="m-timeline-2__item-time ">
														
														<fmt:formatDate pattern="dd-MM-yyyy" value="${slist.dueDate}"/>
														
														</span>
                                            <div class="m-timeline-2__item-cricle ">
                                                <i class="fa fa-genderless m--font-success"></i>
                                            </div>
                                            <div class="m-timeline-2__item-text m-timeline-2__item-text--bold">
                                                    ${slist.actvityTitle} Assigned To ${slist.userObj.username}
                                            </div>
                                        </div>
                                        <div class="m-timeline-2__item m--margin-top-25">
														<span class="m-timeline-2__item-time">
														
														<fmt:formatDate pattern="hh:mm a" value="${slist.dueTime}"/>
														
														</span>
                                            <div class="m-timeline-2__item-cricle">
                                                <i class="fa fa-genderless m--font-danger"></i>
                                            </div>
                                            <div class="m-timeline-2__item-text  m--padding-top-5">
                                                    ${slist.description}
                                            </div>
                                        </div>

                                    </c:forEach>
                                </div>
                            </div>

                            <!--End::Timeline 2 -->
                        </div>

                    </div>
                </div>

            </div>

            <!--begin::Modal-->
            <div class="modal fade" id="m_select2_modal" role="dialog" aria-labelledby="" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="">ADD ACTIVITY</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" class="la la-remove"></span>
                            </button>
                        </div>

                        <!--begin::Form-->
                        <form class="m-form m-form--fit m-form--label-align-right " method="post"
                              action="/activity/addActivity">
                            <div class="m-portlet__body">

                                <input type="hidden" value="${lead.id }" name="lead.id">
                                <div class="form-group m-form__group row">
                                    <div class="col-lg-6">

                                        <label>TYPE</label>
                                        <select class="form-control m-select2" id="m_select2_1_modal" name="al.id">


                                        </select>

                                    </div>
                                    <div class="col-lg-6">
                                        <label class="">TITLE</label>
                                        <input type="text" class="form-control m-input" name="actvityTitle"
                                               placeholder="Enter Title">

                                    </div>

                                </div>
                                <div class="form-group m-form__group row">
                                    <div class="col-lg-6">
                                        <label>Due Date:</label>
                                        <div class="input-group date">   <!-- data-date-format="dd/mm/yyyy" -->
                                            <input type="text" class="form-control m-input" name="dDate"
                                                   data-date-format="dd/mm/yyyy" readonly placeholder="Select date"
                                                   id="m_datepicker_2"/>
                                            <div class="input-group-append">
													<span class="input-group-text">
														<i class="la la-calendar-check-o"></i>
													</span>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="col-lg-6">
                                        <label class="">Due Time:</label>
                                        <div class="input-group timepicker">
                                            <input class="form-control m-input" id="m_timepicker_3" readonly
                                                   placeholder="Select time" type="text" name="dTime"/>
                                            <!-- 	<input class="form-control m-input" name="dTime" id="m_timepicker_1_validate" readonly placeholder="Select time" type="text"  /> -->
                                            <div class="input-group-append">
                                                <span class="input-group-text"><i class="la la-clock-o"></i></span>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                <div class="form-group m-form__group row">
                                    <div class="col-lg-6">

                                        <label>OUTCOME</label>
                                        <select class="form-control m-select2" id="act_outcome" name="outcome.id">


                                        </select>

                                    </div>
                                    <div class="col-lg-6">
                                        <label class="">ASSIGN TO</label>
                                        <select class="form-control m-select2" id="act_user" name="userObj.id">


                                        </select>

                                    </div>

                                </div>

                                <div class="form-group m-form__group row">
                                    <div class="col-lg-6">

                                        <label>DESCRIPTION</label>

                                        <textarea class="form-control" id="m_autosize_1" rows="3"
                                                  name="description"></textarea>


                                    </div>


                                </div>


                            </div>
                            <br>
                            <br>
                            <br>
                            <div class="m-portlet__foot m-portlet__no-border m-portlet__foot--fit">
                                <div class="m-form__actions m-form__actions--solid">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <button type="submit" class="btn btn-primary">Save</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                Cancel
                                            </button>
                                        </div>
                                        <div class="col-lg-6 m--align-right">
                                            <button type="reset" class="btn btn-danger">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>

                        <!--end::Form-->

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

<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-datepicker.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-timepicker.js"
        type="text/javascript"></script>

<script src="<%=request.getContextPath() %>/assets/demo/demo12/custom/crud/forms/widgets/select2.js"
        type="text/javascript"></script>


<script type="text/javascript">
    $(document).ready(function () {

        $("#m_datepicker_2").datepicker().datepicker("setDate", new Date());

        $.get("/master/getActList", function (data,
                                              status) {

            $('#m_select2_1_modal').empty();
            //console.log(data);
            $("#m_select2_1_modal").append($('<option>', {
                value: '',
                text: '--Select Activity--'
            }));

            $.each(data, function (key, value) {
                $("#m_select2_1_modal").append($('<option>', {
                    value: value.id,
                    text: value.name
                }));
            });
        });


        $.get("/master/getOutcome", function (data,
                                              status) {

            $('#act_outcome').empty();
            //	console.log(data);
            $("#act_outcome").append($('<option>', {
                value: '',
                text: '--Select Activity--'
            }));

            $.each(data, function (key, value) {
                $("#act_outcome").append($('<option>', {
                    value: value.id,
                    text: value.name
                }));
            });
        });


        $.get("/master/getUsers", function (data,
                                            status) {

            $('#act_user').empty();
            //	console.log(data);
            $("#act_user").append($('<option>', {
                value: '',
                text: '--Select Activity--'
            }));

            $.each(data, function (key, value) {
                $("#act_user").append($('<option>', {
                    value: value.id,
                    text: value.username
                }));
            });
        });


    });
</script>

<!--end::Global Theme Bundle -->
</body>
</html>