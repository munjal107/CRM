<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <title>Support</title>
    <%@include file="../global/head.jsp" %>

    <style type="text/css">
        .m-timeline-3__item::before {
            left: 6.1rem !important;

        }

        ;
        .m-timeline-3__item .m-timeline-3__item-time {
            width: auto !important;
        }
    </style>
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
                            <li class="m-nav__item"><a href="/support/new" class="m-nav__link">
                                <span class="m-nav__link-text">Support</span>
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
                                <h3 class="m-portlet__head-text">Support</h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <ul class="m-portlet__nav">
                                <li class="m-portlet__nav-item"><a href="/support/new"
                                                                   class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--icon m-btn--air">
											<span> <i class="fa fa-edit"></i> <span>Add Support</span>
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
                                    id="m_table_1" style="width: 100%;overflow: auto;">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Issue Date</th>
                                    <th>Customer Name</th>
                                    <th>Case Type</th>
                                    <th>Case Module</th>
                                    <th>Case Status</th>
                                    <th>Case Priority</th>
                                    <th>Case Classification</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                            </table>

                        </div>

                    </div>


                    <div class="modal fade" id="m_modal_5" role="dialog" aria-labelledby="" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id=""><b>ADD TASK</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true" class="la la-remove"></span>
                                    </button>
                                </div>

                                <!--begin::Form-->
                                <form class="m-form m-form--fit m-form--label-align-right" action="/task/addTask"
                                      method="post">
                                    <input type="hidden" id="SupportId" name="support.id">
                                    <div class="col-12" style="padding-top:15px;">
                                        <div class="col-6"
                                             style="float:left;border-right:0.7px solid RGB(16,7,42,0.2);">
                                            <div class="form-group m-form__group"
                                                 style="padding:0px;margin:0px;margin-bottom:15px;">
                                                <label class="">Title</label>
                                                <input type="text" class="form-control m-input" name="title"
                                                       placeholder="Enter Title">
                                            </div>
                                            <div class="form-group m-form__group"
                                                 style="padding:0px;margin:0px;margin-bottom:15px;">
                                                <label class="">Task Description</label>
                                                <textarea rows="4" name="taskDescription"
                                                          class="form-control m-input"></textarea>
                                            </div>
                                            <div class="form-group m-form__group"
                                                 style="padding:0px;margin:0px;margin-bottom:15px;">
                                                <label class="">Task Status</label>
                                                <select class="form-control m-select2" id="taskStatus" name="taskStatus"
                                                        style="width:100%">
                                                    <option>Open</option>
                                                    <option>In Progress</option>
                                                    <option>Escalated</option>
                                                    <option>Resolve</option>
                                                    <option>Not Possible</option>
                                                </select>
                                            </div>
                                            <div class="form-group m-form__group"
                                                 style="padding:0px;margin:0px;margin-bottom:15px;">
                                                <label class="">Task Priority</label>
                                                <select class="form-control m-select2" id="taskPriority"
                                                        name="taskPriority" style="width:100%">
                                                    <option value="" disabled selected>Task Priority</option>
                                                    <option value="Low">Low</option>
                                                    <option value="Medium">Medium</option>
                                                    <option value="High">High</option>
                                                    <option value="Critical">Critical</option>
                                                </select>
                                            </div>
                                            <div class="form-group m-form__group"
                                                 style="padding:0px;margin:0px;margin-bottom:15px;">
                                                <label class="">Assigned To</label>
                                                <select class="form-control m-select2" id="assignedTo" name="userObj.id"
                                                        style="width:100%">
                                                    <%--<option value="" disabled selected>Medium</option>--%>
                                                </select>
                                            </div>
                                            <div class="form-group m-form__group"
                                                 style="padding:0px;margin:0px;margin-bottom:15px;">
                                                <label>Due Date:</label>
                                                <div class="input-group date">   <!-- data-date-format="dd/mm/yyyy" -->
                                                    <input type="text" class="form-control m-input" name="dueDate"
                                                           data-date-format="dd/mm/yyyy" readonly
                                                           placeholder="Select date" id="m_datepicker_2"/>
                                                    <div class="input-group-append">
																<span class="input-group-text">
																	<i class="la la-calendar-check-o"></i>
																</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6" style="display:inline-block;">

                                            <div style="float:left">
                                                <label><b>Customer Name &nbsp;&nbsp;</b></label><br>
                                                <label><b>Corporate Name&nbsp;&nbsp;</b></label><br>
                                                <label><b>Case Status &nbsp;&nbsp;</b></label><br>
                                                <label><b>Case Priority &nbsp;&nbsp;</b></label><br>
                                                <label><b>Case Channel &nbsp;&nbsp;</b></label><br>
                                                <label><b>Case Classification &nbsp;&nbsp;</b></label><br>
                                            </div>
                                            <div style="width:50%;display:inline-block;">
                                                <p id="custN" style="margin-bottom:.5rem"></p>
                                                <p id="corpN" style="margin-bottom:.5rem"></p>
                                                <p id="caseS" style="margin-bottom:.5rem"></p>
                                                <p id="caseP" style="margin-bottom:.5rem"></p>
                                                <p id="caseC" style="margin-bottom:.5rem"></p>
                                                <p id="caseCl" style="margin-bottom:.5rem"></p>
                                            </div>

                                        </div>
                                        <div class="col-12" style="display:inline-block;">
                                            <hr>
                                            <div class="m-portlet__foot m-portlet__no-border m-portlet__foot--fit">
                                                <div class="m-form__actions" style="padding:0px;margin-bottom:30px;">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <button style="float:right;margin-left:5px" type="button"
                                                                    class="btn btn-danger" data-dismiss="modal">Cancel
                                                            </button>
                                                            <button style="float:right;margin-left:5px" type="submit"
                                                                    class="btn btn-primary">Save
                                                            </button>&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>


                                <!--end::Form-->

                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="m_modal_6" role="dialog" aria-labelledby="" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">

                            <div class="modal-content" style="background-color: #8eb2ff">
                                <div class="modal-header">
                                    <h5 class="modal-title" id=""><b>TASK TIMELINE</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true" class="la la-remove"></span>
                                    </button>
                                </div>
                                <div class="m-portlet m-portlet--full-height " style="margin-bottom:5px">
                                    <div class="m-portlet__body">
                                        <div class="m-scrollable" data-scrollable="false" data-height="380"
                                             data-mobile-height="300" align="left">


                                            <div id="ab">

                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>
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
<script src="<%=request.getContextPath() %>/assets/demo/demo12/custom/crud/forms/widgets/select2.js"
        type="text/javascript"></script>

