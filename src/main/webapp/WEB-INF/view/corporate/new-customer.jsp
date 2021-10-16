<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>New Customer</title>
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
                            <li class="m-nav__item m-nav__item--home"><a href="#"
                                                                         class="m-nav__link m-nav__link--icon"> <i
                                    class="m-nav__link-icon la la-home"></i>
                            </a></li>
                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item"><a href="" class="m-nav__link">
                                <span class="m-nav__link-text">customer</span>
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
                                <h3 class="m-portlet__head-text">New Customer</h3>
                            </div>
                        </div>
                    </div>

                    <!--begin::Form-->
                    <form class="m-form m-form--fit m-form--label-align-left">
                        <div class="m-portlet__body">
                            <table width="100%">
                                <tr>
                                    <td width="50%">

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Customer
                                                Name</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Customer name">
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Address
                                            </label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input"
                                                       placeholder="Company Name / Shop Number / Avenue name / Landmark">
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Select
                                                Country</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="countrySelect">

                                                </select>
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label class="col-form-label col-lg-3 col-sm-12">Select
                                                State</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="stateSelect">

                                                </select>

                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Select
                                                City</label>
                                            <div class="col-9">
                                                <select class="form-control m-input m-input--air"
                                                        id="citySelect">
                                                    <option value="">select city</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">PIN
                                                Code</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="PIN Code">
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Contact Person
                                                Name</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Contact Person Name">
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Contact Person
                                                Address</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Contact Person Address">
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Contact Person
                                                Number</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Contact Person Number">
                                            </div>
                                        </div>


                                    </td>


                                    <td width="50%" style="vertical-align: text-top;">
                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">GST
                                                Number</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="GST Number">
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Bank
                                                Name</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Bank Name">
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">Bank Acc.
                                                Name</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="Bank Account Name">
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">ISFC</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="ISFC Number">
                                            </div>
                                        </div>


                                        <div class="form-group m-form__group row">
                                            <label for="example-text-input" class="col-3 col-form-label">PAN
                                                Number</label>
                                            <div class="col-9">
                                                <input class="form-control m-input" type="text"
                                                       id="example-text-input" placeholder="PAN Number">
                                            </div>
                                        </div>

                                    </td>

                                </tr>

                            </table>
                            <br>
                            <br>
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
                    console.log(data);
                    $("#"+countries).append($('<option>',{value :'', text :"Select Country"}));
                    $.each( data, function( key, value) {
                          $("#"+countries).append($('<option>',{value : value.countriesCode, text :value.countriesName,}));

                      });

                      if($('#'+countries).data("default") != undefined)
                          $('#'+countries).val($('#'+countries).data("default")).trigger('change') ;
            });
        }
     */
    $(document).ready(function () {


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
                    }, '</option>'));
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
                    console.log(data);
                    /* 	$("#stateSelect").append(
                                $('<option>',
                                        {
                                            value : '',
                                            text : '--Select City--'
                                        })); */

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
                    console.log(data);
                    /* 	$("#stateSelect").append(
                                $('<option>',
                                        {
                                            value : '',
                                            text : '--Select City--'
                                        })); */

                    $.each(data, function (key, value) {
                        $("#citySelect").append(
                            $('<option>', {
                                value: value.cityId,
                                text: value.cityName
                            }));
                    });
                });
            });

        $("#leadSource").select2({
            placeholder: "Select Lead"
        });

        $("#businessSelect").select2({
            placeholder: "Select Business Category"
        });

        $("#employeeSelect").select2({
            placeholder: "Select No of Employees"
        });

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


    });
</script>
<!--end::Global Theme Bundle -->
</body>
</html>