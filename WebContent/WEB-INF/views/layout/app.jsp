<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>タスクの王者</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <h1>古今東西タスク制覇の旅</h1>
            </div>
            <div id="content">
                <h3>-楽しく豊かな一滴の調味料（タスク）を♪-</h3>
                <br/>
                ${param.content}
            </div>
            <div id="footer">
                by 艶めくとある深紅の魚卵
            </div>
        </div>
    </body>
</html>