<!--end::Page Vendors -->

<script type="text/javascript">

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
                                url: "/support/getSupport",
                                dataSrc: function (d) {
                                    return d
                                }
                            },


                            columns: [{
                                data: "id"
                            }, {
                                data: "issueDate"
                            }, {
                                data: "lead.customerName"
                            }, {
                                data: "caseType"
                            }, {
                                data: "caseModule"
                            }, {
                                data: "caseStatus"
                            }, {
                                data: "casePriority"
                            }, {
                                data: "caseClassification"
                            }, {
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

                                            return '<button type="button"  data-placement="bottom" title="Add Task" class="btn m-btn--pill  btn-outline-brand btn-sm" data-toggle="modal" data-target="#m_modal_5" onclick="setModalId(' + e.id + ')">+</button>&nbsp <button data-placement="bottom" title="View Task" type="button" style="margin-left:5px;" class="btn m-btn--pill btn-outline-brand btn-sm" data-toggle="modal" data-target="#m_modal_6" onclick="showModal(' + e.id + ')"><i class="la la-tasks"></i></button>'
                                        }
                                    },
                                    {
                                        targets: 1,
                                        title: "Issue Date",
                                        orderable: !1,
                                        render: function (a, t, e,
                                                          n) {
                                            return '<p>' + moment(a).format('DD-MM-YYYY');
                                            +'</p>'
                                        }
                                    },
                                    {
                                        targets: 6,
                                        title: "Case Priority",
                                        orderable: !1,
                                        render: function (a, t, e, n) {

                                            if (a == 'Critical')
                                                return '<div class="m-section__content"> <span class="btn m-btn--pill    btn-outline-danger m-btn m-btn--custom" style="padding:2px 9px 2px 9px;">' + a + '</span></div> '
                                            if (a == 'High')
                                                return '<div class="m-section__content"> <span class="btn m-btn--pill    btn-outline-warning m-btn m-btn--custom" style="padding:2px 9px 2px 9px;">' + a + '</span></div> '
                                            else if (a == 'Medium')
                                                return '<div class="m-section__content"> <span class="btn m-btn--pill    btn-outline-primary m-btn m-btn--custom" style="padding:2px 9px 2px 9px;">' + a + '</span></div> '
                                            else if (a == 'Low')
                                                return '<div class="m-section__content"> <span class="btn m-btn--pill    btn-outline-info m-btn m-btn--custom" style="padding:2px 9px 2px 9px;">' + a + '</span></div> '
                                        }
                                    }, {
                                    targets: 5,
                                    title: "Case Status",
                                    orderable: !1,
                                    render: function (a, t, e,
                                                      n) {
                                        if (a == 'Resolve')
                                            return '<div class="m-section__content"> <span class="m-badge m-badge--success" style="padding:2px 9px 2px 9px;">' + a + '</span></div> ';

                                        else if (a == 'Escalated')
                                            return '<div class="m-section__content"> <span class="m-badge m-badge--warning" style="padding:2px 9px 2px 9px;">' + a + '</span></div> ';

                                        else if (a == 'Open')
                                            return '<div class="m-section__content"> <span class="m-badge m-badge--info" style="padding:2px 9px 2px 9px;">' + a + '</span></div> ';

                                        else if (a == 'In Progress')
                                            return '<div class="m-section__content"> <span class="m-badge m-badge--primary" style="padding:2px 9px 2px 9px;">' + a + '</span></div> ';

                                        else if (a == 'Not Possible')
                                            return '<div class="m-section__content"> <span class="m-badge m-badge--danger" style="padding:2px 9px 2px 9px;">' + a + '</span></div> ';
                                    }
                                }
                                ]

                        });


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

                $.get("/master/getUsers", function (data,
                                                    status) {

                    $('#assignedTo').empty();
                    //console.log(data);
                    $("#assignedTo").append($('<option>', {
                        value: '',
                        text: 'Select User'
                    }));

                    $.each(data, function (key, value) {
                        $("#assignedTo").append($('<option>', {
                            value: value.id,
                            text: value.username
                        }));
                    });
                });

                $('#m_select2_1_modal').select2();

                $('#act_outcome').select2();

                $('#act_user').select2();

                $('#taskStatus').select2();
                $('#taskPriority').select2();
                $('#assignedTo').select2();
            });

    function setModalId(id) {
        //alert(id);
        $('#SupportId').val(id);
        $("#m_datepicker_2").datepicker().datepicker("setDate", new Date());
        $.get("/support/getSupportById/" + id, function (data, status) {
            //console.log(data);
            $('#custN').text(': ' + data.lead.customerName);
            $('#corpN').text(': ' + data.lead.corporateName);
            $('#caseS').text(': ' + data.caseStatus);
            $('#caseP').text(': ' + data.casePriority);
            $('#caseC').text(': ' + data.caseChannel);
            $('#caseCl').text(': ' + data.caseClassification);
        });
    }

    function showModal(id) {
        //alert("he" + id);

        $.get("/task/getTaskBySupportId/" + id, function (data, status) {

            console.log(data);

            $('#ab').empty();
            var s = "";
            s = '<div class="m-timeline-3"><div class="m-timeline-3__items">';

            $.each(data, function (i, item) {


                s = s + '<div class="m-timeline-3__item m-timeline-3__item--brand">  <span class="m-timeline-3__item-time" style="width: auto" >' + moment(item.dueDate).format('DD-MM-YY') + '</span>  <div class="m-timeline-3__item-desc">	<span class="m-timeline-3__item-text"> ' + item.title + ' </span><br> <span class="m-timeline-3__item-user-name"> <a href="#" class="m-link m-link--metal m-timeline-3__item-link">assigned To ' + item.userObj.username + '   |   Priority: ' + item.taskPriority + ' </a>	</span> </div> </div> ';

            });
            s = s + "</div></div>"

            $('#ab').append(s)

        });


    }
</script>
<!--end::Global Theme Bundle -->
</body>
</html>