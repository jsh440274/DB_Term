<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
// ����� ��Ű ��� ������
Cookie[] cookies = request.getCookies();
// ��Ű�� ������
if(cookies!=null)
{
    // ��Ű ����ŭ �ݺ�
    for(int i=0; i<cookies.length; i++)
    {
        // ��Ű���� id �ΰ��
        if(cookies[i].getName().equals("id"))
        {
            // ��Ű�� ��ȿ�Ⱓ�� ���� ��Ŵ
            cookies[i].setMaxAge(0);
            // ��� ����
            response.addCookie(cookies[i]);
        }
    }
}
%>
<script>
// �˸� �޽��� ���
alert("�α׾ƿ� �Ǿ����ϴ�.");
// ������ �������� �̵�
location.href="cookieMain.jsp";
</script>

