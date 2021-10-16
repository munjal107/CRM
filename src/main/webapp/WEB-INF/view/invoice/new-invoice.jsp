<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>Leads</title>
    <%@include file="../global/head.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
                        <h3 class="m-subheader__title m-subheader__title--separator">New</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                                <a href="/" class="m-nav__link m-nav__link--icon">
                                    <i class="m-nav__link-icon la la-home"></i>
                                </a>
                            </li>
                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item">
                                <a href="/invoice/view" class="m-nav__link">
                                    <span class="m-nav__link-text">invoice</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="m-content">


                <!--begin::Form-->
                <form class="m-form m-form--fit m-form--label-align-right" method="post" action="/invoice/addInvoice"
                      id=invoice>
                    <!--begin::Portlet-->
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
												<span class="m-portlet__head-icon m--hide">
													<i class="la la-gear"></i>
												</span>
                                    <h3 class="m-portlet__head-text">
                                        Invoice Details
                                    </h3>
                                </div>
                            </div>
                        </div>


                        <div class="m-portlet__body">
                            <table width="100%">
                                <tr>
                                    <td width="50%">

                                        <input type="hidden" id="hiddenid" name="lead.id" value="${cust.id}">
                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-4 col-form-label">Corporate
                                                Name</label>
                                            <div class="col-8">
                                                <select class="form-control m-input m-input--air m-select2"
                                                        id="CorporateName" name="CorporateName">
                                                    <option selected="selected">${cust.corporateName}</option>
                                                    <option disabled="disabled">---Select Corporate Name---</option>
                                                </select>


                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-4 col-form-label">Customer
                                                Name</label>
                                            <div class="col-8">
                                                <input class="form-control m-input" type="text" id="customerName"
                                                       placeholder="Customer name" name="customerName"
                                                       value="${cust.customerName}">
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-4 col-form-label">Mobile
                                                No.</label>
                                            <div class="col-8">
                                                <input class="form-control m-input" type="text" id="mobileNo"
                                                       placeholder="Enter Mobile No." value="${cust.mobileNo}"
                                                       name="mobileno">
                                            </div>
                                        </div>


                                    </td>


                                    <td width="50%">

                                        <div class="form-group m-form__group row">
                                            <label class="col-form-label col-lg-3 col-sm-12">Date</label>
                                            <div class="col-lg-9 col-md-9 col-sm-12">
                                                <div class="input-group date">
                                                    <input type="text" class="form-control m-input" readonly
                                                           placeholder="Select date" id="m_datepicker_2"
                                                           data-date-format="dd/mm/yyyy" name="dDate"/>
                                                    <div class="input-group-append">
																<span class="input-group-text">
																	<i class="la la-calendar-check-o"></i>
																</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Invoice
                                                No.</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="number" name="invoiceNo"
                                                       id="example-text-input" value="${invoiceNo}"
                                                       placeholder="Enter Invoice No.">
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">GST
                                                Type</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air m-select2"
                                                        name="GSTtype" id="GSTtype">
                                                    <option value="">select GST</option>
                                                    <option value="SGST">SGST</option>
                                                    <option value="iGST">iGST</option>

                                                </select>


                                            </div>
                                        </div>

                                    </td>

                                </tr>

                            </table>

                        </div>


                    </div>
                    <!--end::Portlet-->

                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
												<span class="m-portlet__head-icon m--hide">
													<i class="la la-gear"></i>
												</span>
                                    <h3 class="m-portlet__head-text">
                                        Package Details
                                    </h3>
                                </div>
                            </div>
                        </div>


                        <div class="m-portlet__body">


                            <table class="table table-striped- table-bordered table-hover table-checkable dataTable dtr-inline"
                                   id="m_repeater_1">
                                <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Duration</th>
                                    <th>Rate</th>
                                    <th>Tax</th>
                                    <th>Amount</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody data-repeater-list="">

                                <tr data-repeater-item>
                                    <td>


                                        <select class="form-control m-input m-input--air change"
                                                id="packageSelect{index}" style="width:100%;"
                                                name="invoicePackages[{index}].id">
                                            <option value="">Select Package</option>
                                        </select>


                                    </td>
                                    <td>

                                        <select class="form-control m-input m-input--air ds" name="packageName"
                                                disabled="disabled" onchange="duration_chg({index})"
                                                id="duration{index}" style="width:100%;">
                                            <option value="">Select Package</option>
                                            <option value="">select Duration</option>
                                            <option value="Trial">Trial (1 M)</option>
                                            <option value="Basic">Basic (3 M)</option>
                                            <option value="Intermediate">Intermediate (6 M)</option>
                                            <option value="Advance">Advance (12 M)</option>
                                        </select>

                                    </td>
                                    <td style="vertical-align: inherit; width: 11%;">


                                        <div class="m-form__control">
                                            <input type="text" class="form-control m-input" id="rate{index}"
                                                   onchange="cal({index})" placeholder="Enter Rate" name="packageAmount"
                                                   style="width:100%">
                                        </div>


                                    </td>
                                    <td style="vertical-align: inherit; width: 11%;">


                                        <div class="m-form__control">
                                            <input type="text" class="form-control m-input" readonly="readonly"
                                                   placeholder="Enter Tax" name="tax{index}" style="width:100%">
                                        </div>


                                    </td>
                                    <td style="vertical-align: inherit; width: 11%;">


                                        <div class="m-form__control">
                                            <input type="text" class="form-control m-input" id="amount{index}"
                                                   name="amount{index}" style="width:100%">
                                        </div>


                                    </td>
                                    <td style="vertical-align: inherit;  width: 11%;">
                                        <a data-repeater-delete="" style='color:white'
                                           class="btn-sm btn btn-danger m-btn m-btn--icon m-btn--pill">
																		<span>
																			<i class="la la-trash-o"></i>
																			<span>Delete</span>
																		</span>
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td>
                                        <div data-repeater-create="" class="btn btn-outline-primary">
																		<span>
																			<i class="la la-plus"></i>
																			<span>Add Package</span>
																		</span>
                                        </div>
                                    </td>
                                </tr>
                                </tfoot>
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
                                        Tax Details
                                    </h3>
                                </div>
                            </div>
                        </div>


                        <div class="m-portlet__body" style="text-align:right">

                            <label for="example-text-input" class="col-3 col-form-label">Total Payable Amount:</label>

                            <input type="text" class="col-2" name="totalAmount" id="totalAmount" value="0"
                                   readonly="readonly"/>

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
                                        Notes
                                    </h3>
                                </div>
                            </div>
                        </div>


                        <div class="m-portlet__body">
                            <div class="col-9 form-group m-form__group">
                                <textarea name="remarks" class="form-control m-input m-input--air"
                                          style="box-shadow:0px 0px 0px 0px rgba(113,106,202,0.11)"
                                          placeholder="Remarks" id="exampleTextarea1" rows="5"></textarea>
                            </div>
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
                                        Terms And Conditions
                                    </h3>
                                </div>
                            </div>
                        </div>


                        <div class="m-portlet__body">
                            <div class="col-9">
                                <button type="button" id="popup" class="btn btn-outline-info">Add Terms and conditions
                                </button>
                            </div>
                            <br>
                            <div class="col-lg-4 col-md-9 col-sm-12">
                                <textarea name="TnC" style="display: none;" id="showArea" class="form-control"
                                          id="m_autosize_1" rows="3" placeholder="Add here"></textarea>
                            </div>
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


            </div>
        </div>


        <!--END:: Main Body Editing -->
    </div>

    <jsp:include page="../global/footer.jsp"/>

