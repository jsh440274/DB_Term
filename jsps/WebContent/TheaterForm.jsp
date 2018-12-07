<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>  Movie!!!!!!!</title>
</head>
<style media="screen">
    #first{
        display: inline-block;
      }
    </style>
<body>

    <h1>MOVIE Theater</h1>

  <div id="lights">
    <div id="first">
      <h2>Theater</h2>
      <form class="radios" action="TimeTable.jsp" method="get">
        <input type="radio" name="1">Theater 1
        <input type="radio" name="1">Theater 2
        <input type="radio" name="1">Theater 3
        <input type="radio" name="1">Theater 4
        <input type="radio" name="1">Theater 5
        <input type="radio" name="1">Theater 6
        <input type="radio" name="1">Theater 7
        <input type="radio" name="1">Theater 8
        <input type="radio" name="1">Theater 9
        <input type="radio" name="1">Theater 10
        <input type="submit" value="시간표 선택 화면으로">
      </form>
    </div>
  </div>
</body>
</html>