<!--begin::Global Theme Bundle -->
<script src="<%=request.getContextPath() %>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"
        type="text/javascript"></script>
<script src="" type="text/javascript"></script>
<!--end::Global Theme Bundle -->


<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-datepicker.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-timepicker.js"
        type="text/javascript"></script>

<!-- <script src="../../../assets/demo/demo12/custom/crud/forms/widgets/select2.js" type="text/javascript"></script> -->

<script type="text/javascript">
    $(document).ready(function () {

// 			/*	 $("#formId").submit(function(event) {
// 						alert("hello");
// 				      /* stop form from submitting normally */
// 				      event.preventDefault();

// 				      /* get the action attribute from the <form action=""> element */
// 				      /* var form1 = $( this ),
// 				          url = $form.attr( 'action' ); */
// 						//var data = $("#formId").serialize();
// 				      /* Send the data using post with element id name and name2*/
// 				     /*  var posting = $.post( url, { name: $('#name').val(), name2: $('#name2').val() } );
//  */
// 					 $.ajax({
// 					     type:"POST",
// 					     url: "/master/changePassword",
// 					     data:$("#formId").serialize(),//only input
// 					     cache: false,
// 	                        success: function (data) {
// 	                          //  swal("Success!", "Your Fees  has been Added.", "success");
// 	                            console.log(data);

// 	                        }
        /*  success: function(response){
             console.log(response);
         } */
        //			 });

// 				      /*// Alerts the results 
// 				      posting.done(function( data ) {
// 				        alert('success'); 
// 				      });*/
// 				    });  */


        $("#formId").formValidation({
            framework: 'bootstrap',
            excluded: ":disabled",
            icon: null,
            fields: {
                oldPassword: {
                    validators: {
                        notEmpty: {
                            message: 'This Field cannot be empty'
                        }
                    }
                },
                newPassword: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        identical: {
                            field: 'newPassword',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                },
            }
        }).on('success.form.fv', function (e) {

            $.ajax({
                type: "POST",
                url: "/master/changePassword",
                data: $("#formId").serialize(),//only input
                cache: false,
                success: function (data) {
                    //  swal("Success!", "Your Fees  has been Added.", "success");
                    console.log(data);

                    $('#m_modal_15').modal('hide');
                    if (data == 'true') {
                        $("#formId").trigger("reset");
                        swal("Success!", "Password Changed!", "success").then(function () {
                            window.location = "/";
                        });
                    } else {
                        $("#formId").trigger("reset");
                        swal("Oops!", "Incorrect Password!", "error");

                    }

                }
                /*  success: function(response){
                     console.log(response);
                 } */
            });
        });
        $("#submitButton").click(function () {
            $("#formId").data("formValidation").validate();
        });

        $("#closeButton").click(function () {
            $("#formId").trigger("reset");
        });


    });
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.all.min.js"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<%-- 	<script src="<%=request.getContextPath() %>/assets/demo/demo12/custom/components/base/sweetalert2.js" type="text/javascript"></script>
 --%>
		
		
		
		
		
		