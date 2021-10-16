<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <!-- <meta charset="utf-8" /> -->
    <title>Vasy CRM | Login Page</title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

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
    <link href="<%=request.getContextPath() %>/assets/vendors/base/vendors.bundle.css" rel="stylesheet"
          type="text/css"/>

    <!--RTL version:<link href="<%=request.getContextPath() %>/assets/vendors/base/vendors.bundle.rtl.css" rel="stylesheet" type="text/css" />-->
    <link href="<%=request.getContextPath() %>/assets/demo/demo12/base/style.bundle.css" rel="stylesheet"
          type="text/css"/>

    <!--RTL version:<link href="<%=request.getContextPath() %>/assets/demo/demo12/base/style.bundle.rtl.css" rel="stylesheet" type="text/css" />-->

    <!--end::Global Theme Styles -->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/demo/demo12/media/img/logo/favicon.ico"/>
</head>
<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">

<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">
    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--hor m-login m-login--signin m-login--2 m-login-2--skin-3"
         id="m_login" style="background-image: url(<%=request.getContextPath() %>/assets/app/media/img/bg/bg-2.jpg);">
        <div class="m-grid__item m-grid__item--fluid	m-login__wrapper">
            <div class="m-login__container">
                <div class="m-login__logo">
                    <a href="#">
                        <img src="<%=request.getContextPath() %>./assets/app/media/img/logos/logo.png">
                    </a>
                </div>
                <div class="m-login__signin">
                    <div class="m-login__head">
                        <h3 class="m-login__title">Sign In To Vasy CRM</h3>
                    </div>
                    <form class="m-login__form m-form" action="/login" id="loginForm" method="post">
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" required="required" placeholder="Username"
                                   name="email" autocomplete="off">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input m-login__form-input--last" type="password"
                                   placeholder="Password" name="password">
                        </div>
                        <div class="row m-login__form-sub">
                            <!-- <div class="col m--align-left m-login__form-left">
                                <label class="m-checkbox  m-checkbox--light">
                                    <input type="checkbox" name="remember"> Remember me
                                    <span></span>
                                </label>
                            </div> -->
                            <div class="col m--align-right m-login__form-right">
                                <a href="javascript:;" id="m_login_forget_password" class="m-link">Forget Password ?</a>
                            </div>
                        </div>
                        <div class="m-login__form-action">
                            <button id="m_login_signin_submit"
                                    class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air  m-login__btn">Sign
                                In
                            </button>
                        </div>
                    </form>
                </div>
                <div class="m-login__signup">
                    <div class="m-login__head">
                        <h3 class="m-login__title">Sign Up</h3>
                        <div class="m-login__desc">Enter your details to create your account:</div>
                    </div>
                    <form class="m-login__form m-form" action="">
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" placeholder="Fullname" name="fullname">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" placeholder="Email" name="email"
                                   autocomplete="off">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="password" placeholder="Password" name="password">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input m-login__form-input--last" type="password"
                                   placeholder="Confirm Password" name="rpassword">
                        </div>
                        <div class="row form-group m-form__group m-login__form-sub">
                            <div class="col m--align-left">
                                <label class="m-checkbox m-checkbox--light">
                                    <input type="checkbox" name="agree">I Agree the <a href="#"
                                                                                       class="m-link m-link--focus">terms
                                    and conditions</a>.
                                    <span></span>
                                </label>
                                <span class="m-form__help"></span>
                            </div>
                        </div>
                        <div class="m-login__form-action">
                            <button id="m_login_signup_submit"
                                    class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air  m-login__btn">Sign
                                Up
                            </button>&nbsp;&nbsp;
                            <button id="m_login_signup_cancel"
                                    class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom m-login__btn">Cancel
                            </button>
                        </div>
                    </form>
                </div>
                <div class="m-login__forget-password">
                    <div class="m-login__head">
                        <h3 class="m-login__title">Forgotten Password ?</h3>
                        <div class="m-login__desc">Enter your email to reset your password:</div>
                    </div>
                    <form class="m-login__form m-form" id="forgetPassword" action="/master/sendPassword" method="post">
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" placeholder="Email" name="email"
                                   id="m_email" autocomplete="off">
                        </div>
                        <div class="m-login__form-action">
                            <button id="m_login_forget_password_submit"
                                    class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">
                                Request
                            </button>&nbsp;&nbsp;
                            <button id="m_login_forget_password_cancel"
                                    class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom  m-login__btn">Cancel
                            </button>
                        </div>
                    </form>
                </div>
                <!-- <div class="m-login__account">
                    <span class="m-login__account-msg">
                        Don't have an account yet ?
                    </span>&nbsp;&nbsp;
                    <a href="javascript:;" id="m_login_signup" class="m-link m-link--light m-login__account-link">Sign Up</a>
                </div> -->
            </div>
        </div>
    </div>
