<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
</head>
<body>
	<form action="joinb" method="post">
		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="user_id" placeholder="���̵�"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="name" placeholder="�̸�"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pw" placeholder="��й�ȣ"></td>
			</tr>
			<tr>
				<td>��ȭ��ȣ</td>
				<td><input type="tel" name="phone" placeholder="��ȭ��ȣ"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="date" name="birth" placeholder="����"></td>
			</tr>
			<tr>
				<td>
					<button type="submit">����</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>