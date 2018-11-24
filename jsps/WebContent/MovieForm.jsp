<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie!!!!!!!</title>
<style media="screen">
    #first{
        width: 400px;
        display: inline-block;
      }
      #second{
        width: 400px;
        display: inline-block;
        clear: both;
      }
      #third{
        width: 400px;
        display: inline-block;
      }
      #nextpage{
        display: block;
      }
      .poster{
        width: 300px;
        height: 400px;

      }
    </style>
</head>

<body>
 
    <h1>Movie Choice!</h1>
  
  <div id="lights">
    <form class="" action="Theater.jsp" method="get">
      <div id="first">
        <h2>movie 1</h2>
        <input class="poster" type="image" name="2" id="movie1" src="./보헤미안 랩소디.jpg">
        <input type="radio" name="movie">
      </div>
      <div id="second">
        <h2>movie 2</h2>
        <input class="poster" type="image" name="2" id="movie2" src="./신비한 동물사전.jpeg">
        <input type="radio" name="movie">
      </div>
      <div id="third">
        <h2>movie 3</h2>
        <input class="poster" type="image" name="2" id="movie3" src="./완벽한 타인.jpg">
        <input type="radio" name="movie">
      </div>
      <input type="submit" value="영화관 선택 화면으로">
    </form>
  </div>
</body>
</body>
</html>