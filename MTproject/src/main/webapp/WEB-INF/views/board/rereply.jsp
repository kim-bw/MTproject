<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rereply insert</title>
<script type="text/javascript">

var id = ${rvo.r_id};
var num = ${rvo.r_num};
var city = ${rvo.r_city};
var root = ${rvo.r_root};
var step = ${rvo.r_step};

</script>


</head>
<body>

<form action="insertReply" method="post">
<input type="text" id="content">
<input type="button" id="submit">
</form>


</body>
</html>