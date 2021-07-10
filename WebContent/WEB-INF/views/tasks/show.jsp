<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task != null}">
                <h2>タスク詳細ページ</h2>

                <table>
                    <tbody>

                        <tr>
                            <th>タスクID</th>
                            <td>！<b><c:out value="${task.id}" /></b>！
                            </td>
                        </tr>

                        <tr>
                            <th>クエストタイトル</th>
                            <td><c:out value="${task.title}" /></td>
                        </tr>
                        <tr>
                            <th>クエスト詳細</th>
                            <td><c:out value="${task.content}" /></td>
                        </tr>
                        <tr>
                            <th>作成日時</th>
                            <td><fmt:formatDate value="${task.created_at}"
                                    pattern="yyyy-MM-dd HH:mm" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${task.updated_at}"
                                    pattern="yyyy-MM-dd HH:mm" /></td>
                        </tr>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p>
            <a href="${pageContext.request.contextPath}/index">一覧へ戻る</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/edit?id=${task.id}">このクエストを編集する</a>
        </p>


    </c:param>
</c:import>
