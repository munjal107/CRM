<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
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

            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title m-subheader__title--separator">Support</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                                <a href="/" class="m-nav__link m-nav__link--icon">
                                    <i class="m-nav__link-icon la la-home"></i>
                                </a>
                            </li>
                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item">
                                <a href="/support/view" class="m-nav__link">
                                    <span class="m-nav__link-text">Support</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="m-content">

                <form class="m-form m-form--fit m-form--label-align-right" method="post" action="/support/addSupport">
                    <!--begin::Portlet-->
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
												<span class="m-portlet__head-icon m--hide">
													<i class="la la-gear"></i>
												</span>
                                    <h3 class="m-portlet__head-text">
                                        Case
                                    </h3>
                                </div>
                            </div>
                        </div>

                        <!--begin::Form-->

                        <div class="m-portlet__body">
                            <table width="100%">
                                <tr>
                                    <td width="50%">


                                        <div class="form-group m-form__group row">
                                            <label class="col-3 col-form-label">Corporate Name</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air m-select2"
                                                        name="lead.id" id="crp_name">
                                                    <option value="">Select Corporate Name</option>

                                                </select>
                                            </div>
                                        </div>

                                    </td>


                                    <td width="50%" style="vertical-align: text-top;">

                                        <div class="form-group m-form__group row">
                                            <label class="col-3 col-form-label">Contact Number</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text" id="contactNo"
                                                       placeholder="Enter Contact Person Number">
                                            </div>

                                        </div>


                                    </td>

                                </tr>

                            </table>


                        </div>


                    </div>


                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
												<span class="m-portlet__head-icon m--hide">
													<i class="la la-gear"></i>
												</span>
                                    <h3 class="m-portlet__head-text">
                                        Case Information
                                    </h3>
                                </div>
                            </div>
                        </div>

                        <!--begin::Form-->

                        <div class="m-portlet__body">
                            <table width="100%">
                                <tr>
                                    <td width="50%">

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Case
                                                Channel</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air" name="caseChannel"
                                                        id="select_case">
                                                    <option value="" disabled selected>Case</option>
                                                    <option value="Phone">Phone</option>
                                                    <option value="Web">Web</option>
                                                    <option value="Social">Social</option>
                                                    <option value="Portal">Portal</option>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Case
                                                Type</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air" name="caseType"
                                                        id="select_type">
                                                    <option value="" disabled selected>Technical</option>
                                                    <option value="Technical">Technical</option>
                                                    <option value="Non-Technical">Non-Technical</option>
                                                    <option value="Demo/Training">Demo/Training</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Case
                                                Priority</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air" name="casePriority"
                                                        id="select_priority">
                                                    <option value="" disabled selected>Medium</option>
                                                    <option value="Low">Low</option>
                                                    <option value="Medium">Medium</option>
                                                    <option value="High">High</option>
                                                    <option value="Critical">Critical</option>

                                                </select>
                                            </div>
                                        </div>
                                    </td>


                                    <td width="50%" style="vertical-align: text-top;">

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Case
                                                Classification</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        name="caseClassification" id="select_classification">
                                                    <option value="" disabled selected>Problem</option>
                                                    <option value="Question">Question</option>
                                                    <option value="Problems">Problems</option>
                                                    <option value="Feature">Feature</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Case
                                                Status</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air" name="caseStatus"
                                                        id="select_status">
                                                    <option value="" disabled selected>Open</option>
                                                    <option>Open</option>
                                                    <option>In Progress</option>
                                                    <option>Escalated</option>
                                                    <option>Resolve</option>
                                                    <option>Not Possible</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label class="col-form-label col-lg-3 col-sm-12">Date</label>
                                            <div class="col-9">
                                                <div class="input-group date">
                                                    <input type="text" name="issueDate" class="form-control m-input"
                                                           readonly data-date-format="dd/mm/yyyy"
                                                           placeholder="Select Date" id="m_datepicker_3"/>
                                                    <div class="input-group-append">
																			<span class="input-group-text">
																				<i class="la la-calendar"></i>
																			</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </td>

                                </tr>

                            </table>


                        </div>


                    </div>

                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
												<span class="m-portlet__head-icon m--hide">
													<i class="la la-gear"></i>
												</span>
                                    <h3 class="m-portlet__head-text">
                                        Technical
                                    </h3>
                                </div>
                            </div>
                        </div>

                        <!--begin::Form-->

                        <div class="m-portlet__body">
                            <table width="100%">
                                <tr>
                                    <td width="50%">

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Case
                                                Module</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air" name="caseModule"
                                                        id="select_module">
                                                    <option value="" disabled selected>Select Case Module</option>
                                                    <option value="Sales">Sales</option>
                                                    <option value="Purchase">Purchase</option>
                                                    <option value="Corporate">Corporate</option>
                                                    <option value="Transation">Transaction</option>
                                                    <option value="Inventory">Inventory</option>
                                                    <option value="Service">Service</option>
                                                    <option>Activity</option>
                                                    <option>Invoice</option>
                                                    <option>Estimate</option>
                                                    <option>CRUD</option>
                                                    <option>User Management</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label class="col-3" for="exampleTextarea"> Case Remarks</label>
                                            <div class="col-9">
                                                <textarea class="form-control m-input m-input--air" name="caseRemarks"
                                                          older="Remarks" id="exampleTextarea" rows="3"></textarea>
                                            </div>
                                        </div>
                                    </td>


                                    <td width="50%" style="vertical-align: text-top;">

                                        <%--	<div class="form-group m-form__group row">
                                                <label for="example-text-input" class="col-3 col-form-label">Case Sub Module</label>
                                                <div class="col-9">
                                                    <select class="form-control m-input m-input--air" name="caseSubModule" id="select_submodule">
                                                        <option value="" disabled selected>Select Case Sub Module</option>

                                                    </select>
                                                </div>
                                            </div>--%>


                                        <div class="form-group m-form__group row">
                                            <label class="col-3 col-form-label">Assign To</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air" name="userObj.id"
                                                        id="assignTo1">
                                                    <option value="" disabled selected>Select User</option>

                                                </select>
                                            </div>
                                        </div>


                                    </td>

                                </tr>

                            </table>


                        </div>

                        <div class="m-portlet__foot m-portlet__foot--fit" align="center">
                            <div class="m-form__actions">
                                <div class="row">
                                    <div class="col-12">
                                        <button type="reset" class="btn btn-secondary">Cancel</button>
                                        <button type="submit" class="btn btn-success">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                </form>
                <!--end::Portlet-->


            </div>
        </div>


        <!--END:: Main Body Editing -->
    </div>

    <jsp:include page="../global/footer.jsp"/>

