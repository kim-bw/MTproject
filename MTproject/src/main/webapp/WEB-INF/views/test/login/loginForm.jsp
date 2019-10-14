<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로긴 화면</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/axTest.js"></script>
<script src="resources/jsLib/inchk.js"></script>

</head>
<body>
	<form action="checkLogin" method="post">
<tr><td>I      D : </td>
    <td><input type="text" id="id" name="id" placeholder="아이디를 입력해주세요."><br> 
    <span id=msgi></span></td>
    
</tr>
<tr><td>Password : </td>
    <td><input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요."><br>
    <span id=msgp></span></td>
</tr>
<tr><td></td>
    <td><input type="submit" value="Login" onclick="return idpCheck()"> &nbsp; 
        <input type="reset" value="Reset"><br>
 
         </td>
</tr>
</form>
</table>
<a href="home">[HOME]</a>
</body>
</html>