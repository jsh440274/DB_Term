<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
// 사용자 쿠키 목록 가져옴
Cookie[] cookies = request.getCookies();
// 쿠키가 있으면
if(cookies!=null)
{
    // 쿠키 수만큼 반복
    for(int i=0; i<cookies.length; i++)
    {
        // 쿠키명이 id 인경우
        if(cookies[i].getName().equals("id"))
        {
            // 쿠키의 유효기간을 만료 시킴
            cookies[i].setMaxAge(0);
            // 쿠기 저장
            response.addCookie(cookies[i]);
        }
    }
}
%>
<script>
// 알림 메시지 출력
alert("로그아웃 되었습니다.");
// 지정된 페이지로 이동
location.href="cookieMain.jsp";
</script>