</div>
<!-- end:: Page -->


<%@include file="../global/include-script.jsp" %>
<%-- <script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/form-repeater.js" type="text/javascript"></script> --%>

<script type="text/javascript">
    $(document).ready(function () {
        $("#m_datepicker_2").datepicker().datepicker("setDate", new Date());


        $("#popup").click(function () {

            // To show it
            $('#showArea').show();

        })

        $("#CorporateName").select2(
            {placeholder: "Select Corporate"}
        );

        $("#GSTtype").select2(
            {placeholder: "Select GST type"}
        );

        $("#Discount").select2(
            {placeholder: "%"}
        );

        $("#turnoverSelect").select2(
            {placeholder: "Select Turnover"}
        );


        $("#countrySelect").select2(
            {placeholder: "Select Country"}
        );

        $("#stateSelect").select2(
            {placeholder: "Select State"}
        );

        $("#citySelect").select2(
            {placeholder: "Select City"}
        );

        $.get("/enquiry/getCustomers", function (data, status) {


            $.each(data, function (key, value) {
                $("#CorporateName").append($('<option>', {
                    value: value.id,
                    text: value.corporateName
                }));
            });
        });

        $("#m_repeater_1").repeater({
            initEmpty: !1,
            defaultValues: {
                "text-input": "foo"
            },
            show: function () {

                $(this).find("select").each(function () {
                    $(this).select2(
                        {placeholder: "Select Pacakge"}
                    );

                });


                $(this).slideDown();
                getPackageList($(this).index());
                $("#packageSelect" + $(this).index()).on("change", function (e) {

                    var i = $(this).attr("id")
                    var num = i.substring(13);
                    $("#duration" + num).removeAttr("disabled");

                    var url = "/master/getPackage/" + $(this).val();

                    $.get(url, function (data, status) {
                        console.log(data);
                        $("#tax" + num).val(data.tax);
                    });

                });
            },
            hide: function (e) {
                $(this).slideUp(e)
            }
        })

        $("#m_repeater_1").find("[data-repeater-item]").each(function () {
            $(this).find("select").each(function () {
                $(this).select2(
                    {placeholder: "Select Pacakge"}
                );


            });

            getPackageList($(this).index());
            $("#packageSelect" + $(this).index()).on("change", function (e) {

                var i = $(this).attr("id")
                var num = i.substring(13);
                $("#duration" + num).removeAttr("disabled");

                var url = "/master/getPackage/" + $(this).val();

                $.get(url, function (data, status) {
                    console.log(data);
                    $("#tax" + num).val(data.tax);
                });

            });
        });


        $("#CorporateName").change(
            function () {
                $.get("/invoice/getCustomer/" + $('#CorporateName').val(), function (data, status) {

                    console.log(data);
                    $("#hiddenid").val(data.id);
                    $("#customerName").val(data.customerName);
                    $("#mobileNo").val(data.mobileNo);


                });
            });


        $("#m_repeater_1").on("click", 'a[data-repeater-delete]', function (e) {
            var a = $(this).closest("[data-repeater-item]").find("input[id*='amount']").val();
            var total = parseFloat($('#totalAmount').val());
            total = total - a;
            total = total.toFixed(2);
            $('#totalAmount').val(total);
        });

        $("#invoice").formValidation({
            framework: 'bootstrap',
            excluded: ":disabled",
            icon: null,
            fields: {
                CorporateName: {
                    validators: {
                        notEmpty: {
                            message: 'This Field cannot be empty'
                        }
                    }
                },

                customerName: {
                    validators: {
                        notEmpty: {
                            message: 'This Field cannot be empty'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z\s]+$/i,
                            message: 'Customer Name can consist of alphabetical characters and spaces only'
                        }
                    }
                },

                mobileno: {
                    validators: {
                        phone: {
                            country: "IN",
                            message: 'The value is not a valid phone number'
                        },
                        notEmpty: {
                            message: 'This Field cannot be empty'
                        }
                    }
                },

                dDate: {
                    validators: {
                        notEmpty: {
                            message: 'Select a Date'
                        }

                    }
                },

                invoiceNo: {
                    validators: {
                        notEmpty: {
                            message: 'This Field cannot be empty'
                        }
                    }
                },
                GSTtype: {
                    validators: {
                        notEmpty: {
                            message: 'Select a GST Type'
                        }
                    }
                }, remarks: {
                    validators: {
                        notEmpty: {
                            message: 'This field cannot be empty'
                        }
                    }
                }

            }
        });


    });

    /* <--end document ready --> */
    function getPackageList(id) {
        $.get("/master/getPackagelist", function (data,
                                                  status) {

            $('#packageSelect' + id).empty();
            //	console.log(data);
            $("#packageSelect" + id).append($('<option>', {
                value: '',
                text: '--Select Category--'
            }));

            $.each(data, function (key, value) {
                $("#packageSelect" + id).append($('<option>', {
                    value: value.id,
                    text: value.productName
                }));
            });
        });

    }

    function duration_chg(id) {

        /* alert($('#packageSelect'+id).val()); */
        var url = "/master/getPackage/" + $('#packageSelect' + id).val();
        var rate = 0;
        var amount = 0;
        var tax = $('#tax' + id).val();

        $.get(url, function (data, status) {
            /* alert($('#duration'+id).val()); */
            if (($('#duration' + id).val()) == 'Trial') {
                rate = data.trialRate;
                // alert(rate);
                amount = rate + (tax * rate / 100);
                //	 alert(amount);
                $("#amount" + id).val(amount);


                $("#rate" + id).val(data.trialRate);
            } else if (($('#duration' + id).val()) == 'Basic') {
                rate = data.basicRate;
                amount = rate + (tax * rate / 100);
                //	 alert(amount);
                $("#amount" + id).val(amount);
                $("#rate" + id).val(data.basicRate);
            } else if (($('#duration' + id).val()) == 'Intermediate') {
                rate = data.intermediateRate;
                amount = rate + (tax * rate / 100);
                //	 alert(amount);
                $("#amount" + id).val(amount);
                $("#rate" + id).val(data.intermediateRate);
            } else if (($('#duration' + id).val()) == 'Advance') {
                rate = data.advanceRate;
                amount = rate + (tax * rate / 100);
                //	 alert(amount);
                $("#amount" + id).val(amount);
                $("#rate" + id).val(data.advanceRate);
            } else {
            }
//         				var a=parseFloat($('#totalAmount').val());
//         				a=a+parseFloat($("#amount"+id).val());
//         				a=a.toFixed(2);
//         				$('#totalAmount').val(a);
            amount_total();

        });

    }

    function amount_total() {
        var n = $('#m_repeater_1 >tbody >tr').length;
        var sum = 0.0;
        for (var i = 0; i < n; i++) {
            sum = sum + parseFloat($('#amount' + i).val());
        }
        sum = sum.toFixed(2);
        $('#totalAmount').val(sum);
    }

    function cal(id) {
        var tax = parseFloat($('#tax' + id).val() * 0.01);
        var rate = parseFloat($('#rate' + id).val());
        var amt = rate + tax * rate;
        $('#amount' + id).val(amt);
        amount_total();
    }
</script>

<!--end::Global Theme Bundle -->
</body>
</html>