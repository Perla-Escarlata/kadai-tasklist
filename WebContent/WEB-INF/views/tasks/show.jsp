<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <h2>クエスト詳細ページ</h2>

        <table>
            <tbody>

            <tr>
                <th>クエストID</th>
                <td>！<b><c:out value="${task.id}"/></b>！</td>
            </tr>

            <tr>
                <th>名称</th>
                <td><c:out value="${task.title}"/></td>
            </tr>
            <tr>
                <th>詳細</th>
                <td><c:out value="${task.content}"/></td>
            </tr>
            <tr>
                <th>作成日時</th>
                <td><fmt:formatDate value="${task.created_at}" pattern="yyyy-MM-dd HH:mm" /></td>
            </tr>
            <tr>
                <th>更新日時</th>
                <td><fmt:formatDate value="${task.updated_at}" pattern="yyyy-MM-dd HH:mm" /></td>
            </tr>
            </tbody>
        </table>

        <p><a href="${pageContext.request.contextPath}/index">一覧へ戻る</a></p>
        <p><a href="${pageContext.request.contextPath}/edit?id=${task.id}">このクエストを編集する</a></p>


    </c:param>
</c:import>