</div>
<!-- end:: Page -->


<%@include file="../global/include-script.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('#assignTo1').select2(
            {placeholder: "Select User"}
        );

        $("#crp_name").change(
            function () {
                $.get("/enquiry/getLeads/" + $('#crp_name').val(), function (data, status) {
                    //console.log(data);
                    //console.log(data);
                    $("#contactNo").val(data.mobileNo);

                });
            });


        $.get("/master/getUsers", function (data,
                                            status) {

            $('#assignTo1').empty();
            //console.log(data);
            $("#assignTo1").append($('<option>', {
                value: '',
                text: '--Select User--'
            }));

            $.each(data, function (key, value) {
                $("#assignTo1").append($('<option>', {
                    value: value.id,
                    text: value.username
                }));
            });
        });


        $.get("/enquiry/getLeads", function (data,
                                             status) {
            console.log(data);


            $.each(data, function (key, value) {
                $("#crp_name").append($('<option>', {
                    value: value.id,
                    text: value.corporateName
                }));


            });


        });
        $("#m_datepicker_3").datepicker().datepicker("setDate", new Date());
        // $('#m_datepicker_3').val(new Date());
        $("#crp_name").select2(
            {placeholder: "Select Corporate"}
        );

        $("#select_case").select2(
            {placeholder: "Select case chennel"}
        );

        $("#select_type").select2(
            {placeholder: "Select case type"}
        );

        $("#select_priority").select2(
            {placeholder: "Select Priority"}
        );
        $("#select_classification").select2(
            {placeholder: "Select Case Classification"}
        );
        $("#select_status").select2(
            {placeholder: "Select Priority"}
        );
        $("#select_module").select2(
            {placeholder: "Select Module"}
        );
        $("#select_submodule").select2(
            {placeholder: "Select Sub Module"}
        );
    });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>