</div>

<!-- end:: Page -->

<!--begin::Global Theme Bundle -->
<%@include file="../global/include-script.jsp" %>

<!--end::Global Theme Bundle -->

<!--begin::Page Scripts -->
<!-- 	<script src="../../../assets/snippets/custom/pages/user/login.js" type="text/javascript"></script> -->

<!--end::Page Scripts -->
<script type="text/javascript">

    jQuery(document).ready(function () {
        SnippetLogin.init()

        /*$("#loginForm").formValidation({
            framework: 'bootstrap',
            excluded: ":disabled",
            icon : null,
            fields: {
                "ls.id": {
                    validators: {
                        notEmpty:{
                            message: 'Email Required'
                        }
                    }
                }


            }


        });*/
    });

    var SnippetLogin = function () {
        var e = $("#m_login"),
            i = function (e, i, a) {
                var l = $('<div class="m-alert m-alert--outline alert alert-' + i + ' alert-dismissible" role="alert">\t\t\t<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>\t\t\t<span></span>\t\t</div>');
                e.find(".alert").remove(), l.prependTo(e), mUtil.animateClass(l[0], "fadeIn animated"), l.find("span").html(a)
            },
            a = function () {
                e.removeClass("m-login--forget-password"), e.removeClass("m-login--signup"), e.addClass("m-login--signin"), mUtil.animateClass(e.find(".m-login__signin")[0], "flipInX animated")
            },
            l = function () {
                $("#m_login_forget_password").click(function (i) {
                    i.preventDefault(), e.removeClass("m-login--signin"), e.removeClass("m-login--signup"), e.addClass("m-login--forget-password"), mUtil.animateClass(e.find(".m-login__forget-password")[0], "flipInX animated")
                }), $("#m_login_forget_password_cancel").click(function (e) {
                    e.preventDefault(), a()
                }), /*$("#m_login_signup").click(function(i) {
		                i.preventDefault(), e.removeClass("m-login--forget-password"), e.removeClass("m-login--signin"), e.addClass("m-login--signup"), mUtil.animateClass(e.find(".m-login__signup")[0], "flipInX animated")
		            }),*/ $("#m_login_signup_cancel").click(function (e) {
                    e.preventDefault(), a()
                })
            };
        return {
            init: function () {
                l(), $("#m_login_forget_password_submit").click(function (l) {
                    l.preventDefault();
                    var t = $("#forgetPassword"),
                        r = $("#forgetPassword").closest("form");
                    $.ajax({
                        type: "POST",
                        url: "/master/sendPassword",
                        data: $("#forgetPassword").serialize(),
                        cache: false,
                        success: function (data) {

                            console.log(data);

                            if (data == 'true') {
                                setTimeout(function () {
                                    t.removeClass("m-loader m-loader--right m-loader--light").attr("disabled", !1), r.clearForm(), r.validate().resetForm(), a();
                                    var l = e.find(".m-login__signin form");
                                    l.clearForm(), l.validate().resetForm(), i(l, "success", "Cool! Password recovery instruction has been sent to your email.")
                                }, 100)
                                //swal("Success!", "Password Changed!", "success");

                            } else {

                                swal("Oops!", "Incorrect Email!", "error");
                                $("#forgetPassword").trigger("reset");
                            }

                        }

                    })

                })
            }
        }
    }();

</script>


</body>

<!-- end::Body -->
</html>