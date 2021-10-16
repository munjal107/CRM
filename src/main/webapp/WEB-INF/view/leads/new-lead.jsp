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
                            <li class="m-nav__item"><a href="/enquiry/view" class="m-nav__link">
                                <span class="m-nav__link-text">Enquiry</span>
                            </a></li>
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
                                <h3 class="m-portlet__head-text">Inquiry Details</h3>
                            </div>
                        </div>
                    </div>

                    <!--begin::Form-->
                    <form class="m-form m-form--fit m-form--label-align-left"
                          method="post" enctype="multipart/form-data" action="addLead" id="Lead">
                        <div class="m-portlet__body">
                            <table width="100%">
                                <tr>
                                    <td width="50%">


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Lead
                                                Source</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air m-select2"
                                                        id="leadSource" name="ls.id">
                                                    <option value="">select lead source</option>
                                                </select>


                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Corporate
                                                Name</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" name="corporateName"
                                                       placeholder="Corporate name">
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Business
                                                Category</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="businessSelect" name="bs.id">
                                                    <option value="">Select Business Category</option>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Customer
                                                Name</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Customer name"
                                                       name="customerName">
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Mobile
                                                No.</label>
                                            <div class="col-6">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Mobile No"
                                                       name="mobileNo">
                                            </div>

                                            <div class="">
                                                <button type="button"
                                                        class="btn btn-accent m-btn m-btn--custom m-btn--bolder m-btn--uppercase">
                                                    Send
                                                    OTP
                                                </button>
                                            </div>


                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-email-input"
                                                   class="col-3 col-form-label">Email address</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       placeholder="Enter email" id="example-email-input"
                                                       name="email">
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">No
                                                Of Employees</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="employeeSelect" name="noOfEmployees">
                                                    <option value="">Select Employees</option>
                                                    <option>Self</option>
                                                    <option>1-10</option>
                                                    <option>11-50</option>
                                                    <option>51-200</option>
                                                    <option>201-500</option>
                                                    <option>501-1000</option>
                                                    <option>1001-5000</option>
                                                    <option>5001-10,000</option>
                                                    <option>10,001+</option>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-email-input"
                                                   class="col-3 col-form-label">Turnover</label>
                                            <div class="col-9">
                                                <div class="input-group">
                                                    <input type="text" class="form-control m-input"
                                                           placeholder="turnover" aria-describedby="basic-addon2"
                                                           name="turnover">

                                                </div>

                                            </div>
                                        </div>


                                    </td>


                                    <td width="50%" style="vertical-align: text-top;">

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Interested
                                                Package</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="packageSelect" name="packages">
                                                    <option value="" disabled selected>Free Trial</option>
                                                    <option value="Demo">Demo</option>
                                                    <option value="Subscription">Subscription</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label class="col-3" for="exampleTextarea">Remark</label>
                                            <div class="col-9">
													<textarea class="form-control m-input m-input--air"
                                                              placeholder="Remarks" id="exampleTextarea" rows="3"
                                                              name="remarks"
                                                              style="box-shadow: 0px 0px 0px 0px rgba(113,106,202,0.11);"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Address
                                                Name</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Address"
                                                       name="address">
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Select
                                                Country</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="countrySelect" name="country.countryId">

                                                </select>
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label class="col-form-label col-lg-3 col-sm-12">Select
                                                State</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="stateSelect" name="state.stateId">

                                                </select>

                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Select
                                                City</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="citySelect" name="city.cityId">
                                                    <option value="">select city</option>

                                                </select>
                                            </div>
                                        </div>

                                    </td>

                                </tr>

                            </table>
                            <br> <br>
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
    /* 	function getAllCountryAjax(countries){

            $.get('/location/country',
                function(data, status){
                    $('#'+countries).empty();
                    //console.log(data);
                    $("#"+countries).append($('<option>',{value :'', text :"Select Country"}));
                    $.each( data, function( key, value) {
                          $("#"+countries).append($('<option>',{value : value.countriesCode, text :value.countriesName,}));

                      });

                      if($('#'+countries).data("default") != undefined)
                          $('#'+countries).val($('#'+countries).data("default")).trigger('change') ;
            });
        }
     */
    $(document)
        .ready(
            function () {

                /* getAllCountryAjax(); */

                $.get("/location/countries/", function (data, status) {
                    $('#countrySelect').empty();

                    $("#countrySelect").append($('<option>', {
                        value: '',
                        text: '--Select--'
                    }));

                    $.each(data, function (key, value) {

                        if (value.countryId == 101) {
                            $("#countrySelect").append($('<option>', {
                                value: value.countryId,
                                text: value.countryName,
                                selected: 'selected'
                            }));

                            $.get("/location/states/" + $('#countrySelect').val(), function (data, status) {
                                $('#stateSelect').empty();
                                //console.log(data);

                                $("#stateSelect").append(
                                    $('<option>',
                                        {
                                            value: '',
                                            text: '--Select State--'
                                        }));

                                $.each(data, function (key, value) {

                                    if (value.stateId == 12) {
                                        $("#stateSelect").append(
                                            $('<option>', {
                                                value: value.stateId,
                                                text: value.stateName,
                                                selected: 'selected'
                                            }));

                                        $.get("/location/cities/"
                                            + $('#stateSelect').val(), function (
                                            data, status) {
                                            $('#citySelect').empty();
                                            //console.log(data);
                                            $("#stateSelect").append($('<option>', {
                                                value: '',
                                                text: '--Select City--'
                                            }));

                                            $.each(data, function (key, value) {

                                                if (value.cityId == 783) {

                                                    $("#citySelect").append($('<option>', {
                                                        value: value.cityId,
                                                        text: value.cityName,
                                                        selected: 'selected'
                                                    }));

                                                } else {
                                                    $("#citySelect").append($('<option>', {
                                                        value: value.cityId,
                                                        text: value.cityName
                                                    }));

                                                }


                                            });
                                        });


                                    } else {
                                        $("#stateSelect").append(
                                            $('<option>', {
                                                value: value.stateId,
                                                text: value.stateName
                                            }));

                                    }

                                });
                            });

                        } else {
                            $("#countrySelect").append($('<option>', {
                                value: value.countryId,
                                text: value.countryName
                            }));

                        }


                    });
                });
                $("#countrySelect").change(
                    function () {
                        $.get("/location/states/"
                            + $('#countrySelect').val(), function (
                            data, status) {
                            $('#stateSelect').empty();
                            //console.log(data);
                            /* 	$("#stateSelect").append(
                                           $('<option>',
                                                   {
                                                       value : '',
                                                       text : '--Select State--'
                                                   }));  */

                            $.each(data, function (key, value) {
                                $("#stateSelect").append(
                                    $('<option>', {
                                        value: value.stateId,
                                        text: value.stateName
                                    }));
                            });
                        });
                    });

                $("#stateSelect").change(
                    function () {
                        $.get("/location/cities/"
                            + $('#stateSelect').val(), function (
                            data, status) {
                            $('#citySelect').empty();
                            //console.log(data);
                            $("#stateSelect").append($('<option>', {
                                value: '',
                                text: '--Select City--'
                            }));

                            $.each(data, function (key, value) {
                                $("#citySelect").append($('<option>', {
                                    value: value.cityId,
                                    text: value.cityName
                                }));
                            });
                        });
                    });

                $.get("/master/getLeadSource", function (data,
                                                         status) {

                    $('#leadSource').empty();
                    //console.log(data);
                    $("#leadSource").append($('<option>', {
                        value: '',
                        text: '--Select Lead--'
                    }));

                    $.each(data, function (key, value) {
                        $("#leadSource").append($('<option>', {
                            value: value.id,
                            text: value.sourceName
                        }));
                    });
                });

                $.get("/master/getBusinessCategory", function (data,
                                                               status) {

                    $('#businessSelect').empty();
                    //console.log(data);
                    $("#businessSelect").append($('<option>', {
                        value: '',
                        text: '--Select Category--'
                    }));

                    $.each(data, function (key, value) {
                        $("#businessSelect").append($('<option>', {
                            value: value.id,
                            text: value.name
                        }));
                    });
                });

                $("#leadSource").select2({});

                $("#businessSelect").select2({});

                $("#employeeSelect").select2({});

                $("#turnoverSelect").select2({
                    placeholder: "Select Turnover"
                });

                $("#packageSelect").select2({
                    placeholder: "Select Pacakge"
                });

                $("#countrySelect").select2({
                    placeholder: "Select Country"
                });

                $("#stateSelect").select2({
                    placeholder: "Select State"
                });

                $("#citySelect").select2({
                    placeholder: "Select City"
                });

                $("#Lead").formValidation({
                    framework: 'bootstrap',
                    excluded: ":disabled",
                    icon: null,
                    fields: {
                        "ls.id": {
                            validators: {
                                notEmpty: {
                                    message: 'Select Lead Source'
                                }
                            }
                        },

                        corporateName: {
                            validators: {
                                notEmpty: {
                                    message: 'This Field cannot be empty'
                                },
                                regexp: {
                                    regexp: /^[0-9a-zA-z\s\.]+$/i,
                                    message: 'Corporate Name can consist of alphabetical characters and spaces only'
                                }
                            }
                        },

                        "bs.id": {
                            validators: {
                                notEmpty: {
                                    message: 'This Field cannot be empty'
                                }
                            }
                        },

                        customerName: {
                            validators: {
                                notEmpty: {
                                    message: 'Customer Name cannot be empty'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z\s]+$/i,
                                    message: 'Customer Name can consist of alphabetical characters and spaces only'
                                }
                            }
                        },

                        mobileNo: {
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

                        email: {
                            validators: {
                                emailAddress: {
                                    message: 'The value is not a valid email address'
                                },
                                notEmpty: {
                                    message: 'This Field cannot be empty'
                                }
                            }
                        },

                        noOfEmployees: {
                            validators: {
                                notEmpty: {
                                    message: 'This Field cannot be empty'
                                }
                            }
                        },

                        turnover: {
                            validators: {
                                notEmpty: {
                                    message: 'This Field cannot be empty'
                                },
                                numeric: {
                                    message: 'The value is not a number',
                                    // The default separators
                                    thousandsSeparator: '',
                                    decimalSeparator: '.'
                                }
                            }
                        },

                        packages: {
                            validators: {
                                notEmpty: {
                                    message: 'Select Interested Pacakage'
                                }
                            }
                        },

                        remarks: {
                            validators: {
                                notEmpty: {
                                    message: 'This field cannot be empty'
                                },
                                stringLength: {
                                    max: 40,
                                    message: 'Remarks must be less than 40 characters'
                                }
                            }
                        },

                        address: {
                            validators: {
                                notEmpty: {
                                    message: 'This Field cannot be empty'
                                },
                                stringLength: {
                                    max: 100,
                                    message: 'Address must be less than 100 characters'
                                }
                            }
                        },
                    }
                })

            });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>