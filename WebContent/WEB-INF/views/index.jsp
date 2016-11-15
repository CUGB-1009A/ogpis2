<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>油气资源规划信息系统</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.png">
</head>
<body>
    <!-- Top content -->
<div class="top-content">	
    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>油气资源规划信息系统</strong></h1>
                    <div class="description">
                    	<p>
                     	管理油气资源规划
                    	</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                	<div class="form-top">
                		<div class="form-top-left">
                			<h3>登录</h3>
                    		<p>请输入用户名和密码</p>
                		</div>
                		<div class="form-top-right">
                			<i class="fa fa-key"></i>
                		</div>
                    </div>
                    <div class="form-bottom">
		               <form role="form" action="<%=path%>/login" method="post" class="login-form">
		               		<div class="form-group">
			               		<label class="sr-only" for="form-username">用户名</label>
			                   	<input type="text" name="username" placeholder="用户名..." class="form-control" id="form-username">
		                   </div>
		                   <div class="form-group">
			                   	<label class="sr-only" for="form-password">密码</label>
			                   	<input type="password" name="password" placeholder="密码..." class="form-control" id="form-password">
		                   </div>
		                   <button type="submit" class="btn">登录</button>
		               </form>
              		</div>
                </div>
            </div>
        </div>
    </div>    
</div>
<!--[if lt IE 10]>
    <script src="assets/js/placeholder.js"></script>
<![endif]-->
</body>
	<script type="text/javascript">
	$(function(){
		var isSuccess = '${isSuccess}';
		if(isSuccess=='0')
			alert("用户名或密码错误！");
	});
	</script>
</html>
