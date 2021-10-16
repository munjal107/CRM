<meta charset="UTF-8"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--begin::Web font -->
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>

<script>
    WebFont.load({
        google: {"families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]},
        active: function () {
            sessionStorage.fonts = true;
        }
    });
</script>

<!--end::Web font -->

<!--begin::Global Theme Styles -->
<link href="<%=request.getContextPath() %>/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css"/>

<!--RTL version:<link href="assets/vendors/base/vendors.bundle.rtl.css" rel="stylesheet" type="text/css" />-->
<link href="<%=request.getContextPath() %>/assets/demo/demo12/base/style.bundle.css" rel="stylesheet" type="text/css"/>

<link href="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.css" rel="stylesheet"
      type="text/css"/>

<!--RTL version:<link href="assets/demo/demo12/base/style.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

<!--end::Global Theme Styles -->
<link rel="<%=request.getContextPath() %>/shortcut icon"
      href="<%=request.getContextPath() %>/assets/demo/demo12/media/img/logo/favicon.ico"/>


<link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.min.css" rel="stylesheet"
      type="text/css"/>
		
		
		
		
		
		
		
		